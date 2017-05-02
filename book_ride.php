<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
    exit;
}
header("Content-Type: application/json; charset=UTF-8");

$getSeatsFromNumberAndScheduleQuery = $con->prepare(<<<'SQL'
SELECT seat.id as seat_id, booking.id IS NOT NULL AS booked FROM seat 
INNER JOIN model ON seat.model_id = model.id
INNER JOIN bus ON model.id = bus.model_id
INNER JOIN route ON bus.id = route.bus_id
INNER JOIN schedule ON route.id = schedule.route_id
LEFT JOIN reservation ON seat.id = reservation.seat_id
LEFT JOIN booking ON reservation.booking_id = booking.id
WHERE num = ? AND schedule.id = ?;
SQL
);

$createBookingQuery = $con->prepare(<<<'SQL'
INSERT INTO booking (stamp, payment_id, schedule_id) VALUES (NOW(), ?, ?);
SQL
);

$createReservationQuery = $con->prepare(<<<'SQL'
INSERT INTO reservation (booking_id, seat_id) VALUES (?, ?);
SQL
);
$getUserDataQuery = $con->prepare(<<<'SQL'
SELECT payment.id AS payment_id FROM user
INNER JOIN payment ON user.id = payment.user_id
WHERE user.id = ?;
SQL
);


function getPaymentId() {
    global  $getUserDataQuery;
    $getUserDataQuery->bind_param('i', $_SESSION['user']);
    $getUserDataQuery->execute();
    if (!($result = $getUserDataQuery->get_result()))
    {
        throw new UnexpectedValueException('Invalid user session');
    }
    $data = $result->fetch_assoc();
    error_log(json_encode($data));
    return $data['payment_id'];
}

function getSeats($seatNums, $scheduleId) {
    global $getSeatsFromNumberAndScheduleQuery;
    $seats = [];
    foreach ($seatNums as $seatNum) {
        $getSeatsFromNumberAndScheduleQuery->bind_param('ii', $seatNum, $scheduleId);
        $getSeatsFromNumberAndScheduleQuery->execute();
        if (!($result = $getSeatsFromNumberAndScheduleQuery->get_result()))
        {
            throw new UnexpectedValueException('There are no matching seats!');
        }
        $seat = $result->fetch_assoc();
        error_log(json_encode($seat));
        if ($seat['booked']) {
            throw new UnexpectedValueException('The seat with id '.$seat['seat_id'].' is already booked');
        }
        $seats[] = $seat;
    }
    return $seats;
}

function addBooking($paymentId, $scheduleId) {
    global $createBookingQuery;
    global $con;
    $createBookingQuery->bind_param('ii', $paymentId, $scheduleId);
    $createBookingQuery->execute();
    $id = $con->insert_id;
    error_log('added booking with id:' .$id);

    //checkAndPrintSQLError("added booking id: $id, schedule: $scheduleId");
    return $id;
}

function addReservation($bookingId, $seatId) {
    global $createReservationQuery;
    global $con;
    $createReservationQuery->bind_param('ii', $bookingId, $seatId);
    $createReservationQuery->execute();
    $id = $con->insert_id;
    error_log('added reservation with id:' .$id);
    //checkAndPrintSQLError("added booking id: $id, schedule: $seatId");
    return $id;
}



if (isset($_POST)) {

    $data = json_decode(file_get_contents('php://input'), true);
    $data['seats'] = array_unique($data['seats']);
    if (!isset($data['seats']) && !isset($data['schedule'])) {
        echo json_encode(['message' => 'Invalid input']);
        http_response_code(400);
        exit();
    }

    if (count($data['seats']) < 1) {
        echo json_encode(['message' => 'No seats were selected']);
        http_response_code(400);
        exit();
    }

    error_log('User wants to book seats: '.json_encode($_SESSION['user']).' '.json_encode($data));

    try {
        $seatIds = getSeats($data['seats'], $data['schedule']);
    } catch (UnexpectedValueException $exception) {
        echo json_encode(['message' => $exception->getMessage()]);
        http_response_code(400);
        exit();
    }

    $paymentId = getPaymentId();
    $bookingId = addBooking($paymentId, $data['schedule']);
    foreach ($data['seats'] as $seat) {
        $reservationId = addReservation($bookingId, $seat);
    }

    echo json_encode(['message' => 'Seats booked.', 'seats' => $seatIds]);

    http_response_code(201);
    exit();
}


ob_end_flush();
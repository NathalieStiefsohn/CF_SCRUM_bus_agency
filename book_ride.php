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
SELECT sea.id AS seat_id, sea.num AS number, discount_id, dis.rate AS discount, row, col, res.res_id IS NOT NULL AS booked FROM schedule AS sch
INNER JOIN route AS rou ON sch.route_id = rou.id
INNER JOIN bus AS bu ON rou.bus_id = bu.id
INNER JOIN model AS mo ON bu.model_id = mo.id
INNER JOIN seat AS sea ON mo.id = sea.model_id
INNER JOIN discount as dis ON sea.discount_id = dis.id
LEFT JOIN (SELECT reservation.id AS res_id, reservation.seat_id FROM schedule INNER JOIN booking ON schedule.id = booking.schedule_id
INNER JOIN reservation ON booking.id = reservation.booking_id WHERE schedule.id = ?) AS res ON sea.id = res.seat_id
WHERE sch.id = ? AND sea.num = ?
;
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
        $getSeatsFromNumberAndScheduleQuery->bind_param('iii', $scheduleId, $scheduleId, $seatNum);
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
        $seats = getSeats($data['seats'], $data['schedule']);
    } catch (UnexpectedValueException $exception) {
        echo json_encode(['message' => $exception->getMessage()]);
        http_response_code(400);
        exit();
    }

    $paymentId = getPaymentId();
    $bookingId = addBooking($paymentId, $data['schedule']);
    foreach ($seats as $seat) {
        $reservationId = addReservation($bookingId, $seat['seat_id']);
    }

    echo json_encode(['message' => 'Seats booked.', 'seats' => $seats]);

    http_response_code(201);
    exit();
}


ob_end_flush();
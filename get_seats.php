<?php
require_once 'dbconnect.php';

header('Content-type: application/json');

$scheduleID = 0;
if (isset($_GET['schedule_id'])) {
    $scheduleID = $con->real_escape_string($_GET['schedule_id']) ;
}
/*
$availabilityQuery = $con->prepare(<<<'SQL'
SELECT * FROM schedule 
INNER JOIN booking ON schedule.id = booking.schedule_id
INNER JOIN reservation ON booking.id = reservation.booking_id
WHERE schedule.id = ?
SQL
);


$availabilityQuery->bind_param('i', $scheduleID);
$availabilityQuery->execute();
$availabilityData = $availabilityQuery->get_result()->fetch_assoc();
*/


$busQuery = $con->prepare(<<<'SQL'
SELECT rows, columns, price FROM route
INNER JOIN bus ON route.bus_id = bus.id
INNER JOIN model ON bus.model_id = model.id
INNER JOIN schedule ON route.id = schedule.route_id
WHERE schedule.id = ?;
SQL
);

$busQuery->bind_param('i', $scheduleID);
$busQuery->execute();
$busData = $busQuery->get_result()->fetch_assoc();

$seatDataQuery = $con->prepare(<<<'SQL'
SELECT sea.num AS number, discount_id, dis.rate AS discount, row, col, res.res_id IS NOT NULL AS booked FROM schedule AS sch
INNER JOIN route AS rou ON sch.route_id = rou.id
INNER JOIN bus AS bu ON rou.bus_id = bu.id
INNER JOIN model AS mo ON bu.model_id = mo.id
INNER JOIN seat AS sea ON mo.id = sea.model_id
INNER JOIN discount as dis ON sea.discount_id = dis.id
LEFT JOIN (SELECT reservation.id AS res_id, reservation.seat_id FROM schedule INNER JOIN booking ON schedule.id = booking.schedule_id
INNER JOIN reservation ON booking.id = reservation.booking_id WHERE schedule.id = ?) AS res ON sea.id = res.seat_id
WHERE sch.id = ?
;
SQL
);
$scheduleRouteDestinationQuery = $con->prepare(<<<'SQL'
SELECT rou.destination FROM schedule as sch 
INNER JOIN route AS rou ON sch.route_id = rou.id
WHERE sch.id = ?
;
SQL
);
$seatBookedQuery = $con->prepare(<<<'SQL'
SELECT * FROM schedule AS sch
INNER JOIN booking ON sch.id = booking.schedule_id
INNER JOIN reservation ON booking.id = reservation.booking_id
WHERE sch.id = ?
;
SQL
);
$addReservationQuery = $con->prepare(<<<'SQL'
INSERT INTO reservation (booking_id, seat_id) VALUES (?, ?);
SQL
);
$addBookingQuery = $con->prepare(<<<'SQL'
INSERT INTO booking (stamp, payment_id, schedule_id) VALUES (NOW(), ?, ?);
SQL
);

$addPaymentQuery = $con->prepare(<<<'SQL'
INSERT INTO payment (user_id, iban) VALUES (?, ?);
SQL
);



$seatDataQuery->bind_param('ii', $scheduleID, $scheduleID);
$seatDataQuery->execute();
$seatDataResult = $seatDataQuery->get_result();
$seatData = [];
$scheduleRouteDestinationQuery->bind_param('i', $scheduleID);
$scheduleRouteDestinationQuery->execute();
$scheduleRouteDestinationResult = $scheduleRouteDestinationQuery->get_result();
$routeDestination = $scheduleRouteDestinationResult->fetch_assoc();
while ($seat = $seatDataResult->fetch_assoc()) {
    $seat['booked'] = (bool)$seat['booked'];
    $seatData[] = $seat;
}
$busData['destination'] = $routeDestination['destination'];
$busData['seats'] = $seatData;
echo json_encode($busData);
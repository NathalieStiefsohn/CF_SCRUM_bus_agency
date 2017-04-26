<?php
require_once 'dbconnect.php';

header('Content-type: application/json');


$destination = 'Vienna-Bratislava';
$scheduleID = 1;
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
SELECT rows, columns FROM route
INNER JOIN bus ON route.bus_id = bus.id
INNER JOIN model ON bus.model_id = model.id
WHERE destination = ?;
SQL
);

$busQuery->bind_param('s', $destination);
$busQuery->execute();
$busData = $busQuery->get_result()->fetch_assoc();

$seatDataQuery = $con->prepare(<<<'SQL'
SELECT sea.num AS number, row, col, res.id IS NOT NULL AS booked FROM schedule AS sch
INNER JOIN route AS rou ON sch.route_id = rou.id
INNER JOIN bus AS bu ON rou.bus_id = bu.id
INNER JOIN model AS mo ON bu.model_id = mo.id
INNER JOIN seat AS sea ON mo.id = sea.model_id
LEFT JOIN reservation AS res ON sea.id = res.seat_id
WHERE rou.destination = ? AND sch.id = ?
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



$seatDataQuery->bind_param('si', $destination, $scheduleID);
$seatDataQuery->execute();
$seatDataResult = $seatDataQuery->get_result();
$seatData = [];
while ($seat = $seatDataResult->fetch_assoc()) {
    $seat['booked'] = (bool)$seat['booked'];
    $seatData[] = $seat;
}
$busData['seats'] = $seatData;
echo json_encode($busData);
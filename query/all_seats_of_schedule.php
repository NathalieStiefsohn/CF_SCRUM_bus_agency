<?php
$allSeatsOfSchedule = "SELECT sea.num AS number, discount_id, dis.rate AS discount, row, col, res.id IS NOT NULL AS booked FROM schedule AS sch
INNER JOIN route AS rou ON sch.route_id = rou.id
INNER JOIN bus AS bu ON rou.bus_id = bu.id
INNER JOIN model AS mo ON bu.model_id = mo.id
INNER JOIN seat AS sea ON mo.id = sea.model_id
INNER JOIN discount as dis ON sea.discount_id = dis.id
LEFT JOIN reservation AS res ON sea.id = res.seat_id
WHERE sch.id = ?";

<?php
// Report:  List all bookings and seats
$availableSchedulesQuery = $con->prepare(<<<'SQL'
SELECT
  sch.id AS schedule_id,
  rou.destination,
  sch.departure_time,
  rou.duration,
  mo.seats - count(res.id) AS available
  
FROM schedule AS sch
INNER JOIN route AS rou ON sch.route_id = rou.id
INNER JOIN bus AS bu ON rou.bus_id = bu.id
INNER JOIN model AS mo ON bu.model_id = mo.id
INNER JOIN booking AS boo ON sch.id = boo.schedule_id
INNER JOIN reservation AS res ON boo.id = res.booking_id

WHERE rou.destination = ? AND sch.departure_date LIKE ?
GROUP BY sch.id
;
SQL
);

$query_select_schedule = 
    "
        SELECT 
            schedule.id AS schedule_id,
            destination,
            departure_time,
            duration
        FROM `schedule`
            INNER JOIN `route` on schedule.route_id = route.id
        WHERE 
            destination = '".$route."' 
            AND schedule.departure_date LIKE '".$dep_date."'  
    ";

$res_select_schedule = mysqli_query($con, $query_select_schedule);
// $row_select_schedule = mysqli_fetch_array($res_select_schedule);
$count_select_schedule = mysqli_num_rows($res_select_schedule);
?>
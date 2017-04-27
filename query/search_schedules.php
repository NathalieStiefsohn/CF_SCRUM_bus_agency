<?php
// Report:  List all bookings and seats
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
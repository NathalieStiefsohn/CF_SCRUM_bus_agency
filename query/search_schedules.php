<?php
// Report:  List all bookings and seats
$query_select_schedule = 
    "
        SELECT 
            schedule.id AS schedule_id,
            destination,
            departure
        FROM `schedule`
            INNER JOIN `route` on schedule.route_id = route.id
        WHERE 
            destination=".$destination." 
            AND schedule.departure BETWEEN '".$dep_date." 00:00:00' AND '".$dep_date." 23:59:59'
            // AND date_format(date(schedule.departure), 
    ";

$res_select_schedule = mysqli_query($con, $query_select_schedule);
// $row_select_schedule = mysqli_fetch_array($res_select_schedule);
// $count_select_schedule = mysqli_num_rows($res_select_schedule);
?>
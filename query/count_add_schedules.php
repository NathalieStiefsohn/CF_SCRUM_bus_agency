
<?php
// Report:  count schedules for add schedules
$query_count_schedules = 
    "
         SELECT  * 
    from 
        schedule 
    WHERE 
        departure_date=STR_TO_DATE('".$date."', '%m/%d/%Y')
        AND route_id=".$route."
        AND departure_time=STR_TO_DATE('".$date."', '%g:%i:%s')

    ";

$res_count_schedules = mysqli_query($con, $query_count_schedules);
// $row_count_schedules = mysqli_fetch_array($res_count_schedules);
$count_count_schedules = mysqli_num_rows($res_count_schedules);
?>
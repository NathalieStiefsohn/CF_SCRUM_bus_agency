
<?php
// Report:  add schedule
$query_add_schedule = 
    "
        INSERT INTO schedule 
        	(route_id, departure_date, departure_time) 
    	VALUES 
    		($route, '$date', '$time')

    ";

$res_add_schedule = mysqli_query($con, $query_add_schedule);
// $row_add_schedule = mysqli_fetch_array($res_add_schedule);
// $count_add_schedule = mysqli_num_rows($res_add_schedule);
?>
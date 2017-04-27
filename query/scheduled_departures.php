<?php
// Report:  List current scheduled departures
$query_current_scheduled_depurtures = 
<<<SQL
        SELECT 
            schedule.id AS schedule_id, 
            route.destination AS destination,
            date_format(schedule.departure_date,'%a %d %M %Y') AS departure_date,
            date_format(schedule.departure_time,'%H:%i') AS departure_time,
            route.min_seats AS min_seats,
            count(reservation.id) AS booked,
            model.seats AS total_seats 
        FROM 
            reservation
            INNER JOIN `booking` ON `reservation`.`booking_id` = `booking`.`id`
            INNER JOIN `schedule` ON `booking`.`schedule_id` = `schedule`.`id`
            INNER JOIN `route` ON `schedule`.`route_id` = `route`.`id`
            INNER JOIN `bus`ON `route`.`bus_id` = `bus`.`id`
            INNER JOIN `model` ON `bus`.`model_id`= `model`.`id`
        GROUP BY
            schedule.id;
SQL;

$res_historic_user_reservations = mysqli_query($con, $query_historic_user_reservations);
$row_historic_user_reservations = mysqli_fetch_array($res_historic_user_reservations);
$count_historic_user_reservations = mysqli_num_rows($row_historic_user_reservations);
?>
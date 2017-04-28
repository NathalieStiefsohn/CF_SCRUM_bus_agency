<?php
// Report:  List current scheduled departures
$query_search_current_scheduled_depurtures = 
    "
        SELECT 
            schedule.id AS schedule_id, 
            route.destination AS destination,
            date_format(schedule.departure_date,'%d %M %Y') AS departure_date,
            date_format(schedule.departure_time,'%H:%i') AS departure_time,
            route.min_seats AS min_seats,
            model.seats AS max_seats,
            count(reservation.id) AS reservations,
            date_format(route.duration,'%H:%i') AS duration
        FROM 
            `schedule`
            INNER JOIN `route` ON schedule.route_id = route.id
            INNER JOIN `bus`ON `route`.`bus_id` = `bus`.`id`
            INNER JOIN `model` ON `bus`.`model_id`= `model`.`id`
            LEFT JOIN `booking` on schedule.id = booking.schedule_id
            LEFT JOIN `reservation` on booking.id = reservation.booking_id

        WHERE
            date(schedule.departure_date) > NOW()
            AND (
            route.destination LIKE '%$search%'
            OR  date_format(schedule.departure_date,'%d %M %Y') LIKE '%$search%'   
            )
        GROUP BY 
            schedule.id
        ORDER BY 
            departure_date DESC;
    ";

$res_search_current_scheduled_depurtures = mysqli_query($con, $query_search_current_scheduled_depurtures);
// $row_current_scheduled_depurtures = mysqli_fetch_array($res_current_scheduled_depurtures);
$count_search_current_scheduled_depurtures = mysqli_num_rows($res_search_current_scheduled_depurtures);



?>
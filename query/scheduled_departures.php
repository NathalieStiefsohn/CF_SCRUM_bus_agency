<?php
// Report:  List current scheduled departures
$query_current_scheduled_depurtures = 
"
        SELECT 
            schedule.id AS schedule_id, 
            route.destination AS destination,
            date_format(schedule.departure_date,'%d %M %Y') AS departure_date,
            date_format(schedule.departure_time,'%H:%i') AS departure_time,
            route.min_seats AS min_seats,

            model.seats AS max_seats,
            count(reservation.id) AS reservations,
            date_format(route.duration,'%H:%i') AS duration,
            model.seats AS total_seats 

        FROM 
            schedule
        INNER JOIN `route` ON `schedule`.`route_id` = `route`.`id`
        INNER JOIN `bus`ON `route`.`bus_id` = `bus`.`id`
        INNER JOIN `model` ON `bus`.`model_id`= `model`.`id`
    

        LEFT JOIN `booking` on schedule.id = booking.schedule_id
        LEFT JOIN `reservation` on booking.id = reservation.booking_id

        WHERE
            schedule.departure_date > NOW()
        GROUP BY 
            schedule.id
        ORDER BY 
            departure_date DESC;
    ";

$res_current_scheduled_depurtures = mysqli_query($con, $query_current_scheduled_depurtures);
// $row_current_scheduled_depurtures = mysqli_fetch_array($res_current_scheduled_depurtures);
$count_current_scheduled_depurtures = mysqli_num_rows($res_current_scheduled_depurtures);

// Report:  Number of availble seats
// SELECT 
//     count(reservation.id) 
// FROM `reservation`
//     INNER JOIN `booking` on booking.id = reservation.booking_id
//     INNER JOIN `schedule` on schedule.id = booking.schedule_id
// GROUP BY 
//     schedule.id;


           
// date_format(date(schedule.departure),'%H %i') AS departure_time,  

//     INNER JOIN `payment` on user.id = payment.user_id
//     INNER JOIN `booking` on payment.id = booking.payment_id
    
//     INNER JOIN `seat` on reservation.seat_id = seat.id
//     INNER JOIN `schedule` on booking.schedule_id = schedule.id
//     INNER JOIN `route` on schedule.route_id = route.id


// test

// SELECT date_format(schedule.departure,'%H:%i') FROM `schedule`;


//  INNER JOIN `payment` on user.id = payment.user_id
//             INNER JOIN `booking` on payment.id = booking.payment_id
//             INNER JOIN `reservation` on booking.id = reservation.booking_id
//             INNER JOIN `seat` on reservation.seat_id = seat.id
//             INNER JOIN `schedule` on booking.schedule_id = schedule.id

//         GROUP BY
//             schedule.id;
// SQL;


?>
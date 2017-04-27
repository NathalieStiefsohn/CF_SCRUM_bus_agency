<?php
// Report:  List current scheduled departures
$query_current_scheduled_depurtures = 
    "
        SELECT 
            route.destination,
            date_format(date(schedule.departure),'%a %d %M %Y')
        FROM 
            `route`;

            `schedule`
                INNER JOIN `payment` on user.id = payment.user_id
                INNER JOIN `booking` on payment.id = booking.payment_id
                INNER JOIN `reservation` on booking.id = reservation.booking_id
                INNER JOIN `seat` on reservation.seat_id = seat.id
                INNER JOIN `schedule` on booking.schedule_id = schedule.id
                INNER JOIN `route` on schedule.route_id = route.id;
    ";

// Report:  Number of availble seats
SELECT 
    count(reservation.id) 
FROM `reservation`
    INNER JOIN `booking` on booking.id = reservation.booking_id
    INNER JOIN `schedule` on schedule.id = booking.schedule_id
GROUP BY 
    schedule.id;


           
            date_format(date(schedule.departure),'%H %i') AS departure_time,  

    INNER JOIN `payment` on user.id = payment.user_id
    INNER JOIN `booking` on payment.id = booking.payment_id
    
    INNER JOIN `seat` on reservation.seat_id = seat.id
    INNER JOIN `schedule` on booking.schedule_id = schedule.id
    INNER JOIN `route` on schedule.route_id = route.id


// test

SELECT DATE_FORMAT(schedule.departure,'%H:%i') TIMEONLY FROM `schedule`;

 SELECT date_format(date(schedule.departure),'%H %i') FROM `schedule`

 SELECT EXTRACT(HOUR_MINUTE FROM date(schedule.departure) FROM `schedule`;


SELECT CAST(DATEPART(HOUR,   GETDATE())AS VARCHAR(2)) + ':' +
       CAST(DATEPART(MINUTE, GETDATE())AS VARCHAR(2))

SELECT DATEPART(hh,schedule.departure) AS hour,
DATEPART(mi,schedule.departure) AS minute
FROM 'schedule'
WHERE OrderId=1 


$res_historic_user_reservations = mysqli_query($con, $query_historic_user_reservations);
$row_historic_user_reservations = mysqli_fetch_array($res_historic_user_reservations);
$count_historic_user_reservations = mysqli_num_rows($row_historic_user_reservations);
?>
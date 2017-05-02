<?php

$availableSeats = 
<<<SQL
    SELECT 
        count(reservation.id) AS reservations 
    FROM 
        schedule 
        INNER JOIN route ON schedule.route_id = route.id
        INNER JOIN bus ON route.bus_id = bus.id
        INNER JOIN model ON bus.model_id = model.id
        INNER  JOIN seat ON model.id = seat.model_id
        INNER JOIN reservation ON seat.id = reservation.seat_id
    WHERE 
        schedule.id = 1;
SQL;
?>
<?php
$busDimensionsAndPrice = "SELECT rows, columns, price FROM route
INNER JOIN bus ON route.bus_id = bus.id
INNER JOIN model ON bus.model_id = model.id
INNER JOIN schedule ON route.id = schedule.route_id
WHERE schedule.id = ?;";
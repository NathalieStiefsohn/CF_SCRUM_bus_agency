<?php
require_once 'dbconnect.php';
require 'includes/bus_layout_data.php';

$getModelQuery = $con->prepare(<<<'SQL'
SELECT id FROM model WHERE seats = ?;
SQL
);

$truncateModelsQuery = $con->prepare(<<<'SQL'
TRUNCATE TABLE model;
SQL
);

$createModelQuery = $con->prepare(<<<'SQL'
INSERT INTO model (seats, rows, columns) VALUES (?, ?, ?);
SQL
);

$getDiscountQuery = $con->prepare(<<<'SQL'
SELECT id FROM discount WHERE rate = ?;
SQL
);

$truncateSeatsQuery = $con->prepare(<<<'SQL'
TRUNCATE TABLE seat;
SQL
);

$createSeatQuery = $con->prepare(<<<'SQL'
INSERT INTO seat (model_id, num, row, col, discount_id) 
VALUES (?, ?, ?, ?, ?);
SQL
);

$createBusQuery = $con->prepare(<<<'SQL'
INSERT INTO bus (model_id) 
VALUES (?);
SQL
);

function checkAndPrintSQLError($successMessage) {
    global $con;
    $error = $con->error;
    if ($error) {
        echo "<p>MySQL error:: $error</p>";
    } else {
        echo $successMessage;
    }
}

function addBusModel($seatCount, $seatRows, $seatColumns) {
    global $createModelQuery;
    global $con;
    $createModelQuery->bind_param('iii', $seatCount, $seatRows, $seatColumns);
    $createModelQuery->execute();
    $id = $con->insert_id;
    checkAndPrintSQLError("<p>added new bus model id: $id, seats: $seatCount, seat rows: $seatRows, columns: $seatColumns</p>");
    return $id;
}

function getModelId($seatCount) {
    global $getModelQuery;
    $getModelQuery->bind_param('i', $seatCount);
    $getModelQuery->execute();
    $modelResult = $getModelQuery->get_result();
    checkAndPrintSQLError('<p>get Bus Model</p>');
    $data = $modelResult->fetch_assoc();
    if (isset($data['id'])) {
        return $data['id'];
    }
    return null;
}



function addSeat($modelId, $seatNum, $row, $col, $discountId) {
    global $createSeatQuery;
    global $con;
    $createSeatQuery->bind_param('iiiii', $modelId, $seatNum, $row, $col, $discountId);
    $createSeatQuery->execute();
    $id = $con->insert_id;
    checkAndPrintSQLError("<p>added seat id: $id, number: $seatNum in row $row, col $col, discountID: $discountId</p>");
    return $id;
}

function addBus($modelId) {
    global $createBusQuery;
    global $con;
    $createBusQuery->bind_param('i', $modelId);
    $createBusQuery->execute();
    $id = $con->insert_id;
    checkAndPrintSQLError("<p>added bus id: $id, model $modelId</p>");
    return $id;
}

function addBusLayout($modelId, $seatData)
{
    $seatNum = 1;
    foreach ($seatData as $rowNum => $seatRow) {
        foreach ($seatRow as $colNum => $seatDiscountId) {
            if ($seatDiscountId >= 1) {
                addSeat($modelId, $seatNum, $rowNum+1, $colNum+1, $seatDiscountId);
                echo "";
                $seatNum++;
            }
        }
    }
}


//$truncateModelsQuery->execute();
//$truncateSeatsQuery->execute();
global $codeBusLayout12;
global $codeBusLayout42;
global $codeBusLayout56;





$codeBus56Id = addBusModel(56, 15, 6);
addBusLayout($codeBus56Id, $codeBusLayout56);
error_log("busId: $codeBus56Id");
addBus($codeBus56Id);
addBus($codeBus56Id);
addBus($codeBus56Id);

$codeBus42Id = addBusModel(42, 11, 6);
error_log("busId: $codeBus42Id");
addBusLayout($codeBus42Id, $codeBusLayout42);
addBus($codeBus42Id);

$codeBus12Id = addBusModel(12, 6, 3);
error_log("busId: $codeBus42Id");
addBusLayout($codeBus12Id, $codeBusLayout12);
addBus($codeBus12Id);

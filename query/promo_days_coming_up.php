<?php

$query_promo_day = 
    "
        SELECT 
            date_format(date(event),'%d %M %Y') AS event
        FROM `holiday`

        WHERE 
			`event` BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY) 
		ORDER BY event DESC;
    ";

$res_promo_day = mysqli_query($con, $query_promo_day);
// $row_promo_day = mysqli_fetch_array($res_promo_day);
$count_promo_day = mysqli_num_rows($res_promo_day);
$hide ="";
if ($count_promo_day == 0){
	$hide = "hidden";
}
?>
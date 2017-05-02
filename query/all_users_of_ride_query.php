<?php
// Report:  List all users
$query_all_users = "
    SELECT 
        user.id AS user_id,
        admin.id AS admin_id,
        title.name AS title,
        first_name,
        last_name,
        email,
        tel,
        iban
    FROM `user`
        LEFT JOIN admin ON user.id=admin.user_id
        INNER JOIN `payment` on user.id = payment.user_id
        INNER JOIN `title` on title.id = user.title_id
        INNER JOIN booking ON payment.id=booking.payment_id
        INNER JOIN schedule ON booking.schedule_id=schedule.id
    WHERE schedule.id = ".$schedule_id." 
    GROUP BY 
        user.id
    ORDER BY 
        last_name ASC;
";

$res_all_users = mysqli_query($con, $query_all_users);
// $row_all_users = mysqli_fetch_array($res_all_users);
$count_all_users = mysqli_num_rows($res_all_users);
?>
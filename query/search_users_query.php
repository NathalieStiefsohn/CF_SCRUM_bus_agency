
<?php
// Report:  List all users
$query_users = 
    "
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
        WHERE 
        	title.name LIKE '%$search%'
			OR first_name LIKE '%$search%'
			OR last_name LIKE '%$search%'
			OR email LIKE '%$search%'
			OR tel LIKE '%$search%'
			OR iban LIKE '%$search%'
		GROUP BY user.id
		ORDER BY last_name ASC;

    ";

$res_users = mysqli_query($con, $query_users);
// $row_users = mysqli_fetch_array($res_users);
$count_users = mysqli_num_rows($res_users);
?>
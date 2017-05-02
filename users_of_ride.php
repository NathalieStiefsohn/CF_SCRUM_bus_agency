<?php
require_once('includes/start_session_admin.php');
?>
<?php
	$errTyp="";
	$errMSG="";
	$hidden="";
	$count_all_users = "";
	$count_users = "";
	require'query/all_users_query.php';

	if ( isset($_GET['btn-search']) ){
		$search = trim($_GET['search']);
 		$search = strip_tags($search);
  		$search = htmlspecialchars($search);
		
  		require 'query/search_users_query.php';
	}


?>
<?php
	if(isset($_GET['schedule_id'])){
		$schedule = $_GET['schedule_id'];
		
		
	} else {
		header("Location: all_rides.php");
	}
	
?>
<!DOCTYPE html>
<html>
<head>
	<title>All Rides - Admin</title>
	<?php
require_once('includes/head_tag.php');
	?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container clear-top">

	<div class="navbar navbar-inverse navbar-fixed-top">	
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target=".navbar-collapse">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <!-- <a class="navbar-brand" href="#">Brand</a> -->

	    </div>
	    <div class="collapse navbar-collapse">
	      <ul class="nav navbar-nav">
	        <li><a href="home_admin.php">Risky Rides</a></li>
	        <li class="active"><a href="all_rides.php">All Rides</a></li>
	        <li><a href="all_users.php">All Users</a></li>
	        <li><a href="add_holidays.php">Manage Promo Days</a></li>
	        <li><a href="add_schedules.php">Add Schedules</a></li>
	      </ul>

	    </div><!--/.nav-collapse -->
			        	<?php
	require_once('includes/switch_admin_view.php');
		?>

	  </div>
		<?php
	require_once('includes/header.php');
		?>

<!-- main -->
	<div class="row">
		<div class="col-xs-12">
			<section class="row">
				<div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						All Users
					
					<?php
						if(isset($_GET['search'])){
							echo'
								<label class="label background_bc1 color_bc3">'.$count_users.'</label>
							';
						} else {
							echo'
								<label class="label background_bc1 color_bc3">'.$count_all_users.'</label>
							';
						}

					?>
					</h3>
					<hr class="border_bc1 ">	
				</div>
				


		<?php
require_once('includes/alert_box.php');
		?>

			<div class="<?php echo $hidden; ?>">

<?php
require_once('includes/search_bar.php');
		?>

		
		<div class="col-xs-12">
			<table class="table" id="all_users_table">
				<thead>
			      <tr>
			        <th>Title</th>
			        <th>First Name</th>
			        <th>Last Name</th>
			        <th>E-Mail</th>
			        <th>Tel Nr</th>
			        <th>IBAN</th>
			        <th class="text-center">Admin-Rights</th>
			        <th>Rides</th>
			      </tr>
			    </thead>
			    <tbody>
			<?php 			
				 // select all available users
				 
				if ( isset($_GET['btn-search']) ){
					

					if ($count_users == 1){
						echo "<h4 class='text-center'>We found ".$count_users." result for '".$search."'.</h4> <hr>";
					} else if ($count_users == 0) {
					echo '<div class="alert alert-danger">
							<h4 class="text-center">Unfortunately there are no results for "'.$search.'". <br></h4> 
						</div><hr>';
					} else {
						echo "<h4 class='text-center'>We found ".$count_users." results for '".$search."'.</h4> <hr>";
					}
					$i = 0;
			  		while($row_users = mysqli_fetch_array($res_users)){
				  		$title = $row_users['title'];
				  		$first_name = $row_users['first_name'];
				  		$family_name = $row_users['last_name'];
				  		$email = $row_users['email'];
				  		$iban = $row_users['iban'];
				  		$tel = $row_users['tel'];
				  		$admin_id = $row_users['admin_id'];
				  		$user_id = $row_users['user_id'];
				  		
				  	
				  		echo 	'<tr> 
									<td>'.$title.'</td>
									<td>'.$first_name.'</td>
									<td>'.$family_name.'</td>
									<td>'.$email.'</td>
									<td>'.$tel.'</td>
									<td>'.$iban.'</td>
									<td class="text-center">';

						if (empty($admin_id)) {
							echo '<form method="post" action="all_users.php?user_id='.$user_id.'">
											<input type="submit" class="btn btn-success" value="Give" id="btn-give_admin_rights" name="btn-give_admin_rights">
										</form>
						  	';
						} else {
							echo '<form method="post" action="all_users.php?remove_rights_user_id='.$user_id.'">
									<input type="submit" class="btn btn-primary background_bc1" value="Remove" id="btn-remove_admin_rights" name="btn-remove_admin_rights">
								</form>
						  	';
						}
						echo '		</td>
									<td>
										<form method="post" action="users_rides_admin.php?user_id_rides='.$user_id.'">
											<input type="submit" class="btn btn-primary background_bc1" value="Rides" id="btn-users_rides" name="btn-users_rides">
										</form>
									</td>

								</tr>';
			  		}
				} else {

					

					
			  		while($row_all_users = mysqli_fetch_array($res_all_users)){
				  		$title = $row_all_users['title'];
				  		$first_name = $row_all_users['first_name'];
				  		$family_name = $row_all_users['last_name'];
				  		$email = $row_all_users['email'];
				  		$tel = $row_all_users['tel'];
				  		$iban = $row_all_users['iban'];
				  		$admin_id = $row_all_users['admin_id'];
				  		$user_id = $row_all_users['user_id'];
				  		
				  		echo 	'<tr> 
									<td>'.$title.'</td>
									<td>'.$first_name.'</td>
									<td>'.$family_name.'</td>
									<td>'.$email.'</td>
									<td>'.$tel.'</td>
									<td>'.$iban.'</td>
									<td class="text-center">';

						if (empty($admin_id)) {
							echo '<form method="post" action="all_users.php?user_id='.$user_id.'">
											<input type="submit" class="btn btn-success" value="Give" id="btn-give_admin_rights" name="btn-give_admin_rights">
										</form>
						  	';
						} else {
							echo '<form method="post" action="all_users.php?remove_rights_user_id='.$user_id.'">
									<input type="submit" class="btn btn-primary background_bc1" value="Remove" id="btn-remove_admin_rights" name="btn-remove_admin_rights">
								</form>
						  	';
						}
						echo '</td>
									<td>
										<form method="post" action="users_rides_admin.php?user_id_rides='.$user_id.'">
											<input type="submit" class="btn btn-primary background_bc1" value="Rides" id="btn-users_rides" name="btn-users_rides">
										</form>
									</td>

								</tr>';
			  		}
  				}
	  				
			?>
				</tbody>
			</table>
		</div>
<!-- below is the div which closes the $hidden wrappen -->
</div>

			</section>
		</div>
	</div>
<!-- end wrapper to put footer on the bottom of the page -->
  </div>
</div>
	<!-- footer -->
	<?php
require_once('includes/footer.php');
	?>
	 
</body>
</html>
<?php ob_end_flush(); ?>
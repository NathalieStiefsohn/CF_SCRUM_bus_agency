<?php
require_once('includes/start_session_admin.php');
?>
<?php
	$errTyp="";
	$errMSG="";
	$hidden="";

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
						All Rides
					
					<?php
						if(isset($_GET['search'])){
							echo'
								<label class="label background_bc1 color_bc3">'.$count_search_current_scheduled_depurtures.'</label>
							';
						} else {
							echo'
								<label class="label background_bc1 color_bc3">'.$count_current_scheduled_depurtures.'</label>
							';
						}

					?>
					</h3>
					<hr class="border_bc1 ">	
				</div>
				

			<div class="<?php echo $hidden; ?>">

<?php
require_once('includes/search_bar.php');
		?>

		
		<div class="col-xs-12">
			<table class="table table-responsive table-hover" id="all_users_table">
				<thead>
			      <tr>
			      	<th>Route</th>
			        <th>Day</th>
			        <th>Time</th>
			        <th>Duration</th>
			        <th>Reservations</th>
			        <th>min Reservations<br>needed</th>
			        <th>Used Capacity</th>
			        <th>Users</th>
			      </tr>
			    </thead>
			    <tbody>
			<?php 			
				 // select all available users
				 
				if ( isset($_GET['btn-search']) ){
			
			  		

					if ($count_search_current_scheduled_depurtures == 1){
						echo "<h4 class='text-center'>We found ".$count_search_current_scheduled_depurtures." result for '".$search."'.</h4> <hr>";
					} else if ($count_search_current_scheduled_depurtures == 0) {
					echo '<div class="alert alert-danger">
							<h4 class="text-center">Unfortunately there are no results for "'.$search.'". <br></h4> 
						</div><hr>';
					} else {
						echo "<h4 class='text-center'>We found ".$count_search_current_scheduled_depurtures." results for '".$search."'.</h4> <hr>";
					}
					$i = 0;
			  		while($row_search_current_scheduled_depurtures = mysqli_fetch_array($res_search_current_scheduled_depurtures)){
				  		$route = $row_search_current_scheduled_depurtures['destination'];
				  		$departure_date = $row_search_current_scheduled_depurtures['departure_date'];
				  		$departure_time = $row_search_current_scheduled_depurtures['departure_time'];
				  		$duration = $row_search_current_scheduled_depurtures['duration'];
				  		$reservations = $row_search_current_scheduled_depurtures['reservations'];
				  		$min_seats = $row_search_current_scheduled_depurtures['min_seats'];
				  		$max_seats = $row_search_current_scheduled_depurtures['max_seats'];
				  		$schedule_id = $row_search_current_scheduled_depurtures['schedule_id'];
				  		
				  		
				  		$min_needed = $min_seats-$reservations;
				  		if($min_needed <0){
				  			$min_needed = 0;
				  		}

				  		$used_capacity = round(($reservations/$max_seats)*100);

				  		echo 	'<tr> 
									<td>'.$route.'</td>
									<td>'.$departure_date.'</td>
									<td>'.$departure_time.'</td>
									<td>'.$duration.'</td>
									<td>'.$reservations.'</td>
									<td>'.$min_needed.'</td>
									<td>'.$used_capacity.'%</td>
									<td>
										<form method="post" action="users_of_ride.php?schedule_id='.$schedule_id.'">
											<input type="submit" class="btn btn-primary background_bc1" value="Users" id="btn-display_users" name="btn-display_users">
										</form>
									</td>
								</tr>';
			  		}
				} else {

					
					
					
			  		while($row_current_scheduled_depurtures = mysqli_fetch_array($res_current_scheduled_depurtures)){
				  		$route = $row_current_scheduled_depurtures['destination'];
				  		
				  		$departure_date = $row_current_scheduled_depurtures['departure_date'];
				  		$departure_time = $row_current_scheduled_depurtures['departure_time'];
				  		$duration = $row_current_scheduled_depurtures['duration'];
				  		$reservations = $row_current_scheduled_depurtures['reservations'];
				  		$min_seats = $row_current_scheduled_depurtures['min_seats'];
				  		$max_seats = $row_current_scheduled_depurtures['max_seats'];
				  		$schedule_id = $row_current_scheduled_depurtures['schedule_id'];
				  		
				  		
				  		$min_needed = $min_seats-$reservations;
				  		if($min_needed <0){
				  			$min_needed = 0;
				  		}

				  		$used_capacity = round(($reservations/$max_seats)*100);

				  		echo 	'<tr> 
									<td>'.$route.'</td>
									<td>'.$departure_date.'</td>
									<td>'.$departure_time.'</td>
									<td>'.$duration.'</td>
									<td>'.$reservations.'</td>
									<td>'.$min_needed.'</td>
									<td>'.$used_capacity.'%</td>
									<td>
										<form method="post" action="users_of_ride.php?schedule_id='.$schedule_id.'">
											<input type="submit" class="btn btn-primary background_bc1" value="Users" id="btn-display_users" name="btn-display_users">
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
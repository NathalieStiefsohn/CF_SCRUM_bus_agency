<?php
require_once('includes/start_session_admin.php');
?>

<?php
	if(isset($_GET['user_id_rides'])){
		$user_id = $_GET['user_id_rides'];
	} else {
		header("Location: all_users.php");
	}
?>
<?php

$errTyp="";
$errMSG="";
$reservation_id="";


if(isset($_GET['reservation_id'])){



	$reservation_id = $_GET['reservation_id'];
	if (!empty($reservation_id)){

		$delete_query="DELETE FROM RESERVATION WHERE reservation.id=".$reservation_id;
		$res_delete = mysqli_query($con, $delete_query);
		if ($res_delete) {
			    $errTyp = "alert-success";
			    $errMSG = "The reservation was successfully canceled!";

			    unset($reservation_id);

			   } else {
			    $errTyp = "alert-danger";
			    $errMSG = "Something went wrong, try again later...";
			    // echo $errMSG;
			   }
	}
}


require_once 'query/admin_my_historic_booking.php';
require_once 'query/admin_my_current_booking.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title>All Users - Admin</title>
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
	        <li><a href="all_rides.php">All Rides</a></li>
	        <li><a href="all_users.php">All Users</a></li>
	        <li class="active"><a href="users_rides_admin.php">User's Rides</a></li>
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
 <!-- tabs  -->
      	<div class="row margin-top" id="my_reservations_row">
	        <ul class="nav nav-tabs">
	          <li class="active"><a href="#a" data-toggle="tab">Current</a></li>
	          <li><a href="#b" data-toggle="tab">Historic</a></li>
	        </ul>
	        <div class="tab-content">
				<div class="col-xs-12 tab-pane active" id="a">
					<div class="row">
						<div class="col-xs-12">
							<h3 class="brandfont text-center color_bc1">
								User's Current Reservations 
								<?php
								echo'
									<label class="label background_bc1 color_bc3">'.$count_current_user_reservations.'</label>
								';
								?>

							</h3>
							<hr class="border_bc1 ">	
						</div>
						<?php
							require 'includes/alert_box.php';	

						?>
						<div class="col-xs-12 margin-top">
							<div class="row">


							<?php
								while($row_current_user_reservations = mysqli_fetch_array($res_current_user_reservations)){
									// $first_name = $row['first_name'];  
								 //    $last_name = $row['last_name'];
								    $booking_id = $row_current_user_reservations['booking_id'];
								    $booking_day = $row_current_user_reservations['booking_day'];
								    $departure_day = $row_current_user_reservations['departure_day'];
								    $destination = $row_current_user_reservations['destination'];
								    $seat_number = $row_current_user_reservations['seat_number'];
								    $reservation_id = $row_current_user_reservations['reservation_id'];
								    $departure_time =$row_current_user_reservations['departure_time'];
								 echo '
							    	<form method="POST" action="users_rides_admin.php?reservation_id='.$reservation_id.'&user_id_rides='.$user_id.'" class="col-xs-12 col-sm-6">
								    	<div id="generate_destination">
								    		<div class=panel panel-default wrap_destination"> 
									    		<div class="panel panel-default">
													<div class="panel-heading background_bc1 color_bc3 brandfont"><h4><b>'.$destination.'</b></h4></div>
													<div class="panel-body color_bc2">
														<h4 class="text-right"><b>Booking Nr. 	</b>'.$booking_id.'</h4>									
														<h4><b>Departure: </b>'.$departure_day.' - '.$departure_time.'</h4>

														<h4><b>Seat Nr. </b>'.$seat_number.'</h4>
														<button type="submit" class="btn background_bc1 color_bc3 pull-right">Cancel Reservation</button>
													</div>
												</div>
											</div>
										</div>
									</form>
									';

								}						
							?>

							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 tab-pane" id="b">
					<div class="row">
						<div class="col-xs-12">
							<h3 class="brandfont text-center color_bc1">
								User's Historic Reservations
								<?php
								echo'
									<label class="label background_bc1 color_bc3">'.$count_historic_user_reservations.'</label>
								';
								?>
							</h3>
							<hr class="border_bc1 ">	
						</div>
						<div class="col-xs-12 margin-top">
							<div class="row margin-top">					
		
							<?php
								
								while($row_historic_user_reservations = mysqli_fetch_array($res_historic_user_reservations)){
									// $first_name = $row['first_name'];  
								 //    $last_name = $row['last_name'];
								    $booking_id = $row_historic_user_reservations['booking_id'];
								    $booking_day = $row_historic_user_reservations['booking_day'];
								    $departure_day = $row_historic_user_reservations['departure_day'];
								    $destination = $row_historic_user_reservations['destination'];
								    $seat_number = $row_historic_user_reservations['seat_number'];
								    $reservation_id = $row_historic_user_reservations['reservation_id'];
								    $departure_time =$row_historic_user_reservations['departure_time'];
								  echo '
							    	<div class="col-xs-12 col-sm-6">
								    	<div id="generate_destination">
								    		<div class=panel panel-default wrap_destination"> 
									    		<div class="panel panel-default">
													<div class="panel-heading background_bc2 color_bc3 brandfont"><h4><b>'.$destination.'</b></h4></div>
													<div class="panel-body color_bc2">
														<h4 class="text-right"><b>Booking Nr. 	</b>'.$booking_id.'</h4>									
														<h4><b>Departure: </b>'.$departure_day.' - '.$departure_time.'</h4>

														<h4><b>Seat Nr. </b>'.$seat_number.'</h4>
													</div>
												</div>
											</div>
										</div>
									</div>
									';

								}						
							?>
							</div>
						</div>
					</div>
				</div>
	        </div>
      </div>
      <!-- /tabs -->
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
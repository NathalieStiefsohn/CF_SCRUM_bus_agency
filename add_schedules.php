<?php
require_once('includes/start_session_admin.php');
?>
<?php

$hidden ="";
$date="";
$errTyp = "";
$errMSG = "";


// add promo_day
if ( isset($_POST['btn-add_schedule']) ) {
	$route=$_POST['route'];
	$date=$_POST['date'];
	$time=$_POST['time'];

	$date = date('Y-m-d', strtotime($date));
	$time = date('H:i:s', strtotime($time));

	require 'query/count_add_schedules.php';
	
	if($count_count_schedules != 0){
		$errTyp = "alert-info";
		$errMSG = "This schedule exists already. It was not added to the system.";
		$hidden ="hidden";
	} else {

		require 'query/add_schedule.php';

		if ($res_add_schedule) {
		    $errTyp = "alert-success";
		    $errMSG = "The schedule was successfully added to the database!";
		    $hidden ="hidden";

		} else {
			$errTyp = "alert-danger";
			$errMSG = "Something went wrong, try again later...";
			// echo $errMSG;
		}
	}

}
	


?>
<!DOCTYPE html>
<html>
<head>
	<title>Add Schedules - Admin</title>
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

	    </div>
	    <div class="collapse navbar-collapse">
	      <ul class="nav navbar-nav">
	        <li><a href="home_admin.php">Risky Rides</a></li>
	        <li><a href="all_rides.php">All Rides</a></li>
	        <li><a href="all_users.php">All Users</a></li>
	        <li><a href="add_holidays.php">Manage Promo Days</a></li>
	        <li class="active"><a href="add_schedules.php">Add Schedules</a></li>
	      </ul>

	    </div>
	    <!--/.nav-collapse -->
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
						Add Schedules
					</h3>
					<hr class="border_bc1 ">	
				</div>
	<?php
        if ( isset($_POST['btn-add_schedule']) ) {
          require_once('includes/alert_box.php');
        }
    ?>
				<form class="col-xs-12  <?php echo $hidden; ?> text-center margin-top" method="POST" >
					<div class="row">
						<div class="col-xs-12 col-sm-4 margin-top">
							<label for="route">Route</label>
							<select class="form-control" id="route" name="route">
					          <?php
					             // select all available routes
					            $res_route=mysqli_query($con, "SELECT * FROM route ");
					            
					            
					              while($routeRow=mysqli_fetch_array($res_route)){
					                $route = $routeRow['destination'];
					                $route_id = $routeRow['id'];
					                echo "<option value='".$route_id."'>".$route."</option>";
					              }
					            ?>

		  					</select>
	  					</div>
	  					
						<div class="col-xs-12 col-sm-4 margin-top">
							<label for="date">Date</label>
							<input class="form-control text-center" type="text" name="date" id="date">
						</div>
						<div class="col-xs-12 col-sm-4 margin-top">
							<label for="time">Time</label>
							<input class="form-control text-center" type="time" name="time" id="time">
						</div>
						<div class="col-xs-12 text-center margin-top">
							<!-- <input type="submit" name="btn-add_schedule" id="btn-add_schedule" class="margin-top btn background_bc1 color_bc3" value="Add Promo Day"> -->

							<input type="submit" name="btn-add_schedule" id="btn-add_schedule" class="btn pull-right margin-top background_bc1 color_bc3 visible-sm visible-md visible-lg" value="Add Schedule">
							<input type="submit" name="btn-add_schedule" id="btn-add_schedule" class="btn margin-top btn-block background_bc1 color_bc3 hidden-sm hidden-md hidden-lg" value="Add Schedule">
							
						</div>	
					</form>
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
	<script>
	  $( function() {
	    $( "#date" ).datepicker();
	  } );
  </script>
</body>
</html>
<?php ob_end_flush(); ?>
<?php
require_once('includes/start_session_user.php');
?>

<?php
	if ( isset($_POST['btn-destination']) ) {
		$date=$_POST['date'];
		$destination=$_POST['destination'];
	}


?>
<!DOCTYPE html>
<html>
<head>
	<title>Booking</title>
	<?php
require_once('includes/head_tag.php');
	?>
    <link rel="stylesheet" href="css/busdiagram.css">

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
	        <li class=""><a href="home_user.php">Offers</a></li>
			<li class="active"><a href="reservation.php">Booking</a></li>
			<li class=""><a href="my_reservations.php">My Reservations</a></li>
			<li class=""><a href="change_personal_data.php">Change Personal Data</a></li>
	      </ul>

	    </div>

			        	<?php
require_once('includes/switch_user_view.php');
		?>

	  </div>

		<?php
require_once('includes/header.php');
		?>

	<!-- main -->
	<div class="row">
		<div class="col-xs-12">
			<section class="row">
		<?php
require_once('includes/promo.php');
		?>
				<div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						Booking
					</h3>
					<hr class="border_bc1 ">	
				</div>
				<!-- form - user input -->
				<form class="col-xs-12 text-center" autocomplete="off" method="get" >
					<div class="row">
						<div class="col-xs-12 col-md-4 col-md-offset-1 margin-top">
							<label for="destination" class="text-left color_bc1">Route</label>
							<input type="text" list="list_destination" name="destination" class="form-control">
							<datalist id="list_destination">
				  	<?php
				  	 // select all available entries
				  	 	$res_routes="SELECT destination, id ";
				        $res_routes.="FROM route ";
				        // $res_airport1.="ORDER BY IATA ";

				        $result=mysqli_query($con, $res_routes);

				  		while($routesRow=mysqli_fetch_array($result)){
				  			$destination = $routesRow['destination'];
				  			$route_id = $routesRow['id']; 


					  		echo "<option value='".$destination."'>".$destination."</option>";
				  		}
				  	?>

				  			</datalist>	
						</div>
						<div class="col-xs-12 col-md-4 col-md-offset-2 margin-top">
							<label for="date" class="text-left color_bc1">Date</label>
							<input type="text" name="date" id="date" class="form-control">	
						</div>
						<div class="col-xs-12 col-md-1 additional-top-margin">

							<input type="submit" name="btn-destination " id="btn-destination" class="btn background_bc1 color_bc3 visible-md visible-lg" value="Go!">
							<input type="submit" name="btn-destination" id="btn-destination" class="btn btn-block background_bc1 color_bc3 hidden-md hidden-lg" value="Go!">
							
						</div>
					</div>
				</form>
				<div class="col-xs-12">
					<hr>
				</div>
				<!-- list of schedules -->

				<?php 
					if(isset($_GET['destination'])){
						$route=$_GET['destination'];

						$dep_date=$_GET['date'];
						$dep_date = strtotime($dep_date);
						$dep_date = date('Y-m-d', $dep_date); 

						require 'query/search_schedules.php';
						echo'
						
						<div class="col-xs-12 text-center">
						<h3 class="color_bc1 brandfont ">'.$route.'</h3>
						<h3 class="color_bc1 brandfont ">'.$dep_date.'</h3>	
						<hr>
							<table class="table" id="all_users_table">
								<thead>
							      <tr>
							        <th>Time</th>
							        <th>Select</th>
							      </tr>
							    </thead>
							    <tbody>
			    ';

						while($row_select_schedule = mysqli_fetch_array($res_select_schedule)){
				  			$schedule_id = $row_select_schedule['schedule_id'];
				  			$destination = $row_select_schedule['destination']; 
				  			$departure = $row_select_schedule['departure']; 

					  		echo '
					  		<tr>
								<td>'.$departure.'</td>
								<td>
									<form>
										<input type="submit" value="Select" class="btn background_bc1 color_bc3">
									</form>
								</td>
					  		</tr>
					  		';
				  		}
				echo '
								</tbody>
							</table>
						</div>
				';

					}



				 ?>
				<!-- seat picker -->
                <div class="col-xs-12 margin-top">
                    <div class="panel panel-default">
                        <div class="panel-heading">Please pick your seat!</div>
                        <div class="seats-diagram"></div>
                    </div>
                </div>
			</section>
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
     <script type="application/javascript" src="js/busdiagram.js"></script>

</body>
</html>
<?php ob_end_flush(); ?>
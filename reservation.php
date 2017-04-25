<?php
require_once('includes/start_session_user.php');
?>

<?php

?>
<!DOCTYPE html>
<html>
<head>
	<title>Booking</title>
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
	        <li class=""><a href="home_user.php">Offers</a></li>
			<li class="active"><a href="reservation.php">Booking</a></li>
			<li class=""><a href="my_reservations.php">My Reservations</a></li>
			<li class=""><a href="change_personal_data.php">Change Personal Data</a></li>
	      </ul>

	    </div><!--/.nav-collapse -->
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
				<div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						Booking
					</h3>
					<hr class="border_bc1 ">	
				</div>
				<!-- add data here -->
                <div class="col-xs-12">
                    <?php
                    require_once('includes/pick_seat.php');
                    ?>
                </div>
			</section>
		</div>
	</div>
<<<<<<< HEAD

		<!--Where the content goes-->

		<?php
			require_once('includes/pick_seat.php');
		?>


	</section>
=======
>>>>>>> 8ad0a0d68096a1e85a77198a54791cb309810d28
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
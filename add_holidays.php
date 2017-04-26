<?php
require_once('includes/start_session_admin.php');
?>
<?php

$hidden ="";
$date="";
$errTyp = "";
$errMSG = "";


// add promo_day
if ( isset($_POST['btn-add_promo_day']) ) {
	$date=$_POST['date'];

	$query_search_promo_day = "SELECT  * from holiday WHERE event= STR_TO_DATE('$date', '%m/%d/%Y')";
	$res_search_promo_day = mysqli_query($con, $query_search_promo_day);

	$count_search_promo_day = mysqli_num_rows($res_search_promo_day);
	if($count_search_promo_day != 0){
		$errTyp = "alert-info";
		$errMSG = "This promo day is already in your system. It was not added again.";
		$hidden ="hidden";
	} else {


		$query_promo_day = "INSERT INTO holiday (event) VALUES (STR_TO_DATE('$date', '%m/%d/%Y'))";
		$res_promo_day = mysqli_query($con, $query_promo_day);

		if ($res_promo_day) {
		    $errTyp = "alert-success";
		    $errMSG = "The promo day was successfully added to the database!";
		    $hidden ="hidden";

		} else {
			$errTyp = "alert-danger";
			$errMSG = "Something went wrong, try again later...";
			// echo $errMSG;
		}
	}

}

// delete promo_day
if ( isset($_POST['btn-delete_promo_day']) ) {
	$date=$_POST['date'];

	$query_search_promo_day_delete = "SELECT  id from holiday WHERE event= STR_TO_DATE('$date', '%m/%d/%Y')";
	$res_search_promo_day_delete = mysqli_query($con, $query_search_promo_day_delete);
	$row_search_promo_day_delete = mysqli_fetch_array($res_search_promo_day_delete);
	$promo_day_id = $row_search_promo_day_delete['id'];
	$count_search_promo_day_delete = mysqli_num_rows($res_search_promo_day_delete);

	if($count_search_promo_day_delete == 0 OR empty($date)){
		$errTyp = "alert-info";
		$errMSG = "This promo day does not exist in your system yet. No need to delete it!";
		$hidden ="hidden";
	} else {

		$query_promo_day_delete2 = "DELETE FROM holiday where holiday.id=".$promo_day_id;
		$res_promo_day_delete2 = mysqli_query($con, $query_promo_day_delete2);

		if ($res_promo_day_delete2) {
		    $errTyp = "alert-success";
		    $errMSG = "The promo day was successfully deleted from the database!";
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
	<title>Manage promo days - Admin</title>
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
	        <li class="active"><a href="add_holidays.php">Manage Promo Days</a></li>
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
						Manage Promo Days
					</h3>
					<hr class="border_bc1 ">	
				</div>
	<?php
        if ( isset($_POST['btn-add_promo_day']) || isset($_POST['btn-delete_promo_day']) ) {
          require_once('includes/alert_box.php');
        }
    ?>
				<form class="col-xs-12  <?php echo $hidden; ?> text-center margin-top" method="POST" >
					<label for="date">
					<input class="form-control text-center" type="text" name="date" id="date">
					<!-- <input type="text" name="username" id="to" name="to"> -->
					<input type="submit" name="btn-add_promo_day" id="btn-add_promo_day" class="margin-top btn background_bc1 color_bc3" value="Add Promo Day">
					<input type="submit" name="btn-delete_promo_day" id="btn-delete_promo_day" class="margin-top btn background_bc2 color_bc3" value="Delete Promo Day">
						
				</form>

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
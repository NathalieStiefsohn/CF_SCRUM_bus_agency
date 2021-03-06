<?php
 ob_start();
 session_start(); // start a new session or continues the previous
 
 // it will never let you open register(sign-up) page if session is set
 if ( isset($_SESSION['admin'])!="" ) {
  header("Location: home_admin.php");
  exit;
 } else if ( isset($_SESSION['user'])!="" ) {
  header("Location: home_user.php");
  exit;
 }

 include_once 'dbconnect.php';
 



 $error = 0;
 $emailError ="";
 $firstnameError ="";
 $familynameError ="";
 $emailError ="";
 $passError ="";
 $titlenameError ="";
 $hidden="";

 $telephoneError ="";
 $yearError ="";
 $avatarError ="";
 $countryError ="";
 $ibanError ="";
 $errTyp="";
 $errMSG="";


 if ( isset($_POST['btn-signup']) ) {
  // sanitize user input to prevent sql injection
  // $username = trim($_POST['username']);
  // $username = strip_tags($username);
  // $username = htmlspecialchars($username);
 
  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);
 
  $password = trim($_POST['password']);
  $password = strip_tags($password);
  $password = htmlspecialchars($password);

  $first_name = trim($_POST['first_name']);
  $first_name = strip_tags($first_name);
  $first_name = htmlspecialchars($first_name);

  $family_name = trim($_POST['family_name']);
  $family_name = strip_tags($family_name);
  $family_name = htmlspecialchars($family_name);

  $telephone = trim($_POST['telephone']);
  $telephone = strip_tags($telephone);
  $telephone = htmlspecialchars($telephone);

  $year = trim($_POST['year']);
  $year = strip_tags($year);
  $year = htmlspecialchars($year);

  $country = trim($_POST['country']);
  $country = strip_tags($country);
  $country = htmlspecialchars($country);

  $iban = trim($_POST['iban']);
  $iban = strip_tags($iban);
  $iban = htmlspecialchars($iban);


  $title = $_POST['title'];

  $avatar = $_POST['avatar'];
    // if (empty($avatar)){
    //   $avatar = 1;
    // }

  // basic username validation
  // if (empty($username)) {
  //  $error = 1;
  //  $nameError = "Please enter your user name.";
  // } else if (strlen($username) < 3) {
  //  $error = 1;
  //  $nameError = "Name must have atleat 3 characters.";
  // } else {
  //  // check whether the username exist or not
  //  $query_username = "SELECT username FROM users WHERE users.username='$username'";
  //  $result_username = mysql_query($query_username);
  //  $count_username = mysql_num_rows($result_username);
  //  if($count_username!=0){
  //   $error = 1;
  //   $nameError = "Provided user name is already in use.";
  //  }
  // }
  // echo " username: $error<br>";
 
  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = 1;
   $emailError = "Please enter valid email address.";
  } else {
   // check whether the email exists or not
   $query_email = "SELECT email FROM user WHERE user.email='$email'";
   $result_email = mysqli_query($con, $query_email);
   $count_email = mysqli_num_rows($result_email);
   if($count_email!=0){
    $error = 1;
    $emailError = "Provided Email is already in use.";
   }
  }
    // echo " email: $error<br>";

  // password validation
  if (empty($password)){
   $error = 1;
   $passError = "Please enter password.";
  } else if(strlen($password) < 6) {
   $error = 1;
   $passError = "Password must have atleast 6 characters.";
  }
      // echo " password: $error<br>";

 
  // password encrypt using SHA256();
  // not even the admin can see the password anymore
  $password = hash('sha256', $password);
  
  // firstname validation
  if (empty($first_name)){
   $error = 1;
   $firstnameError = "Please enter your first name.";
  }else if (!preg_match("/^[a-zA-Z ]+$/",$first_name)) {
   $error = 1;
   $firstnameError = "First name must contain alphabets and space.";
  }
      // echo " firstname: $error<br>";

  // family_name validation
  if (empty($family_name)){
   $error = 1;
   $familynameError = "Please enter your family name.";
  }else if (!preg_match("/^[a-zA-Z ]+$/",$family_name)) {
   $error = 1;
   $familynameError = "Family name must contain alphabets and space.";
  }
      // echo " familyname: $error<br>";
  
  // telephone validation
  if (empty($telephone)){
   $error = 1;
   $telephoneError = "Please enter your telephone number.";
  }
      // echo " telephone number: $error<br>";

  // year of brith validation
  if (empty($year)){
   $error = 1;
   $yearError = "Please enter your year of birth.";
  }
      // echo " year of birth: $error<br>";
  
  // IBAN validation
  if (empty($iban)){
   $error = 1;
   $ibanError = "Please enter your IBAN.";
  }
      // echo " year of birth: $error<br>";

  // Avatar validation
  if (empty($avatar)){
   $error = 1;
   $avatarError = "Please choose an avatar.";
  }
        // echo " avatar: $error<br>";
        // 
    // country of residence validation
  if (empty($country)){
   $error = 1;
   $countryError = "Please enter your country of residence.";
  }

  // if there's no error, continue to signup
  if( $error == 0 ) {
   // echo "no error";
    
   $query_user = "INSERT INTO user (first_name, last_name, email, password, title_id, avatar_id, tel, birth_year) VALUES('$first_name','$family_name', '$email', '$password', $title, $avatar, '$telephone', $year)";
   $res_user = mysqli_query($con, $query_user);
   $user_id = mysqli_insert_id($con);
   // echo $iban;
   // echo '<br>'.$user_id;
   $query_payment = "INSERT INTO payment (iban, user_id) VALUES('$iban', $user_id)";
   $res_payment = mysqli_query($con, $query_payment);
   
   if ($res_user AND $res_payment) {
    $errTyp = "alert-success";
    $errMSG = "Successfully registered, you may login now! <a class='margin-left' href='index.php'><button type='button'  class='btn btn-success'>Log in</button></a>";
    $hidden ="hidden";
    // echo $errMSG;
    // unset($username);
    unset($email);
    unset($password);
    unset($first_name);
    unset($family_name);
    unset($telephone);
    unset($year);
    unset($country);
    unset($iban);
    unset($title);
    // unset($DOB);
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
    <title>Sign-up</title>
  <?php
require_once('includes/head_tag.php');
  ?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container clear-top">

    <header class="row shadow">
    <div class="col-xs-6">
      <span class="margin-top"><img id="logo" src="pictures/logo.png" alt="logo"></span>
      <!-- <span><h1 class="brandfont color_bc1">Code Bus</h1></span> -->
    </div>
  </header>
      <div class="row">
      <div class="col-xs-12">
        
          <h2 class="color_bc1">Sign Up</h2>
          <hr />
          <?php
            if ( isset($_POST['btn-signup']) ) {
              echo '<div class="alert '.$errTyp.'">'.$errMSG.'</div>';
            }
          ?>
      </div>
      <form method="post" class="<?php echo $hidden; ?>" action="register.php" autocomplete="off">
      <!-- first_row -->
      <div class="col-xs-12 col-md-6">
            <!-- USERNAME -->
            <!--   <h4>User Name:</h4>
              <input type="text" name="username" id="username" class="form-control" placeholder="Enter Username" maxlength="50" value="<?php echo $name ?>" />
              <span class="text-danger"><?php echo $nameError; ?></span> -->

          <!-- FIRSTNAME -->
          <h4 class="color_bc1">First name:</h4>
          <input type="text" id="first_name" name="first_name" class="form-control" placeholder="Enter first name" />
          <span class="text-danger"><?php echo $firstnameError; ?></span>  
          <!-- FAMILYNAME -->
          <h4 class="color_bc1">Family name:</h4>
          <input type="text" id="family_name" name="family_name" class="form-control" placeholder="Enter family name" />
          <span class="text-danger"><?php echo $familynameError; ?></span> 
          <!-- EMAIL -->
          <h4 class="color_bc1">E-Mail:</h4>
          <input type="email" id="email" name="email" class="form-control" placeholder="Enter Your Email" maxlength="40">
          <span class="text-danger"><?php echo $emailError; ?></span>
          <!-- PASSWORD -->
          <h4 class="color_bc1">Password:</h4>
          <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" maxlength="15" />
          <span class="text-danger"><?php echo $passError; ?></span>
           <!-- IBAN -->
          <h4 class="color_bc1">IBAN:</h4>
          <input type="text" id="iban" name="iban" class="form-control" placeholder="Enter IBAN" maxlength="34" />
          <span class="text-danger"><?php echo $ibanError; ?></span>
      </div>
      <!-- second row -->
      <div class="col-xs-12 col-md-6">
         <!-- title -->
          <h4 class="color_bc1">Title:</h4>
          <div class="form-group">
  <select class="form-control" id="title" name="title">
          <?php
             // select all available titles
            $res_title=mysqli_query($con, "SELECT * FROM title");
            
            
              while($titleRow=mysqli_fetch_array($res_title)){
                $title = $titleRow['name'];
                $title_id = $titleRow['id'];
                echo "<option value='".$title_id."'>".$title."</option>";
              }
            ?>

  </select>
</div>
          <!-- <span class="text-danger"><?php echo $titlenameError; ?></span>   -->
          <!-- Telephone -->
          <h4 id="telephone_h4" class="color_bc1">Telephone:</h4>
          <input type="text" id="telephone" name="telephone" class="form-control" placeholder="Enter telephone" />
          <span class="text-danger"><?php echo $telephoneError; ?></span> 
          <!-- Year of Birth -->
          <h4 class="color_bc1">Year of Birth</h4>
          <input type="number" id="year" name="year" class="form-control" placeholder="Enter your year of birth" value="<?php echo $year ?>" />
          <span class="text-danger"><?php echo $yearError; ?></span>
          <!-- Country -->
          <h4 class="color_bc1">Current country of residence:</h4>
          <input type="text" id="country" name="country" class="form-control" placeholder="Enter your current country" />
          <span class="text-danger"><?php echo $countryError; ?></span>

          
      </div>
      <div class="col-xs-12 text-center">
        <hr>
        <h4 class="color_bc1">Pick an avatar:</h4>
        <hr>

        <?php
          $query_avatar = "SELECT * FROM avatar";
          $res_avatar = mysqli_query($con, $query_avatar);

          while($avatarRow=mysqli_fetch_array($res_avatar)){
            $avatar = $avatarRow['location'];
            $avatar_id = $avatarRow['id'];

            echo    '<label class="radio-inline">
                      <input type="radio" value="'.$avatar_id.'" name="avatar"><img class="img-circle avatar" src="'.$avatar.'" alt="avatar" >
                    </label>';
          }
        ?>
        <div class="text-center text-danger margin-top"><?php echo $avatarError; ?></div>  
      </div>
      <div class="col-xs-12">
        <!-- SUBMIT -->
          <hr />
          <button type="submit" id="btn-signup" class="btn btn-block btn-primary background_bc1" name="btn-signup">Sign Up</button>
      </div>
      <div class="col-xs-12">
          <hr />
          <a href="index.php">Sign in Here...</a>
        </form>
      </div>
      </div>
<!-- end wrapper to put footer on the bottom of the page -->
  </div>
</div>
  <!-- footer -->
  <?php
require_once('includes/footer.php');
  ?>
<!-- <script type="text/javascript" src="js/register.js"></script> -->
<script>
  //Storing data:
$("#btn-signup").on("click", save_json);

function save_json() {
    signup = {
        email: document.getElementById("email").value,
        first_name: document.getElementById("first_name").value,
        family_name: document.getElementById("family_name").value,
        telephone: document.getElementById("telephone").value,
        year: document.getElementById("year").value,
        country: document.getElementById("country").value,
        iban: document.getElementById("iban").value
    }

    myJSON = JSON.stringify(signup);
    localStorage.setItem("signupJSON", myJSON);
    console.log("new data should be saved in json");
};

// fill data from json
fill_data();

function fill_data() {
    var text;
    text = localStorage.getItem("signupJSON");
    signup = JSON.parse(text);
    // $("#username").val(signup.username);
    $("#email").val(signup.email);
    $("#country").val(signup.country);
    $("#iban").val(signup.iban);
    $("#first_name").val(signup.first_name);
    $("#family_name").val(signup.family_name);
    $("#telephone").val(signup.telephone);
    $("#year").val(signup.year);
    console.log("new data should be received from json");
};
</script>
</body>
</html>
<?php ob_end_flush(); ?>

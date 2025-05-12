<?php
include("connection/connect.php");
require_once 'g-config.php'; // tambahkan ini
error_reporting(0);
session_start();


if (isset($_POST['submit'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];

  if (!empty($_POST["submit"])) {
    $loginquery = "SELECT * FROM users WHERE username='$username' && password='" . md5($password) . "'";
    $result = mysqli_query($db, $loginquery);
    $row = mysqli_fetch_array($result);
    if (is_array($row)) {
      $_SESSION["random_id"] = rand();
      $_SESSION["user_id"] = $row['u_id'];
      header("refresh:1;url=index.php");
    } else {
      $message = "Invalid Username or Password!";
    }
  }
}

$google_login_url = $client->createAuthUrl(); // buat link login Google
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="css/login.css">
</head>

<body style="background-image: url('https://img.freepik.com/free-photo/view-people-attending-chinese-new-year-reunion-dinner_23-2151040708.jpg?t=st=1742024291~exp=1742027891~hmac=e8af7e58d8de9c09c0e5336f33542594bca6b76d53d2c64bbb39950375f9d4cc&w=996');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  background-position: center;">

  <?php
  include("connection/connect.php");
  error_reporting(0);
  session_start();
  if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (!empty($_POST["submit"])) {
      $loginquery = "SELECT * FROM users WHERE username='$username' && password='" . md5($password) . "'";
      $result = mysqli_query($db, $loginquery);
      $row = mysqli_fetch_array($result);
      if (is_array($row)) {
        $_SESSION["random_id"] = rand();
        $_SESSION["user_id"] = $row['u_id'];
        header("refresh:1;url=index.php");
      } else {
        $message = "Invalid Username or Password!";
      }
    }
  }
  ?>

  <!-- Form Module-->
  <div class="d-flex justify-content-center align-items-center min-vh-100">
  <div class="col-md-5 border p-5 my-5" style="background: rgba(255, 255, 255, 0.10); backdrop-filter: blur(5px);">
      <div class="card-body justify-content-center">
        <div class="form">
        <h2 style="text-align: center; color: white;">LOGIN FORM</h2>
          <span style="color:red;"><?php echo $message; ?></span>
          <span style="color:green;"><?php echo $success; ?></span>
          <form action="" method="post">
            <div class="mb-3">
              <input class="form-control" type="text" placeholder="Username" name="username" required />
            </div>
            <div class="mb-3">
              <input class="form-control" type="password" placeholder="Password" name="password" required />
            </div>
            <div class="d-grid mb-3">
              <button class="btn btn-primary" type="submit" name="submit" value="Login">Login</button>
            </div>
            <div class="d-grid mb-3">
            <a href="<?php echo $google_login_url; ?>">
              <img src="images/with_google2.png" alt="with google">
            </a>
            </div>
          </form>
        </div>
        <div class="regis" style="color: white;">Not registered?<a href="registration.php" style="color:yellow;"> Create an account</a></div>
      </div>
    </div>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>
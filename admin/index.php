<!DOCTYPE html>
<html lang="en">
<?php
include("../connection/connect.php");
error_reporting(0);
session_start();
if (isset($_POST['submit'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];

	if (!empty($_POST["submit"])) {
		$loginquery = "SELECT * FROM admin WHERE username='$username' && password='" . md5($password) . "'";
		$result = mysqli_query($db, $loginquery);
		$row = mysqli_fetch_array($result);

		if (is_array($row)) {
			$_SESSION["username"] = $username;/// Update CreatedBy
			header("refresh:1;url=dashboard.php");
		} else {
			$message = "Invalid Username or Password!";
		}
	}
}

if (isset($_POST['submit1'])) {
	if (
		empty($_POST['cr_user']) ||
		empty($_POST['cr_email']) ||
		empty($_POST['cr_pass']) ||
		empty($_POST['cr_cpass']) ||
		empty($_POST['code'])
	) {
		$message = "ALL fields must be fill";
	} else {


		$check_username = mysqli_query($db, "SELECT username FROM admin where username = '" . $_POST['cr_user'] . "' ");

		$check_email = mysqli_query($db, "SELECT email FROM admin where email = '" . $_POST['cr_email'] . "' ");

		$check_code = mysqli_query($db, "SELECT adm_id FROM admin where code = '" . $_POST['code'] . "' ");


		if ($_POST['cr_pass'] != $_POST['cr_cpass']) {
			$message = "Password not match";
		} elseif (!filter_var($_POST['cr_email'], FILTER_VALIDATE_EMAIL)) {
			$message = "Invalid email address please type a valid email!";
		} elseif (mysqli_num_rows($check_username) > 0) {
			$message = 'username Already exists!';
		} elseif (mysqli_num_rows($check_email) > 0) {
			$message = 'Email Already exists!';
		}
		if (mysqli_num_rows($check_code) > 0) {
			$message = "Unique Code Already Redeem!";
		} else {
			$result = mysqli_query($db, "SELECT id FROM admin_codes WHERE codes =  '" . $_POST['code'] . "'");

			if (mysqli_num_rows($result) == 0) {

				$message = "invalid code!";
			} else {

				$mql = "INSERT INTO admin (username,password,email,code) VALUES ('" . $_POST['cr_user'] . "','" . md5($_POST['cr_pass']) . "','" . $_POST['cr_email'] . "','" . $_POST['code'] . "')";
				mysqli_query($db, $mql);
				$success = "Admin Added successfully!";
			}
		}
	}
}
?>

<head>
	<meta charset="UTF-8">
	<title>Angkring Dashboard Login</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=poppins:400,100,300,500,700,900'>
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/green.css">


</head>

<body>


	<div class="container">
		<div class="info">
			<h1>Administrator </h1><span> Login To Dashbord</span>
		</div>
	</div>
	<div class="form">
		<div class="thumbnail kyi"><img src="images/manager.png" /></div>

		<form class="register-form" action="index.php" method="post">
			<input type="text" placeholder="Username" name="cr_user" />
			<input type="text" placeholder="Email address" name="cr_email" />
			<input type="password" placeholder="Password" name="cr_pass" />
			<input type="password" placeholder="Confirm password" name="cr_cpass" />
			<input type="password" placeholder="Unique-Code" name="code" />
			<input type="submit" name="submit1" value="Create" />
			<p class="message">Already registered? <a href="#">Sign In</a></p>
		</form>
		<span style="color:red;"><?php echo $message; ?></span>
		<span style="color:green;"><?php echo $success; ?></span>
		<form class="login-form" action="index.php" method="post">
			<input type="text" placeholder="Username" name="username" />
			<input type="password" placeholder="Password" name="password" />
			<input type="submit" name="submit" value="Login" />
			<p class="message">Not registered? <a href="#">Create an account</a></p>
		</form>

	</div>

	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='js/index.js'></script>


</body>

</html>
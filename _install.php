<?php
require("config/config.default.php");
require("config/config.function.php");
require("config/config.ocbt.php");
if (!$pilihdb) {
	$ket = 'disabled';
	$ket2 = '';
} else {
	$ket = '';
	$ket2 = 'disabled';
}
if (isset($_POST['buat'])) {
	$nama_db = NAMA_DATABASE;

	mysqli_query($koneksi, "CREATE DATABASE $nama_db CHARACTER SET utf8 COLLATE utf8_general_ci;");
	header('location:install.php');
}
if (isset($_POST['buat2'])) {
	$filename = 'config/ocbt.sql';
	$templine = '';
	$lines = file($filename);
	foreach ($lines as $line) {
		if (substr($line, 0, 2) == '--' || $line == '')
			continue;
		$templine .= $line;
		if (substr(trim($line), -1, 1) == ';') {
			mysqli_query($koneksi, $templine);
			$templine = '';
		}
	}
	header('location:mobile_login.php');
}

?>

<!DOCTYPE html>
<html>

<head>
	<meta charset='utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge' />
	<title>Installasi <?= APLIKASI . " v" . VERSI . " r" . REVISI ?></title>
	<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' />
	<link rel='stylesheet' href='dist/bootstrap/css/bootstrap.min.css' />

	<link rel='stylesheet' href='dist/css/AdminLTE.min.css' />
	<link rel='stylesheet' href='dist/css/skins/skin-blue.min.css' />


	<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.css">
	<link rel="stylesheet" href="plugins/animate/animate.min.css">
	<!-- Material Design -->
	<link rel="stylesheet" href="dist/css/bootstrap-material-design.min.css">
	<link rel="stylesheet" href="dist/css/ripples.min.css">
	<link rel="stylesheet" href="dist/css/MaterialAdminLTE.min.css">



</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-blue layout-top-nav">

	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-fixed-top bg-primary">
				<div class="container">
					<div class="navbar-header">
						<a href="?" class="animated bounce navbar-brand" style="padding:5px 15px; line-height: 45px;"><b><?= APLIKASI ?></b> INSTALLER</a>
					</div>
				</div>
			</nav>
		</header>

		<!-- Full Width Column -->
		<div class="content-wrapper" style="background:url(dist/img/octo.gif);background-size: cover;">

			<div class="container">

				<!-- Main content -->
				<section class="content">
					<div class='row'>
						<div class="animated tada delay-1s login-logo" style='font-size:20px;margin-top:12%;'>
							<a href="">SELAMAT DATANG DI <?= APLIKASI ?></a>
						</div>
						<div class="animated flipInX login-box " style='margin-top:1%;'>

							<!-- /.login-logo -->
							<div class="  login-box-body bg-teal">
								<p class="login-box-msg"><b>Database Belum Terbentuk Silahkan Klik Tombol dibawah Untuk membuat database</b></p>
								<div class="row">

									<!-- /.col -->
									<div class="col-xs-12">
										<form action='' method='post' style="margin-bottom: 5px;">
											<button name='buat' class="btn btn-primary btn-raised  btn-block" <?php echo $ket2 ?>>1. Buat Database &nbsp;</button>
										</form>
										<form action='' method='post'>
											<button name='buat2' class="btn btn-success btn-raised  btn-block" <?php echo $ket ?>>2. Import Database</button>
										</form>
									</div>
									<!-- /.col -->
								</div>
							</div>
							<!-- /.login-box-body -->
						</div>
					</div>
				</section>
				<!-- /.content -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer hidden-xs navbar-fixed-bottom">
			<div class="container">
				<div class="pull-left ">
					<b>Base on Candy Installer</b>
				</div>
				<div class="pull-right ">
					<b><?= APLIKASI . " versi " . VERSI . " revisi " . REVISI ?></b>
				</div>
				<strong></strong>
			</div>
			<!-- /.container -->
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3.1.1 -->
	<script src="plugins/jQuery/jquery-3.1.1.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="dist/bootstrap/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<script src="dist/js/material.min.js"></script>
	<script src="dist/js/ripples.min.js"></script>


</body>

</html>
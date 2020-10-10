<?php
	require("../config/config.default.php");
	require("../config/dis.php");
	
	$mobile = (isset($_SESSION['is_mobile'])) ? '?mobile='. $_SESSION['is_mobile'] : '';

	session_destroy();
	echo "<script>location.href = '". $homeurl ."/mobile_login.php". $mobile ."';</script>";

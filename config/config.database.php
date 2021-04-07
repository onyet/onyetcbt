<?php
//konfigurasi server database
$host = 'localhost';
$user = 'root';
$pass = '';
$debe = 'ocbt';
$port = '3306';


$koneksi = mysqli_connect($host, $user, $pass, $debe, $port);
if ($koneksi) {
	$pilihdb = mysqli_select_db($koneksi, $debe);
	if ($pilihdb) {
		$query = mysqli_query($koneksi, "SELECT * FROM setting WHERE id_setting='1'");
		if ($query) {
			$setting = mysqli_fetch_array($query);
			mysqli_set_charset($koneksi, 'utf8');
			$sess = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM session WHERE id='1'"));
			date_default_timezone_set($setting['waktu']);
		}
	}
} else {
	echo 'ERROR 500 : Your Databases Settings is invalid!';
	exit();
}

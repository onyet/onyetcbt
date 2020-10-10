<?php
require("config/config.default.php");
require("config/dis.php");
(isset($_SESSION['id_siswa'])) ? $id_siswa = $_SESSION['id_siswa'] : $id_siswa = 0;
($id_siswa <> 0) ? mysqli_query($koneksi, "INSERT INTO log (id_siswa,type,text,date) VALUES ('$id_siswa','logout','keluar','$tanggal $waktu')") : null;
mysqli_query($koneksi, "UPDATE siswa set online='0' where id_siswa='$id_siswa'");
$mobile = (isset($_SESSION['is_mobile'])) ? '?mobile='. $_SESSION['is_mobile'] : '';
session_destroy();
echo "<script>location.href = '". $homeurl ."/mobile_login.php". $mobile ."';</script>";

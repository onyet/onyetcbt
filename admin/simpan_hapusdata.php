<?php
require "../config/config.default.php";
$id_pengawas = (isset($_SESSION['id_pengawas'])) ? $_SESSION['id_pengawas'] : 0;
if($id_pengawas == 0) {
    header('Location:'. $homeurl .'/mobile_login.php');
    exit();
}
$pengawas = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM pengawas  WHERE id_pengawas='$id_pengawas'"));
$password = $_POST['password'];
if (!password_verify($password, $pengawas['password'])) {
    echo "password salah";
} else {
    if (!empty($_POST['data'])) {
        $data = $_POST['data'];
        if ($data <> '') {
            foreach ($data as $table) {
                if ($table <> 'pengawas') {
                    mysqli_query($koneksi, "TRUNCATE $table");
                } else {
                    mysqli_query($koneksi, "DELETE FROM $table WHERE level!='admin'");
                }
            }
            echo "ok";
        }
    }
}

<?php
require("config/config.default.php");
require("config/config.ocbt.php");

if (!empty($_POST['nis'])){

    $tgl_lahir  = $_POST['thn_lahir'].'-'.$_POST['bln_lahir'].'-'.$_POST['tgl_lahir'];
    $sql        = "INSERT INTO registrasi_siswa(nis,nama_lengkap,id_kelas,alamat,tempat_lahir,tgl_lahir,jenis_kelamin,agama,nama_ayah,nama_ibu,th_masuk,no_hp,username_login,password_login) VALUES ('".addslashes(trim($_POST['nis']))."','".addslashes($_POST['nama'])."','".addslashes($_POST['kelas'])."','".addslashes($_POST['alamat'])."','".addslashes($_POST['tempat_lahir'])."','".addslashes($tgl_lahir)."','".addslashes($_POST['jk'])."','".addslashes($_POST['agama'])."','".addslashes($_POST['nama_ayah'])."','".addslashes($_POST['nama_ibu'])."',".addslashes($_POST['thn_masuk']).",'".addslashes($_POST['phone'])."', '".addslashes(trim($_POST['nis']))."', '". addslashes(trim($_POST['nis'])) ."')";
    $query      = mysqli_query($koneksi, $sql);

    if($query) {

        echo "<script>window.alert('Terimakasih telah mendaftarkan diri anda, silahkan tunggu konfirmasi dari admin.'); window.location=(href='index.php')</script>";

    } else {

        echo "<script>window.alert('Gagal Daftar! Pastikan NIS belum pernah di pakai.'); window.location=(href='registrasi.php')</script>";

    }

}else{

    header('location:registrasi.php');
    exit();

}
?>

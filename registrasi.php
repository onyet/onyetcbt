<?php
require("config/config.default.php");
require("config/config.ocbt.php");
?>
<!DOCTYPE HTML>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="E-Learning SMK SPM NASIONAL Purwokerto">
  <meta name="author" content="onyetapp">

  <meta name="docsearch:language" content="en">
  <meta name="docsearch:version" content="4.5">

  <title>Registrasi Siswa</title>

  <!-- Bootstrap core CSS -->
  <style class="anchorjs"></style>
  <link href="<?php echo $homeurl; ?>/dist/bootstrap-4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Favicons -->
  <link rel="apple-touch-icon" sizes="57x57" href="<?php echo $homeurl; ?>/dist/img/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="<?php echo $homeurl; ?>/dist/img/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="<?php echo $homeurl; ?>/dist/img/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="<?php echo $homeurl; ?>/dist/img/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="<?php echo $homeurl; ?>/dist/img/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="<?php echo $homeurl; ?>/dist/img/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="<?php echo $homeurl; ?>/dist/img/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="<?php echo $homeurl; ?>/dist/img/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="<?php echo $homeurl; ?>/dist/img/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192" href="<?php echo $homeurl; ?>/dist/img/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="<?php echo $homeurl; ?>/dist/img/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="<?php echo $homeurl; ?>/dist/img/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="<?php echo $homeurl; ?>/dist/img/favicon-16x16.png">
  <link rel="manifest" href="<?php echo $homeurl; ?>/dist/pwa/manifest.json">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="<?php echo $homeurl; ?>/dist/img/ms-icon-144x144.png">
  <meta name="theme-color" content="#ffffff">

  <!--[if lte IE 8]>
  <script type="text/javascript" src="js/html5.js"></script>
  <![endif]-->
  <script type="text/javascript" src="<?= $homeurl ?>/dist/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="<?= $homeurl ?>/dist/vendor/bootstrap/js/popper.js"></script>
  <script type="text/javascript" src="<?php echo $homeurl; ?>/dist/bootstrap-4.5.2/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#nis").change(function () {
        var nis = $("#nis").val();
        $.ajax({
          type: "POST",
          url: "checking_nis.php",
          data: "nis=" + nis,
          success: function (data) {
            if (data == 0) {
              $('#nis').css('border', '3px #090 solid');
            } else {
              alert('Nis sudah terdaftar!');
              $('#nis').css('border', '3px #C33 solid');
              $("#nis").val('');
            }
          },
        });
      })
    });
  </script>
  <script language="javascript">
    function check_radio(radio) {
      // memeriksa apakah radio button sudah ada yang dipilih
      for (i = 0; i < radio.length; i++) {
        if (radio[i].checked === true) {
          return radio[i].value;
        }
      }
      return false;
    }

    function validasi(form) {
      if (form.nis.value == "") {
        alert('Nis Masih Kosong!');
        form.nis.focus();
        return (false);
      }
      if (form.nama.value == "") {
        alert('Nama Masih Kosong!');
        form.nama.focus();
        return (false);
      }
      if (form.phone.value == "") {
        alert('No Telp Masih Kosong!');
        form.phone.focus();
        return (false);
      }
      if (form.kelas.value == "pilih") {
        alert('Kelas Masih Kosong!');
        return (false);
      }
      if (form.alamat.value == "") {
        alert('Alamat Masih Kosong!');
        form.alamat.focus();
        return (false);
      }
      if (form.tempat_lahir.value == "") {
        alert('Tempat Lahir Masih Kosong!');
        form.tempat_lahir.focus();
        return (false);
      }
      var radio_val = check_radio(form.jk);
      if (radio_val === false) {
        alert("Anda belum memilih Jenis Kelamin!");
        return false;
      }

      if (form.agama.value == "pilih") {
        alert('Anda belum memilih Agama!');
        return (false);
      }
      if (form.nama_ayah.value == "") {
        alert('Nama Ayah/Wali Masih Kosong!');
        form.nama_ayah.focus();
        return (false);
      }


      return (true);
    }
  </script>

</head>

<body style="background-color: #f5f5f5;">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
      <img src="<?php echo $homeurl; ?>/dist/img/spmlogo.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="<?= $homeurl ?>/mobile_login.php">Masuk</a>
        </li>
      </ul>
    </div>
  </nav>

  <div id="login2" class="container">
    <div class="card mt-3 mb-3">
      <div class="card-header text-center">
        <h4>Registrasi Siswa</h4>
      </div>
      <div class="card-body">
        <form method="POST" action="input_registrasi.php" onSubmit="return validasi(this)" class="row">
          <div class="col-md-6 col-sm-6">
            <div class="form-group">
              <label for="nis">Nis :</label>
              <input type="text" name="nis" size="20" id="nis" class="form-control"/>
              <small class="form-text text-muted">Pastikan NIS benar.</small>
            </div>
            <div class="form-group">
              <label for="nama">Nama Lengkap :</label>
              <input type="text" name="nama" id="nama" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="email">No Telp :</label>
              <input type="text" name="phone" id="phone" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="kelas">Kelas :</label>
              <?php
                $kelas = mysqli_query($koneksi, "SELECT * FROM kelas ORDER BY id_kelas");
                echo "<dd><select name='kelas' id='kelas' class='form-control'>
                      <option value='pilih' selected>--Pilih--</option>";
                while ($k=mysqli_fetch_array($kelas, MYSQLI_ASSOC)){
                    echo "<option value='".$k['id_kelas']."'>".$k['nama']."</option>";
                }
                echo "</select>";
              ?>
            </div>
            <div class="form-group">
              <label for="alamat">Alamat :</label>
              <textarea name="alamat" id="alamat" cols="43" rows="7" class="form-control"></textarea>
            </div>
          </div>
          <div class="col-md-6 col-sm-6">
            <div class="form-group">
              <label for="tempat_lahir">Tempat Lahir :</label>
              <input type="text" name="tempat_lahir" id="tempat_lahir" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="tgl_lahir" style="display: block;">Tanggal Lahir :</label>
              <div style="display: inline-flex; width: 30%;">
                <select name="tgl_lahir" id="tgl_lahir" class="form-control">
                  <?php for ($i=1; $i < 32; $i++) { 
                    echo "<option value='". $i ."'>". $i ."</option>";
                  } ?>
                </select>
              </div>
              <div style="display: inline-flex; width: 30%;">
                <select name="bln_lahir" id="bln_lahir" class="form-control">
                  <?php for ($i=1; $i < 13; $i++) { 
                    echo "<option value='". $i ."'>". $i ."</option>";
                  } ?>
                </select>
              </div>
              <div style="display: inline-flex; width: 36%;">
                <select name="thn_lahir" id="thn_lahir" class="form-control">
                  <?php 
                  $blnnow = (int) date('Y', time());
                  $blnawal = $blnnow - 5;
                  $blnend = $blnnow - 40;
                  for ($i=$blnawal; $i >= $blnend; $i--) { 
                    echo "<option value='". $i ."'>". $i ."</option>";
                  } 
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label style="display: block;">Jenis kelamin :</label>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="jk" id="jk1" value="Laki-Laki" checked>
                <label class="form-check-label" for="jk1">Laki - Laki</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="jk" id="jk2" value="Perempuan">
                <label class="form-check-label" for="jk2">Perempuan</label>
              </div>
            </div>
            <div class="form-group">
              <label for="agama">Agama :</label>
              <select name="agama" id="agama" class="form-control">
                <?php
                  $query = mysqli_fetch_all(mysqli_query($koneksi, "select * from agama"), MYSQLI_ASSOC);
                  foreach ($query as $key => $value) {
                    echo "<option value='". $value['agamaku'] ."'>". ucfirst($value['agamaku']) ."</option>";
                  }
                ?>
              <select>
            </div>
            <div class="form-group">
              <label for="nama_ayah">Nama Ayah/Wali :</label>
              <input type="text" name="nama_ayah" id="nama_ayah" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="nama_ibu">Nama Ibu :</label>
              <input type="text" name="nama_ibu" id="nama_ibu" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="thn_masuk">Tahun Masuk :</label>
              <select name="thn_masuk" id="thn_lahir" class="form-control">
                  <?php 
                  $blnend = $blnnow - 40;
                  for ($i=$blnnow; $i >= $blnend; $i--) { 
                    echo "<option value='". $i ."'>". $i ."</option>";
                  } 
                  ?>
              </select>
            </div>
          </div>
          <div class="col-md-12 col-sm-12 text-right">
            <button type="button" class="btn btn-warning" onclick="window.location.href='index.php';" > Batal</button>
            <input type="submit" class="btn btn-primary" value="Daftar Sekarang"></input>
          </div>
        </form>
      </div>
    </div>
    <p class="mb-3 text-center text-muted">&copy; 2020 <?= APLIKASI . " v" . VERSI . " r" . REVISI ?></p>
  </div>

</body>

</html>
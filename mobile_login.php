<?php
require("config/config.default.php");
require("config/config.ocbt.php");

if (isset($_SESSION['id_pengawas'])) {
    echo "<script>window.location = '". $homeurl ."/admin/index.php'; </script>";
    exit();
}

if (isset($_SESSION['id_siswa'])) {
    echo "<script>window.location = '". $homeurl ."/index.php'; </script>";
    exit();
}

if (isset($_POST['username']) && isset($_POST['password'])) {
    // Masuk cek user sebagai siswa atau admin
    $query = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM siswa WHERE username='". addslashes($_POST['username']) ."'"));

    if (isset($query) && count($query) > 0) {
        
        if ($query['password'] == $_POST['password']) {
            
            $_SESSION['id_siswa'] = $query['id_siswa'];
            $_SESSION['level'] = 'siswa';
            $_SESSION['nama'] = $query['nama'];
            $_SESSION['id_kelas'] = $query['id_kelas'];

            if ($_POST['mobile'] == 'android' || $_POST['mobile'] == 'ios') {
                $_SESSION['is_mobile'] = $_POST['mobile'];
            }

            echo "<script>window.location = '". $homeurl ."'; </script>";
            exit();

        } else {

            echo "<script>alert('Username atau password salah'); </script>";

        }

    } else {
        
        $query = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM pengawas WHERE username='". addslashes($_POST['username']) ."'"));

        $password = ($query['level'] != 'guru') ? password_verify($_POST['password'], $query['password']) : $_POST['password'];
        if ($query['password'] == $password) {
            
            $_SESSION['id_pengawas'] = $query['id_pengawas'];
            $_SESSION['level'] = $query['level'];
            $_SESSION['nama'] = $query['nama'];

            if ($_POST['mobile'] == 'android' || $_POST['mobile'] == 'ios') {
                $_SESSION['is_mobile'] = $_POST['mobile'];
            }

            echo "<script>window.location = '". $homeurl ."/admin'; </script>";
            exit();

        } else {

            echo "<script>alert('Username atau password salah'); </script>";

        }
        
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="E-Learning SMK SPM NASIONAL Purwokerto">
    <meta name="author" content="e-learning, smk, spm, sd, smp, purwokerto, lms">

    <meta name="docsearch:language" content="en">
    <meta name="docsearch:version" content="4.5">

    <title>E-Learning SMK SPM Nasional Purwokerto</title>

    <!-- Bootstrap core CSS -->
    <style class="anchorjs"></style>
    <link href="<?= $homeurl ?>/dist/bootstrap-4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Favicons -->
    <link rel="apple-touch-icon" sizes="57x57" href="<?= $homeurl ?>/dist/img/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?= $homeurl ?>/dist/img/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?= $homeurl ?>/dist/img/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?= $homeurl ?>/dist/img/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?= $homeurl ?>/dist/img/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?= $homeurl ?>/dist/img/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?= $homeurl ?>/dist/img/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?= $homeurl ?>/dist/img/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?= $homeurl ?>/dist/img/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<?= $homeurl ?>/dist/img/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?= $homeurl ?>/dist/img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<?= $homeurl ?>/dist/img/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?= $homeurl ?>/dist/img/favicon-16x16.png">
    <link rel="manifest" href="<?= $homeurl ?>/dist/pwa/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<?= $homeurl ?>/dist/img/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <link href="<?= $homeurl ?>/dist/css/signin.css" rel="stylesheet">

</head>

<body class="text-center">
    <div id="particles" style="position: absolute; width: 100%; height: 100%;"></div>
    <form class="form-signin" action="<?= $homeurl ?>/mobile_login.php" method="POST" name="login" style="z-index: 2;">
        <img class="mb-4" src="<?= $homeurl ?>/dist/img/spmlogo.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Silahkan Masuk</h1>
        <label for="inputEmail" class="sr-only">Username</label>
        <input type="text" name="username" id="inputUsername" class="form-control mb-2" placeholder="Username"
            required="" autofocus="">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password"
            required="">
        <input type="hidden" name="mobile" value="<?= $_GET['mobile'] ?>">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Masuk</button>
        <p class="mt-3" style="margin-bottom: 0;">
            <a href="registrasi.php">Belum punya akun ? Daftar disini.</a>
        </p>
        <p class="mt-4 mb-3 text-muted">© 2019-2020</p>
    </form>
    <script src="<?= $homeurl ?>/dist/vendor/particles.js-master/particles.min.js"></script>
    <script>
        particlesJS('particles', {
            "particles": {
                "number": {
                    "value": 80,
                    "density": {
                        "enable": true,
                        "value_area": 1499
                    }
                },
                "color": {
                    "value": "#797fed"
                },
                "shape": {
                    "type": "circle",
                    "stroke": {
                        "width": 0,
                        "color": "#000000"
                    },
                    "polygon": {
                        "nb_sides": 5
                    },
                    "image": {
                        "src": "img/github.svg",
                        "width": 100,
                        "height": 100
                    }
                },
                "opacity": {
                    "value": 0.5,
                    "random": false,
                    "anim": {
                        "enable": false,
                        "speed": 1,
                        "opacity_min": 0.1,
                        "sync": false
                    }
                },
                "size": {
                    "value": 10,
                    "random": true,
                    "anim": {
                        "enable": false,
                        "speed": 80,
                        "size_min": 0.1,
                        "sync": false
                    }
                },
                "line_linked": {
                    "enable": true,
                    "distance": 150,
                    "color": "#797fed",
                    "opacity": 0.4,
                    "width": 1
                },
                "move": {
                    "enable": true,
                    "speed": 6,
                    "direction": "none",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                    "attract": {
                        "enable": false,
                        "rotateX": 600,
                        "rotateY": 1200
                    }
                }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": {
                    "onhover": {
                        "enable": true,
                        "mode": "repulse"
                    },
                    "onclick": {
                        "enable": true,
                        "mode": "push"
                    },
                    "resize": true
                },
                "modes": {
                    "grab": {
                        "distance": 800,
                        "line_linked": {
                            "opacity": 1
                        }
                    },
                    "bubble": {
                        "distance": 800,
                        "size": 80,
                        "duration": 2,
                        "opacity": 0.8,
                        "speed": 3
                    },
                    "repulse": {
                        "distance": 150,
                        "duration": 0.4
                    },
                    "push": {
                        "particles_nb": 4
                    },
                    "remove": {
                        "particles_nb": 2
                    }
                }
            },
            "retina_detect": true
        });
    </script>
</body>

</html>
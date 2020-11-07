<?php
require("./../config/config.default.php");

$iduser = (isset($_GET['user'])) ? $_GET['user'] : NULL;
if ($iduser !== NULL && $_GET['api_key'] == KEY) {

    $iduser = base64_decode($iduser);
    $idusers= explode(';', $iduser);
    $iduser = $idusers[0];
    $level  = end($idusers);
    $user   = ($level != 'siswa') ? mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM pengawas WHERE id_pengawas=". $iduser)) : mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM siswa WHERE id_siswa=". $iduser));

    if (!isset($user) || count($user) <= 0) {
    
        echo json_encode(array(
            'status'    => 'error',
            'data'      => [],
            'message'   => 'Anda tidak terdaftar.'
        ));
        exit();

    }

    /**
     * Mulai Aksi
     */
    $action = $_GET['action'];

    switch ($action) {

        case 'absen':
            
            $tgl    = date('Y-m-d', time());
            $exec   = mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM absen_harian WHERE id_user=". $iduser ." AND level='". $level ."' AND hadir='". $tgl ."';"));

            if ($exec > 0) {
                
                echo json_encode(array(
                    'status'    => 'error',
                    'data'      => 'absen',
                    'message'   => 'Anda sudah absen hari ini.'
                ));

            } else {

                $query  = "INSERT INTO absen_harian (id_user, level, hadir, waktu, tahun, bulan, hari) VALUES(". $iduser .", '". $level ."', '". date('Y-m-d', time()) ."', '". date('H:i:s', time()) ."', ". date('Y', time()) .", ". date('m', time()) .", ". date('d', time()) .")";
                $exec   = mysqli_query($koneksi, $query);

                if ($exec) {
                    
                    echo json_encode(array(
                        'status'    => 'success',
                        'data'      => [],
                        'message'   => 'Berhasil absen.'
                    ));

                } else {

                    echo json_encode(array(
                        'status'    => 'error',
                        'data'      => $query,
                        'message'   => 'Gagal absen, ulangi kembali.'
                    ));

                }

            }

            break;
        
        default:
            
            $tgl    = date('Y-m-d', time());
            $exec   = mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM absen_harian WHERE id_user=". $iduser ." AND level='". $level ."' AND hadir='". $tgl ."';"));
            
            if ($exec > 0) {
                
                echo json_encode(array(
                    'status'    => 'success',
                    'data'      => 'absen',
                    'message'   => 'Anda sudah absen hari ini.'
                ));

            } else {
    
                echo json_encode(array(
                    'status'    => 'error',
                    'data'      => null,
                    'message'   => 'Anda belum absen hari ini.'
                ));

            }

            break;
    }

} else {

    echo json_encode(array(
        'status'    => 'error',
        'data'      => [],
        'message'   => 'Anda tidak memiliki akses.'
    ));

}
exit();
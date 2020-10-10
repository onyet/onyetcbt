<?php
require_once "./../config/config.default.php";

/**
 * Funtion Helper
 */
function getDifferenceTime($startdate, $enddate) {
    $start_date     = new DateTime($startdate);
    $since_start    = $start_date->diff(new DateTime($enddate));
    $hasil  = '';

    if ($since_start->y > 0) {
        $hasil .= $since_start->y .' Tahun ';
    }

    if ($since_start->m > 0) {
        $hasil .= $since_start->m .' Bulan ';
    }

    if ($since_start->d > 0) {
        $hasil .= $since_start->d .' Hari ';
    }

    if ($since_start->h > 0) {
        $hasil .= $since_start->h .' Jam ';
    }

    if ($since_start->i > 0) {
        $hasil .= $since_start->i .' Menit ';
    }
    
    if ($since_start->s > 0) {
        $hasil .= $since_start->s .' Detik ';
    }

    return trim($hasil);
}
/**
 * Deklarasi Mulai dari sini
 */

$idujian    = (isset($_GET['idujian'])) ? $_GET['idujian'] : NULL;
$idmapel    = (isset($_GET['idmapel'])) ? $_GET['idujian'] : NULL;
$idpengawas = (isset($_GET['idpengawas'])) ? $_GET['idpengawas'] : NULL;
$pengawas   = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM pengawas  WHERE id_pengawas=". $idpengawas));

if (count($pengawas) > 0 && $_GET['api_key'] == KEY) {
    
    $query  = NULL;
    switch ($pengawas['level']) {
        case 'admin':
            $query = "SELECT s.id_nilai, s.id_ujian, s.id_mapel, s.id_siswa, s.kode_ujian, s.ujian_mulai, s.ujian_berlangsung, s.ujian_selesai, s.jml_benar, s.jml_salah, s.nilai_esai, s.skor, s.total, s.status, s.ipaddress, s.hasil, s.jawaban, s.jawaban_esai, s.nilai_esai2, s.online, s.id_soal, s.id_opsi, s.id_esai, c.id_ujian, c.kode_nama, c.id_pk, c.id_guru, c.kode_ujian, c.nama, c.jml_soal, c.jml_esai, c.bobot_pg, b.nis, b.nama AS nama_siswa, k.nama AS nama_kelas, m.nama AS nama_mapel, m.level AS level_mapel  FROM nilai s LEFT JOIN ujian c ON s.id_ujian=c.id_ujian JOIN siswa b ON b.id_siswa=s.id_siswa LEFT JOIN mapel m ON s.id_mapel=m.id_mapel LEFT JOIN kelas k ON b.id_kelas=k.id_kelas WHERE c.status='1' AND s.id_siswa<>''";
            break;
        
        case 'guru':
            $query = "SELECT s.id_nilai, s.id_ujian, s.id_mapel, s.id_siswa, s.kode_ujian, s.ujian_mulai, s.ujian_berlangsung, s.ujian_selesai, s.jml_benar, s.jml_salah, s.nilai_esai, s.skor, s.total, s.status, s.ipaddress, s.hasil, s.jawaban, s.jawaban_esai, s.nilai_esai2, s.online, s.id_soal, s.id_opsi, s.id_esai, c.id_ujian, c.kode_nama, c.id_pk, c.id_guru, c.kode_ujian, c.nama, c.jml_soal, c.jml_esai, c.bobot_pg, b.nis, b.nama AS nama_siswa, k.nama AS nama_kelas, m.nama AS nama_mapel, m.level AS level_mapel FROM nilai s LEFT JOIN ujian c ON s.id_ujian=c.id_ujian JOIN siswa b ON b.id_siswa=s.id_siswa LEFT JOIN mapel m ON s.id_mapel=m.id_mapel LEFT JOIN kelas k ON b.id_kelas=k.id_kelas WHERE c.status='1' AND s.id_siswa<>'' AND c.id_guru='". $pengawas['id_pengawas'] ."'";
            break;
        
        case 'pengawas':
            $query = "SELECT s.id_nilai, s.id_ujian, s.id_mapel, s.id_siswa, s.kode_ujian, s.ujian_mulai, s.ujian_berlangsung, s.ujian_selesai, s.jml_benar, s.jml_salah, s.nilai_esai, s.skor, s.total, s.status, s.ipaddress, s.hasil, s.jawaban, s.jawaban_esai, s.nilai_esai2, s.online, s.id_soal, s.id_opsi, s.id_esai, c.id_ujian, c.kode_nama, c.id_pk, c.id_guru, c.kode_ujian, c.nama, c.jml_soal, c.jml_esai, c.bobot_pg, b.nis, b.nama AS nama_siswa, k.nama AS nama_kelas, m.nama AS nama_mapel, m.level AS level_mapel FROM nilai s LEFT JOIN ujian c ON s.id_ujian=c.id_ujian JOIN siswa b ON b.id_siswa=s.id_siswa LEFT JOIN mapel m ON s.id_mapel=m.id_mapel LEFT JOIN kelas k ON b.id_kelas=k.id_kelas WHERE c.status='1' AND s.id_siswa<>'' AND b.ruang='". $pengawas['ruang'] ."'";
            break;
        
        case 'proktor':
            $query = "SELECT s.id_nilai, s.id_ujian, s.id_mapel, s.id_siswa, s.kode_ujian, s.ujian_mulai, s.ujian_berlangsung, s.ujian_selesai, s.jml_benar, s.jml_salah, s.nilai_esai, s.skor, s.total, s.status, s.ipaddress, s.hasil, s.jawaban, s.jawaban_esai, s.nilai_esai2, s.online, s.id_soal, s.id_opsi, s.id_esai, c.id_ujian, c.kode_nama, c.id_pk, c.id_guru, c.kode_ujian, c.nama, c.jml_soal, c.jml_esai, c.bobot_pg, b.nis, b.nama AS nama_siswa, k.nama AS nama_kelas, m.nama AS nama_mapel, m.level AS level_mapel FROM nilai s LEFT JOIN ujian c ON s.id_ujian=c.id_ujian JOIN siswa b ON b.id_siswa=s.id_siswa LEFT JOIN mapel m ON s.id_mapel=m.id_mapel LEFT JOIN kelas k ON b.id_kelas=k.id_kelas WHERE c.status='1' AND s.id_siswa<>'' AND b.ruang='". $pengawas['ruang'] ."'";
            break;
    }

    if (!is_null($idujian) && !is_null($idmapel)) {
        
        $query .= " AND s.id_mapel=". $idmapel ." and s.id_ujian=". $idujian;

    }

    if ($query !== NULL) {
        
        $query  .= " GROUP by s.id_nilai ORDER BY s.id_nilai DESC";
        $result = mysqli_fetch_all(mysqli_query($koneksi, $query), MYSQLI_ASSOC);
        $hasil  = array();

        foreach ($result as $key => $value) {

            $durasi     = getDifferenceTime($value['ujian_mulai'], date('Y-m-d H:i:s', time()));
            $keterangan = '--';

            if ($value['ujian_mulai'] <> '' and $value['ujian_selesai'] <> '') {
                
                $durasi     = getDifferenceTime($value['ujian_mulai'], $value['ujian_selesai']);
                $keterangan = 'selesai';
            }

            if ($value['ujian_mulai'] <> '' and $value['ujian_selesai'] == '') {
                
                $keterangan = 'mengerjakan';

            }

            $data    = array(
                'id'        => $value['id_nilai'],
                'no'        => $key + 1,
                'nis'       => $value['nis'],
                'nama_siswa'=> $value['nama_siswa'],
                'nama_kelas'=> $value['nama_kelas'],
                'mapel'     => $value['kode_ujian'] .' '. $value['nama_mapel'] .' '. $value['level_mapel'],
                'kode_ujian'=> $value['kode_ujian'],
                'nama_mapel'=> $value['nama_mapel'],
                'level_mapel'   => $value['level_mapel'],
                'durasi'    => $durasi,
                'jawaban_benar' => $value['jml_benar'],
                'jawaban_salah' => $value['jml_salah'],
                'skor'      => $value['skor'],
                'ip'        => $value['ipaddress'],
                'keterangan'=> $keterangan
            );

            if (!is_null($idujian) && !is_null($idmapel)) {
                
                $hasil[]    = $data;

            } else {

                $x = strtotime($value['ujian_mulai']);
                $x = date('Y-m-d', $x);
                $l = date('Y-m-d', time());

                if ($x == $l) {
                    
                    $hasil[]    = $data;

                }

            }

        }

        echo json_encode(array(
            'status'    => 'success',
            'data'      => $hasil,
            'message'   => 'Berhasil mengambil data'
        ));

    } else {
        
        echo json_encode(array(
            'status'    => 'error',
            'data'      => [],
            'message'   => 'Tidak dapat menemukan data.'
        ));

    }

} else {

    echo json_encode(array(
        'status'    => 'error',
        'data'      => [],
        'message'   => 'Tidak dapat menemukan data.'
    ));

}

exit();
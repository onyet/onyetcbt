<?php
require("config/config.default.php");
require("config/config.function.php");
require("config/functions.crud.php");

$idm = $_POST['id_mapel'];
$ids = $_POST['id_siswa'];
$idu = $_POST['id_ujian'];
$where = array(
    'id_mapel' => $idm,
    'id_siswa' => $ids,
    'id_ujian' => $idu
);

$benar = $salah = 0;
$mapel = fetch($koneksi, 'mapel', array('id_mapel' => $idm));
// $mapel = mysqli_fetch_assoc(mysqli_query($koneksi, "SELECT * FROM mapel WHERE id_mapel=". $idm));
$siswa = fetch($koneksi, 'siswa', array('id_siswa' => $ids));
// $siswa = mysqli_fetch_assoc(mysqli_query($koneksi, "SELECT * FROM siswa WHERE id_siswa=". $ids));
$ceksoal = select($koneksi, 'soal', array('id_mapel' => $idm, 'jenis' => 1));
// $ceksoal = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM soal WHERE id_mapel=". $idm ." AND jenis=1"),MYSQLI_ASSOC);
$ceksoalesai = select($koneksi, 'soal', array('id_mapel' => $idm, 'jenis' => 2));
// $ceksoalesai = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM soal WHERE id_mapel=". $idm ." AND jenis=2"), MYSQLI_ASSOC);

$arrayjawabesai = array();

foreach ($ceksoalesai as $getsoalesai) {
    $w2 = array(
        'id_siswa' => $ids,
        'id_mapel' => $idm,
        'id_soal' => $getsoalesai['id_soal'],
        'jenis' => 2
    );
    // $cekjwbesai = rowcount($koneksi, 'jawaban', $w2);
    // if ($cekjwbesai <> 0) {
    $getjwb2 = fetch($koneksi, 'jawaban', $w2);
    // $getjwb2 = mysqli_fetch_assoc(mysqli_query($koneksi, "SELECT * FROM jawaban WHERE id_siswa=". $ids ." AND id_mapel=". $idm ." AND id_soal=". $getsoalesai['id_soal'] ." AND jenis=2"));

    if ($getjwb2) {
        $jawabxx = str_replace("'", "`", $getjwb2['esai']);
        $jawabxx = str_replace("#", ">>", $jawabxx);
        $jawabxx = preg_replace('/[^A-Za-z0-9\@\<\>\$\_\&\-\+\(\)\/\?\!\;\:\`\"\[\]\*\{\}\=\%\~\`\÷\× ]/', '', $jawabxx);
        $arrayjawabesai[$getsoalesai['id_soal']] = $jawabxx;
    } else {
        $arrayjawabesai[$getsoalesai['id_soal']] = 'Tidak Diisi';
    }
    // } else {
    // 	$arrayjawabesai[$getjwb2['id_soal']] = 'tidak diisi';
    // }
}

$arrayjawab = array();

foreach ($ceksoal as $getsoal) {
    $w = array(
        'id_siswa' => $ids,
        'id_mapel' => $idm,
        'id_soal' => $getsoal['id_soal'],
        'jenis' => 1
    );

    // $cekjwb = rowcount($koneksi, 'jawaban', $w);
    // if ($cekjwb <> 0) {
    $getjwb = fetch($koneksi, 'jawaban', $w);
    // $getjwb = mysqli_fetch_assoc(mysqli_query($koneksi, "SELECT * FROM jawaban WHERE id_siswa=". $ids ." AND id_mapel=". $idm ." AND id_soal=". $getsoal['id_soal'] ." AND jenis=1"));

    if ($getjwb) {
        $arrayjawab[$getsoal['id_soal']] = $getjwb['jawaban'];
    } else {
        $arrayjawab[$getsoal['id_soal']] = 'X';
    }
    ($getjwb['jawaban'] == $getsoal['jawaban']) ? $benar++ : $salah++;
    // } else {
    // 	$arrayjawab[$getjwb['id_soal']] = 'X';
    // 	$salah++;
    // }
}

$bagi   = $mapel['jml_soal'] / 100;
$bobot  = $mapel['bobot_pg'] / 100;
$skor   = ($benar / $bagi) * $bobot;
$skor   = round($skor);

$data   = array(
    'ujian_selesai' => $datetime,
    'jml_benar'     => $benar,
    'jml_salah'     => $salah,
    'skor'          => $skor,
    'total'         => $skor,
    'online'        => 0,
    'jawaban'       => serialize($arrayjawab),
    'jawaban_esai'  => serialize($arrayjawabesai)
);

$simpan = update($koneksi, 'nilai', $data, $where);
// $simpan = mysqli_query($koneksi, "UPDATE nilai SET ujian_selesai='". $datetime ."', jml_benar=". $benar .", jml_salah=". $salah .", skor='". substr($skor, 0, 9) ."', total='". substr($skor, 0, 9) ."', online=0, jawaban='". serialize($arrayjawab) ."', jawaban_esai='". serialize($arrayjawabesai) ."' WHERE id_mapel=". $idm ." AND id_siswa=". $ids ." AND id_ujian=". $idu);

echo mysqli_error($koneksi);
// if ($simpan) {
//     delete($koneksi, 'jawaban', $where);
// }
mysqli_query($koneksi, "INSERT INTO log (id_siswa,type,text,date) VALUES ('$ids','login','Selesai Ujian','$tanggal $waktu')");

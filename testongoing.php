<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');

$ac = dekripsi($ac);
$id = dekripsi($id);
$qcek = mysqli_query($koneksi, "select * from nilai where id_ujian='$ac' and id_siswa='$id'");
$cek = mysqli_num_rows($qcek);

if ($cek <> 0) {
    $query = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM ujian WHERE id_ujian='$ac'"));
    $idmapel = $query['id_mapel'];
    $no_soal = 0;
    $no_prev = $no_soal - 1;
    $no_next = $no_soal + 1;
    $id_mapel = $idmapel;
    $id_siswa = $id;
    $where = array(
        'id_siswa' => $id_siswa,
        'id_mapel' => $id_mapel
    );
    $where2 = array(
        'id_siswa' => $id_siswa,
        'id_mapel' => $id_mapel,
        'id_ujian' => $ac
    );

    $mapel = fetch($koneksi, 'ujian', array('id_mapel' => $id_mapel, 'id_ujian' => $ac));
    $mulai = update($koneksi, 'nilai', array('ujian_berlangsung' => $datetime), $where2);

    // if ($mulai != 'OK') {
    //     $wk = date('Y-m-d H:i:s', time());
    //     $mulai = mysqli_query($koneksi, "UPDATE ujian SET ujian_berlangsung='". $wk ."' WHERE id_siswa=". $id_siswa ." AND id_mapel=". $id_mapel ." AND id_ujian=". $ac);

    //     if ($mulai == FALSE) {
    //         echo "<script>alert('Terjadi kendala.. coba ulangi kembali.'); window.location='". $homeurl ."/jadwal';</script>";
    //     }
    // }

    $nilai = fetch($koneksi, 'nilai', $where2);
    $habis = strtotime($nilai['ujian_berlangsung']) - strtotime($nilai['ujian_mulai']);
    $detik = ($mapel['lama_ujian'] * 60) - $habis;
    $dtk = $detik % 60;
    $mnt = floor(($detik % 3600) / 60);
    $jam = floor(($detik % 86400) / 3600);
    
    $cekpg = mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM soal WHERE id_mapel='$id_mapel' AND jenis='1'"));
    $cekesai = mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM soal WHERE id_mapel='$id_mapel' AND jenis='2'"));
    $quero = mysqli_fetch_array(mysqli_query($koneksi, "SELECT tampil_pg,tampil_esai FROM mapel WHERE id_mapel='$id_mapel'"));

    if ($cekpg >= $quero['tampil_pg']) {
        $soalpg = $quero['tampil_pg'];
    } else {
        $soalpg = $cekpg;
    }
    
    if ($cekesai >= $quero['tampil_esai']) {
        $soalesai = $quero['tampil_esai'];
    } else {
        $soalpg = $cekesai;
    }

    $jumsoal = $soalpg + $soalesai;

?>
    <div class='row'>
        <div class="col-md-1"></div>
        <div class='col-md-10' >
            <div class='box box-solid' style="box-shadow: 0 1px 15px 5px rgba(0, 0, 0, 0.25);">
                <div class='box-header with-border' >

                    <h3 class='box-title'><span class='hidden-xs'>SOAL NOMOR </span> <span class='btn bg-green' id='displaynum'><b><?= $no_next ?></b></span></h3>

                    <div class='box-title pull-right'>

                        <div class='btn btn-default'>
                            <span style="font-size:20px">Sisa Waktu </span><span style="font-size:20px" id='countdown'> <span id='htmljam'><?= $jam ?></span>:<span id='htmlmnt'><?= $mnt ?></span>:<span id='htmldtk'><?= $dtk ?></span></span>
                        </div>
                        <div class='btn-group'>
                            <form action='' method='post'>
                                <input type='submit' name='done' id='done-submit' style='display:none;' />
                            </form>
                        </div>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-header with-border bg-gray">

                    <div class='btn-group'>
                        <button type='button' id='smaller_font' class='btn bg-purple'> - </button>
                        <button type='button' id='reset_font' class='btn bg-purple'><i class='fa fa-sync-alt'></i></button>
                        <button type='button' id='bigger_font' class='btn bg-purple'> + </button>
                    </div>
                    <div class='box-title pull-right'>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalnosoal">Daftar Soal <i class="fas fa-edit    "></i></button>
                        <!-- Button trigger modal -->

                        <!-- Modal -->
                        <div class="modal fade" id="modalnosoal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"><i class="fas fa-edit    "></i> Daftar Soal</h5>

                                    </div>
                                    <div class="modal-body">
                                        <div id="loadnosoal">

                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times    "></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id='loadsoal' >
                        <div id='loading-image'>
                        <center>
                            <img src="<?=$homeurl ?>/dist/img/loader.gif" class="img-fluid" width="150">
                            <br><b>Sedang memproses soal..</b>
                            <br><b>jika terlalu lama silahkan logout dan login lagi</b>
                            <br><b>cek koneksi internet</b>
                        </center>
                    </div>
                </div>

            </div>
        </div>

    </div>
<?php } else { ?>
    <?php jump($homeurl); ?>
<?php } ?>
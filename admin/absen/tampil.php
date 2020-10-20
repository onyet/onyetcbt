<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');

$jenis  = (isset($_GET['jenis'])) ? $_GET['jenis'] : 'pilih';
$kelas  = (isset($_GET['kelas'])) ? $_GET['kelas'] : 'pilih';
$guru   = (isset($_GET['guru'])) ? $_GET['guru'] : 'all';
$siswa  = (isset($_GET['siswa'])) ? $_GET['siswa'] : 'all';

$namapil= NULL;

$query  = mysqli_query($koneksi, "SELECT tahun from absen_harian GROUP BY tahun ORDER BY tahun DESC");
$allth  = mysqli_fetch_all($query, MYSQLI_ASSOC);

$tahun  = (isset($_GET['tahun'])) ? $_GET['tahun'] : date('Y', time());
$bulan  = (isset($_GET['bulan'])) ? $_GET['bulan'] : (int) date('m', time());
?>

<div class='row'>
    <div class='col-md-12'>
        <div class='box box-solid'>
            <div class='box-header with-border'>
                <h3 class='box-title'>Manajemen Absensi </h3>
                <div class='box-tools pull-right '>
                    <?php if($jenis != 'pilih') { ?>
                    <button type="button" class="btn btn-success" onclick="exportTableToExcel('contianerPrint', 'ABSENSI_<?= strtoupper($jenis).'_'.$tahun.'-'. $bulan ?><?= ($kelas != 'pilih') ? $kelas : '' ?>')">
                        Export Excel
                    </button>
                    <?php } ?>
                </div>
            </div>
            <div class='box-body'>
                <div class="row" style="padding-top: 15px;">
                    <form action="" method="post" enctype="multipart/form-data" class="form-group">
                        <div class="col-md-2 col-sm-12" style="margin-bottom: 10px;">
                            <select name="jenis" class="form-control" onchange="location.href = '<?= $homeurl ?>/admin/?pg=absensi&jenis='+ this.value">
                                <option value="pilih" <?= ($jenis == 'pilih') ? 'selected' : '' ?>>Pilih Jenis Absen</option>
                                <option value="siswa" <?= ($jenis == 'siswa') ? 'selected' : '' ?>>Absensi Siswa</option>
                                <option value="guru" <?= ($jenis == 'guru') ? 'selected' : '' ?>>Absensi Guru</option>
                            </select>
                        </div>
                        <?php if ($jenis == 'guru') { ?>
                        <div class="col-md-3 col-sm-12" style="margin-bottom: 10px;">
                            <select name="guru" class="form-control" onchange="location.href = '<?= $homeurl ?>/admin/?pg=absensi&jenis=<?= $jenis ?>&guru='+ this.value">
                                <option value="all" <?= ($guru == 'all') ? 'selected' : '' ?>>Semua Guru</option>
                                <?php
                                    $query  = mysqli_query($koneksi, "SELECT * FROM pengawas WHERE level='guru' ORDER BY nama ASC");
                                    $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                    foreach ($exec as $column => $row) {
                                        $selected = ($guru == $row['id_pengawas']) ? 'selected' : '';
                                        $namapil  = ($guru == $row['id_pengawas']) ? $row['nama'] : $namapil;
                                        echo '<option value="'. $row['id_pengawas'] .'" '. $selected .'>'. strtoupper($row['nama']) .'</option>';
                                    }
                                ?>
                            </select>
                        </div>
                        <?php } ?>
                        
                        <?php if ($jenis == 'siswa') { ?>
                        <div class="col-md-2 col-sm-12" style="margin-bottom: 10px;">
                            <select name="kelas" class="form-control" onchange="location.href = '<?= $homeurl ?>/admin/?pg=absensi&jenis=<?= $jenis ?>&kelas='+ this.value">
                                <option value="pilih" <?= ($kelas == 'pilih') ? 'selected' : '' ?>>Pilih Kelas</option>
                                <?php
                                    $query  = mysqli_query($koneksi, "SELECT * FROM kelas ORDER BY nama ASC");
                                    $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                    foreach ($exec as $column => $row) {
                                        $selected = ($kelas == $row['id_kelas']) ? 'selected' : '';
                                        echo '<option value="'. $row['id_kelas'] .'" '. $selected .'>'. strtoupper($row['nama']) .'</option>';
                                    }
                                ?>
                            </select>
                        </div>
                            <?php if ($kelas != 'pilih') { ?>
                            <div class="col-md-4 col-sm-12" style="margin-bottom: 10px;">
                                <select name="siswa" class="form-control" onchange="location.href = '<?= $homeurl ?>/admin/?pg=absensi&jenis=<?= $jenis ?>&kelas=<?= $kelas ?>&siswa='+ this.value">
                                    <option value="all" <?= ($siswa == 'all') ? 'selected' : '' ?>>Semua Siswa</option>
                                    <?php
                                        $query  = mysqli_query($koneksi, "SELECT * FROM siswa WHERE id_kelas='". $kelas ."' ORDER BY nama ASC");
                                        $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                        foreach ($exec as $column => $row) {
                                            $selected = ($siswa == $row['id_siswa']) ? 'selected' : '';
                                            $namapil  = ($siswa == $row['id_siswa']) ? $row['nama'] : $namapil;
                                            echo '<option value="'. $row['id_siswa'] .'" '. $selected .'>'. strtoupper($row['nis'] .' - '. $row['nama']) .'</option>';
                                        }
                                    ?>
                                </select>
                            </div>
                            <?php } ?>
                        <?php } ?>

                        <?php if ($jenis == 'guru' || ($jenis == 'siswa' && $kelas != 'pilih')) { ?>
                        <?php
                            $myurl = $homeurl . str_replace(array('/candycbt', '&tahun='. $tahun, '&bulan='. $bulan), '', $_SERVER['REQUEST_URI']);
                        ?>
                        <div class="col-md-2 col-sm-6" style="margin-bottom: 10px;">
                            <select name="tahun" class="form-control" onchange="location.href = '<?= $myurl ?>&tahun='+ this.value">
                                <?php foreach ($allth as $column => $row) {
                                    $selected = ($tahun == $row['tahun']) ? 'selected' : '';
                                    echo '<option value="'. $row['tahun'] .'" '. $selected .'>'. $row['tahun'] .'</option>';
                                } ?>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6" style="margin-bottom: 10px;">
                            <select name="bulan" class="form-control" onchange="location.href = '<?= $myurl ?>&tahun=<?= $tahun ?>&bulan='+ this.value">
                                <?php 
                                $bln = ($tahun == date('Y', time())) ? (int) date('m', time()) : 12;
                                for ($i=1; $i <= $bln; $i++) {
                                    $selected = ($bulan == $i) ? 'selected' : '';
                                    echo '<option value="'. $i .'" '. $selected .'>'. bulan_indo2($i) .'</option>';
                                } ?>
                            </select>
                        </div>
                        <?php } ?>
                    </form>
                </div>
                <hr>
                <div id="contianerPrint" class='table-responsive'>
                    <?php if ($jenis == 'pilih') { ?>
                    <div style="text-align: center;">
                        <h4>Silahkan Pilih Jenis Absen Dahulu!</h4>
                    </div>
                    <?php } else if ($jenis == 'siswa' && $kelas == 'pilih') { ?>
                    <div style="text-align: center;">
                        <h4>Silahkan Pilih Kelas Dahulu!</h4>
                    </div>
                    <?php } else { ?>
                    <div class="row" style="margin-bottom: 15px;">
                        <center>
                            <h3>ABSENSI <?= strtoupper($jenis) ?></h3>
                            <h4>TAHUN <?= $tahun ?> BULAN <?= strtoupper(bulan_indo2($bulan)) ?></h4>
                            <?php if ($jenis == 'siswa' && $kelas != 'pilih') {
                                echo '<h4>KELAS '. $kelas .'</h4>';
                            } ?>
                            <?php if(($jenis == 'guru' && $guru != 'all') || ($jenis == 'siswa' && $kelas != 'pilih' && $siswa != 'all')) { ?>
                                <h4><?= strtoupper($namapil) ?></h4>
                            <?php } ?>
                        </center>
                    </div>
                    <?php } ?>

                    <?php
                    if(($jenis == 'guru' && $guru == 'all') || ($jenis == 'siswa' && $siswa =='all' && $kelas != 'pilih')) {
                        $loop = date('t', strtotime($tahun .'-'. $bulan .'-1'));
                        $loop = ($bulan == (int)date('m', time())) ? (int) date('d', time()) : $loop;

                    ?>
                    <table id='table-absen' class='table table-bordered table-striped'>
                        <thead>
                            <tr>
                                <th rowspan="2" style="vertical-align: middle; text-align: center;">No</th>
                                <?php if ($jenis == 'guru') { ?>
                                <th rowspan="2" style="vertical-align: middle; text-align: center;">Nama Guru</th>
                                <?php } else { ?>
                                <th rowspan="2" style="vertical-align: middle; text-align: center;">Nama Siswa</th>
                                <?php } ?>
                                <th colspan="<?= $loop ?>" style="vertical-align: middle; text-align: center;">Bulan <?= ucfirst(bulan_indo2($bulan)) ?></th>
                            </tr>
                            <tr>
                                <?php for ($i=1; $i <= $loop ; $i++) { 
                                echo '<th style="vertical-align: middle; text-align: center;">'. (($i < 10) ? '0'. $i : $i) .'</th>';
                                } ?>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                            $list = array();

                            if ($jenis == 'guru') {
                                $query  = mysqli_query($koneksi, "SELECT * FROM pengawas WHERE level='guru' ORDER BY nama ASC");
                                $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                foreach ($exec as $column => $row) {
                                    
                                    $list[$column] = array(
                                        'no'    => ($column + 1),
                                        'nama'  => $row['nama']
                                    );

                                    $query  = mysqli_query($koneksi, "SELECT * FROM absen_harian WHERE id_user=". $row['id_pengawas'] ." AND level='guru' AND tahun=". $tahun ." AND bulan=". $bulan);
                                    $hadir  = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                    for ($i=1; $i <= $loop ; $i++) {

                                        $menghadiri = false;

                                        foreach ($hadir as $key => $row_hadir) {
                                            
                                            if ($i == $row_hadir['hari']) {
                                                
                                                $menghadiri = true;

                                            }

                                        }

                                        $list[$column]['daftar_hadir'][$i] = $menghadiri;

                                    }

                                }
                            }

                            if ($jenis == 'siswa') {
                                $query  = mysqli_query($koneksi, "SELECT * FROM siswa WHERE id_kelas='". $kelas ."' ORDER BY nama ASC");
                                $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                foreach ($exec as $column => $row) {
                                    
                                    $list[$column] = array(
                                        'no'    => ($column + 1),
                                        'nama'  => $row['nis'] .' - '. $row['nama']
                                    );

                                    $query  = mysqli_query($koneksi, "SELECT * FROM absen_harian WHERE id_user=". $row['id_siswa'] ." AND level='siswa' AND tahun=". $tahun ." AND bulan=". $bulan);
                                    $hadir  = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                    for ($i=1; $i <= $loop ; $i++) {

                                        $menghadiri = false;

                                        foreach ($hadir as $key => $row_hadir) {
                                            
                                            if ($i == $row_hadir['hari']) {
                                                
                                                $menghadiri = true;

                                            }

                                        }

                                        $list[$column]['daftar_hadir'][$i] = $menghadiri;

                                    }

                                }
                            }

                            foreach ($list as $key => $result) {
                                echo '<tr>';
                                echo '<td>'. $result['no'] .'</td>';
                                echo '<td>'. strtoupper($result['nama']) .'</td>';

                                foreach ($result['daftar_hadir'] as $key2 => $harihadir) {
                                    $td = ($harihadir) ? '<td style="vertical-align= middle; text-align: center; background: green; color: white;">h</td>' : '<td style="vertical-align= middle; text-align: center; background: red;">x</td>';
                                    echo $td;
                                }

                                echo '</tr>';
                            }
                        ?>
                        </tbody>
                    </table>
                    <?php } ?>

                    <?php if (($jenis == 'guru' && $guru != 'all') || ($jenis == 'siswa' && $siswa !='all' && $kelas != 'pilih')) { ?>
                    <table id='table-absen' class='table table-bordered table-striped'>
                        <thead>
                            <tr>
                                <th style="vertical-align: middle; text-align: center;">TGL</th>
                                <th style="vertical-align: middle; text-align: center;">HARI</th>
                                <th style="vertical-align: middle; text-align: center;">KEHADIRAN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $loop = date('t', strtotime($tahun .'-'. $bulan .'-1'));
                            $loop = ($bulan == (int)date('m', time())) ? (int) date('d', time()) : $loop;
                            $list = array();

                            if ($jenis == 'guru' && $guru != 'all') {
                                $query  = mysqli_query($koneksi, "SELECT * FROM absen_harian WHERE id_user=". $guru ." AND level='guru' AND tahun=". $tahun ." AND bulan=". $bulan ." ORDER BY hari ASC");
                                $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                for ($i=1; $i <= $loop ; $i++) {

                                    $index  = $i - 1;
                                    $list[$index] = array(
                                        'tgl'   => $i .' '. bulan_indo2($bulan) .' '. $tahun,
                                        'hari'  => hari_indo2($tahun.'-'.$bulan.'-'.$i),
                                        'kehadiran' => false
                                    );

                                    foreach ($exec as $key => $row_hadir) {
                                        
                                        if ($i == $row_hadir['hari']) {
                                            
                                            $list[$index]['kehadiran'] = $row_hadir['hadir'] .' '. $row_hadir['waktu'];

                                        }

                                    }

                                }

                            }

                            if ($jenis == 'siswa' && $kelas != 'pilih' && $siswa != 'all') {
                                $query  = mysqli_query($koneksi, "SELECT * FROM absen_harian WHERE id_user=". $siswa ." AND level='siswa' AND tahun=". $tahun ." AND bulan=". $bulan ." ORDER BY hari ASC");
                                $exec   = mysqli_fetch_all($query, MYSQLI_ASSOC);

                                for ($i=1; $i <= $loop ; $i++) {

                                    $index  = $i - 1;
                                    $list[$index] = array(
                                        'tgl'   => $tahun .'/'. $bulan .'/'. $i,
                                        'hari'  => hari_indo2($tahun.'-'.$bulan.'-'.$i),
                                        'kehadiran' => false
                                    );

                                    foreach ($exec as $key => $row_hadir) {
                                        
                                        if ($i == $row_hadir['hari']) {
                                            
                                            $list[$index]['kehadiran'] = $row_hadir['hadir'] .' '. $row_hadir['waktu'];

                                        }

                                    }

                                }

                            }

                            foreach ($list as $key => $value) {
                                echo '<tr>';
                                    echo '<td>'. $value['tgl'] .'</td>';
                                    echo '<td>'. $value['hari'] .'</td>';
                                    if ($value['kehadiran'] != false) {
                                        echo '<td style="vertical-align= middle; text-align: center; background: green; color: white;">'. $value['kehadiran'] .'</td>';
                                    } else {
                                        echo '<td style="vertical-align= middle; text-align: center; background: red;">Tidak Hadir</td>';
                                    }
                                echo '</tr>';
                            }
                            ?>
                        </tbody>
                    </table>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function exportTableToExcel(tableID, filename = ''){
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.getElementById(tableID);
        var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
        
        // Specify file name
        filename = filename?filename+'.xls':'excel_data.xls';
        
        // Create download link element
        downloadLink = document.createElement("a");
        
        document.body.appendChild(downloadLink);
        
        if(navigator.msSaveOrOpenBlob){
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob( blob, filename);
        }else{
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
        
            // Setting the file name
            downloadLink.download = filename;
            
            //triggering the function
            downloadLink.click();
        }
    }
</script>
<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');

function replace_meet_data($koneksi, $meetid, $class, $teachers) {

    if (count($class) > 0 && count($teachers) > 0) {
    
        $query = mysqli_query($koneksi, "DELETE FROM meet_has_class WHERE id_meet = ". $meetid);
        $query = mysqli_query($koneksi, "DELETE FROM meet_has_guru WHERE id_meet = ". $meetid);
        
        try {

            foreach ($class as $key => $value) {
                
                $query = mysqli_query($koneksi, "INSERT INTO meet_has_class (id_meet, id_kelas) VALUES (". $meetid .", '". $value ."')");

            }

            foreach ($teachers as $key => $value) {
                
                $query = mysqli_query($koneksi, "INSERT INTO meet_has_guru (id_meet, id_guru) VALUES (". $meetid .", ". $value .")");

            }

            return TRUE;

        } catch(Exception $e) {

            return $e;

        }
    
    } else {

        return FALSE;

    }

}

$action = $_GET['ac'];

if ($action == 'add') {
    $judul  = addslashes($_POST['judul']);
    // $idguru = ($_SESSION['level'] == 'admin') ? $_POST['guru'] : $_SESSION['id_pengawas'];
    $idpengawas = $_SESSION['id_pengawas'];
    $idguru = $_POST['guru'];
    $idmapel= $_POST['mapel'];
    $idkelas= $_POST['kelas'];
    $deskrip= addslashes($_POST['deskripsi']);
    $room   = APLIKASI;
    $room   = $room . $idpengawas . $idmapel . time();
    $room   = str_replace(array(' ', '\'', '"', '\\', '/', '=', '+'), '', $room);
    $room   = strtolower($room);
    $query = mysqli_query($koneksi, "SELECT * FROM meet WHERE room = '". $room ."' AND create_at = ". $idpengawas);
    $exce = mysqli_num_rows($query);

    if ($exce > 0) {
        
        $result = mysqli_fetch_row($query);
        if (replace_meet_data($koneksi, $result[0], $idkelas, $idguru) === TRUE) {
                
            $exce = mysqli_query($koneksi, "UPDATE meet SET judul = '". $judul ."', deskripsi = '". $deskrip ."' WHERE room = '". $room ."' AND create_at = ". $idpengawas);
        
        }

    } else {
        
        $exce = mysqli_query($koneksi, "INSERT INTO meet (id_mapel,room,judul,deskripsi,create_by) VALUES ('". $idmapel ."', '". $room ."', '". $judul ."', '". $deskrip ."', ". $idpengawas .")");
        $idmeet = mysqli_insert_id($koneksi);
        $exce = replace_meet_data($koneksi, $idmeet, $idkelas, $idguru);

    }

    echo "<script>window.location = '?pg=meeting'</script>";
    exit();

}

if ($action == 'delete') {
    
    $room = addslashes($_GET['room']);
    $result = mysqli_fetch_row(mysqli_query($koneksi, "SELECT * FROM meet WHERE room = '". $room ."'"));
    if ($result !== NULL) {

        $idmeet = $result[0];
        $exce = mysqli_query($koneksi, "DELETE FROM meet WHERE id = ". $idmeet);
        $exce = mysqli_query($koneksi, "DELETE FROM meet_has_class WHERE id_meet = ". $idmeet);
        $exce = mysqli_query($koneksi, "DELETE FROM meet_has_guru WHERE id_meet = ". $idmeet);
    
    }

    echo "<script>window.location = '?pg=meeting'</script>";
    exit();

}

if ($action == 'masuk') {

    $room = base64_decode($_GET['room']);
    $exce = mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM meet WHERE room = '". $room ."'"));

    if ($exce > 0) {

        $exce = mysqli_query($koneksi, "UPDATE meet SET status=true WHERE room = '". $room ."'");
        
        echo '<div id="meeting" style="background-color: #757575; border: none; position: absolute; z-index: 2000; top: 0; width: 100%; left: 0; right: 0; bottom: 0; height: 100%;"></div>';
        echo '<a href="?pg=meeting&ac=keluar&room='. $_GET['room'] .'" style="background: white; position: absolute; z-index: 2001; left: 0; top: 0; color:#757575; padding: 10px 13px; border-radius: 0 0 50% 0;"><i class="fas fa-times"></i></a>';
        echo '<script src="https://meet.jit.si/external_api.js"></script>';
        echo '<script>
            const options = {
                roomName: \''. $room .'\',
                parentNode: document.querySelector(\'#meeting\')
            };
            const api = new JitsiMeetExternalAPI(\'meet.jit.si\', options);
        </script>';

    } else {

        echo "<script>window.location = '?pg=meeting'</script>";
        exit();
    
    }

}

if ($action == 'keluar') {
    
    $room = base64_decode($_GET['room']);
    $exce = mysqli_query($koneksi, "UPDATE meet SET status=false WHERE room = '". $room ."'");
    echo "<script>window.location = '?pg=meeting'</script>";
    exit();


}

$query  = "SELECT * FROM meet a LEFT JOIN pengawas p ON p.id_pengawas = a.create_by";

if ($_SESSION['level'] != 'admin') {
    
    $query .= " WHERE create_by = ";
    $query .= $_SESSION['id_pengawas'];

}

$rooms  = mysqli_fetch_all(mysqli_query($koneksi, $query), MYSQLI_ASSOC);

?>
<div class='row'>
    <div class='col-md-12'>
        <div class='box box-solid'>
            <div class='box-header with-border '>
                <h3 class='box-title'><i class="fas fa-video fa-fw"></i> Tatap Muka</h3>
                <div class="box-tools pull-right">
                    <a data-toggle="modal" data-backdrop="static" data-target="#addRoom"
                        class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-plus"></i> <span
                            class="hidden-xs">Buat Room</span></a>
                </div>
            </div><!-- /.box-header -->
            <div class='box-body'>
                <div class="alert alert-warning" role="alert">Pastikan anda memiliki koneksi yang memadai atau stabil.
                </div>
                <div class="row">
                    <?php
                    foreach ($rooms as $key => $value) {
                    ?>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <div class="caption bg-info">
                                <h3><?= substr($value['judul'], 0, 18) ?></h3>
                                <p>
                                    <span class="badge bg-red"><?= strtoupper($value['nama']) ?></span>
                                    <?php
                                        $gurus = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM meet_has_guru a LEFT JOIN pengawas b ON a.id_guru = b.id_pengawas WHERE a.id_meet = ". $value['id']), MYSQLI_ASSOC);
                                        foreach ($gurus as $key2 => $value2) {
                                            echo '
                                            <span class="badge bg-red">'. strtoupper($value2['nama']) .'</span>';
                                        }
                                    ?>
                                    <span class="badge bg-green"><?= strtoupper($value['id_mapel']) ?></span>
                                    <?php
                                        $kelas = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM meet_has_class a LEFT JOIN kelas b ON a.id_kelas = b.id_kelas WHERE a.id_meet = ". $value['id']), MYSQLI_ASSOC);
                                        foreach ($kelas as $key2 => $value2) {
                                            echo '
                                            <span class="badge bg-yellow">'. strtoupper($value2['nama']) .'</span>';
                                        }
                                    ?>
                                </p>
                                <p>
                                    <?= $value['deskripsi'] ?>
                                </p>
                                <div class="btn-group btn-group-lg btn-group-justified" role="group"
                                    aria-label="Justified button group">
                                    <a href="?pg=meeting&ac=masuk&room=<?= base64_encode($value['room']) ?>" class="btn btn-info" role="button"><i class="fas fa-video"></i>
                                        Masuk</a>
                                    <a href="?pg=meeting&ac=delete&room=<?= $value['room'] ?>" class="btn btn-danger" role="button" onclick="return confirm('Anda yakin ingin menghapus room ini ?')"><i class="fas fa-trash"></i>
                                        Hapus</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Invitation -->
<?php
if ($_SESSION['level'] != 'admin') {

    $inveted = mysqli_fetch_all(mysqli_query($koneksi, "SELECT *, b.id AS id_meet_has_guru FROM meet a LEFT JOIN meet_has_guru b ON a.id = b.id_meet LEFT JOIN pengawas p ON p.id_pengawas = a.create_by WHERE b.id_guru = ". $_SESSION['id_pengawas'] ." AND a.create_by != ". $_SESSION['id_pengawas']), MYSQLI_ASSOC);

    if ($inveted !== NULL) {
?>
<div class='row'>
    <div class='col-md-12'>
        <div class='box box-solid'>
            <div class='box-header with-border '>
                <h3 class='box-title'><i class="fas fa-video fa-fw"></i> Undangan Tatap Muka</h3>
            </div><!-- /.box-header -->
            <div class='box-body'>
                <div class="row">
                    <?php
                    foreach ($inveted as $key => $value) {
                    ?>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <div class="caption bg-info">
                                <h3><?= substr($value['judul'], 0, 18) ?></h3>
                                <p>
                                    <span class="badge bg-red">Dari : <?= strtoupper($value['nama']) ?></span>
                                    <span class="badge bg-green"><?= strtoupper($value['id_mapel']) ?></span>
                                    <?php
                                        $kelas = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM meet_has_class a LEFT JOIN kelas b ON a.id_kelas = b.id_kelas WHERE a.id_meet = ". $value['id']), MYSQLI_ASSOC);
                                        foreach ($kelas as $key2 => $value2) {
                                            echo '
                                            <span class="badge bg-yellow">'. strtoupper($value2['nama']) .'</span>';
                                        }
                                    ?>
                                </p>
                                <p>
                                    <?= $value['deskripsi'] ?>
                                </p>
                                <div class="btn-group btn-group-lg btn-group-justified" role="group"
                                    aria-label="Justified button group">
                                    <a href="?pg=meeting&ac=masuk&room=<?= base64_encode($value['room']) ?>" class="btn btn-info" role="button">Terima & Masuk</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php }} ?>

<div class="modal fade" id="addRoom" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <form action="?pg=meeting&ac=add" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Buat Room Baru</h4>
                </div>
                <div class="modal-body">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Judul</label>
                            <input type="text" class="form-control" maxlength="110" name="judul" required>
                        </div>
                        <?php if($_SESSION['level'] == 'admin') { ?>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Guru</label>
                            <select name="guru[]" class="form-control select2" style="width:100%" multiple="true" required>
                                <?php
                                    $exce = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM pengawas WHERE level='guru' ORDER BY nama ASC"), MYSQLI_ASSOC);

                                    foreach ($exce as $key => $value) {
                                        
                                        echo '<option value="'. $value['id_pengawas'] .'">'. strtoupper($value['nama']) .'</option>';

                                    }
                                ?>
                            </select>
                        </div>
                        <?php } ?>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Pelajaran</label>
                            <select name="mapel" class="form-control" required>
                                <?php
                                    $exce = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM mata_pelajaran ORDER BY nama_mapel ASC"), MYSQLI_ASSOC);

                                    foreach ($exce as $key => $value) {
                                        
                                        echo '<option value="'. $value['kode_mapel'] .'">'. strtoupper($value['nama_mapel']) .'</option>';

                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Kelas</label>
                            <select name="kelas[]" class="form-control select2" style="width:100%" multiple="true" required>
                                <?php
                                    $exce = mysqli_fetch_all(mysqli_query($koneksi, "SELECT * FROM kelas ORDER BY nama ASC"), MYSQLI_ASSOC);

                                    foreach ($exce as $key => $value) {
                                        
                                        echo '<option value="'. $value['id_kelas'] .'">'. strtoupper($value['nama']) .'</option>';

                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">Deskripsi:</label>
                            <textarea class="form-control" name="deskripsi" maxlength="250" rows="4"></textarea>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Buat Room</button>
                </div>
            </div>
        </form>
    </div>
</div>
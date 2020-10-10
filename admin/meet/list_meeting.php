<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');

$action = $_GET['ac'];

if ($action == 'add') {

    $judul  = addslashes($_POST['judul']);
    $idguru = ($_SESSION['level'] == 'admin') ? $_POST['guru'] : $_SESSION['id_pengawas'];
    $idmapel= $_POST['mapel'];
    $idkelas= $_POST['kelas'];
    $deskrip= addslashes($_POST['deskripsi']);
    $room   = APLIKASI;
    $room   = $room . $idguru . $idmapel . $idkelas;
    $room   = str_replace(array(' ', '\'', '"', '\\', '/', '=', '+'), '', $room);
    $room   = strtolower($room);

    $exce = mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM meet WHERE room = '". $room ."'"));

    if ($exce > 0) {
        
        $exce = mysqli_query($koneksi, "UPDATE meet SET judul = '". $judul ."', deskripsi = '". $deskrip ."' WHERE room = '". $room ."'");

    } else {
        
        $exce = mysqli_query($koneksi, "INSERT INTO meet (id_guru,id_mapel,id_kelas,room,judul,deskripsi) VALUES (". $idguru .", '". $idmapel ."', '". $idkelas ."', '". $room ."', '". $judul ."', '". $deskrip ."')");

    }

    echo "<script>window.location = '?pg=meeting'</script>";
    exit();

}

if ($action == 'delete') {
    
    $room = $_GET['room'];
    $exce = mysqli_query($koneksi, "DELETE FROM meet WHERE room = '". $room ."'");

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

$query  = "SELECT * FROM meet LEFT JOIN pengawas ON meet.id_guru = pengawas.id_pengawas";

if ($_SESSION['level'] != 'admin') {
    
    $query .= " WHERE meet.id_guru = ";
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
                <div class="alert alert-warning" role="alert">Guru harus masuk ke room dahulu, agar siswa dapat melihat room tersebut. Pastikan anda memiliki koneksi yang memadai atau stabil.
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
                                    <span class="badge bg-yellow"><?= strtoupper($value['id_kelas']) ?></span>
                                    <span class="badge bg-green"><?= strtoupper($value['id_mapel']) ?></span>
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
                            <select name="guru" class="form-control" required>
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
                            <select name="kelas" class="form-control" required>
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
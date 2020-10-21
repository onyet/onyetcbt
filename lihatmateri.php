<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');
$ac = dekripsi($ac);
// echo $ac;
if (isset($_POST['komentar'])) {
    
    $query = mysqli_query($koneksi, "insert into materi_komentar(id_materi,id_user,komentar,level,create_at) values(". $ac .",". $_SESSION['id_siswa'] .",'". addslashes($_POST['komentar']) ."','siswa','". date('Y-m-d H:i:s', time()) ."')");
    echo "<script>window.location = '". $_SERVER['REQUEST_URI'] ."'</script>";
    exit();

}

$materi = mysqli_fetch_array(mysqli_query($koneksi, "select * from materi where id_materi='$ac'"));
$komentar = mysqli_fetch_all(mysqli_query($koneksi, "select * from materi_komentar where id_materi='$ac'"), MYSQLI_ASSOC);
?>
<div class='row'>
    <div class='col-md-12'>
        <div class='box box-solid'>
            <div class='box-header with-border'>

                <h3 class='box-title'><i class="fas fa-file-signature    "></i> Detail materi Siswa</h3>
            </div><!-- /.box-header -->
            <div class='box-body'>
                <table class='table table-bordered table-striped'>
                    <tr>
                        <th width='150'>Mata Pelajaran</th>
                        <td width='10'>:</td>
                        <td><?= $materi['mapel'] ?></td>

                    </tr>

                    <tr>
                        <th>Tgl Publish</th>
                        <td width='10'>:</td>
                        <td><?= $materi['tgl_mulai'] ?></td>
                    </tr>

                </table>
                <?php if ($materi['file'] <> null) { ?>
                Download File Pendukung<p>
                    <?php  if(isset($_SESSION['is_mobile'])) { ?>

                    <a href="#" onclick="copyToClipboard('<?= $homeurl ?>/berkas/<?= $materi['file'] ?>')" class="btn btn-primary">Copy Link Download</a>
                    <a href="<?= $homeurl ?>/viewer/<?= enkripsi(urlencode($homeurl .'/berkas/'. $materi['file'])) ?>" class="btn btn-success">Lihat File Sekarang</a>

                    <?php } else { ?>

                    <a target="_blank" href='<?= $homeurl ?>/berkas/<?= $materi['file'] ?>' class="btn btn-primary">Unduh File Pendukung</a>

                    <?php } ?>
                <?php } ?>
                    <center>
                        <div class="callout">
                            <strong>
                                <h3><?= $materi['judul'] ?></h3>
                            </strong>
                        </div>
                    </center>
                    <?php if ($materi['youtube'] <> null) {  ?>
                    <div class="col-md-3"></div>
                    <div class="callout col-md-6">
                        <iframe width="100%" height="315" src="<?= $materi['youtube'] ?>" frameborder="0"
                            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    </div>
                    <?php } ?>
                    <div class="col-md-12">
                        <?= $materi['materi'] ?>
                    </div>
            </div>

        </div>
        <div class='box box-solid'>
            <div class='box-header with-border'>

                <h3 class='box-title'><i class="fas fa-comment"></i> Komentar</h3>
            </div><!-- /.box-header -->
            <div class='box-body'>
                <?php if(isset($komentar) && count($komentar > 0)) { ?>
                <ul class="list-group">
                    <?php foreach ($komentar as $key => $value) { ?>
                    <li class="list-group-item">
                        <div class="row">
                            <?php
                                $detailuser = array();
                                switch ($value['level']) {
                                    case 'siswa':
                                        $query = mysqli_fetch_array(mysqli_query($koneksi, "select * from siswa where id_siswa=". $value['id_user']));
                                        $detailuser['nama'] = ucwords($query['nama']);
                                        $detailuser['kelas'] = $query['idpk'] ." ". $query['id_kelas'];
                                        $detailuser['foto'] = (isset($query['foto'])) ? 'fotosiswa/'. $query['foto'] : 'default.png';
                                        break;

                                    case 'guru':
                                        $query = mysqli_fetch_array(mysqli_query($koneksi, "select * from pengawas where id_pengawas=". $value['id_user']));
                                        $detailuser['nama'] = $query['nama'];
                                        $detailuser['foto'] = (isset($query['foto'])) ? 'fotoguru/'. $query['foto'] : 'default.png';
                                        break;
                                }
                            ?>
                            <div class="col-xs-2 col-md-1" style="padding: 3px;">
                                <img src="<?= $homeurl ?>/foto/<?= $detailuser['foto'] ?>" class="img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    <h5 style="margin-bottom: 0;"><?= $detailuser['nama'] ?></h5>
                                    <div class="badge" style="font-size: x-small;<?= ($value['level'] != 'siswa') ? 'background-color: #ffc800; color: #000;' : '' ?>">
                                        <?= ($value['level'] == 'siswa') ? 'Kelas '. $detailuser['kelas'] : 'Pengajar/Pengawas' ?> on <?= date('d M Y H:i:s', strtotime($value['create_at'])) ?>
                                    </div>
                                </div>
                                <div style="margin-top: 5px;">
                                    <?= $value['komentar'] ?>
                                </div>
                                <!-- <div style="margin-top: 5px;">
                                    <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                    </button>
                                    <button type="button" class="btn btn-success btn-xs" title="Approved">
                                        <span class="glyphicon glyphicon-ok"></span>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs" title="Delete">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </div> -->
                            </div>
                        </div>
                    </li>
                    <?php } ?>
                </ul>
                <?php } ?>

                <form method='post'>
                    <div class='form-group'>
                        <textarea name='komentar' id='txtkomentar' class='form-control'></textarea>
                        <button type='submit' name='submit' class='btn btn-primary'>Kirim Komentar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        
        function copyToClipboard(text) {
            const listener = function(ev) {
            ev.preventDefault();
            ev.clipboardData.setData('text/plain', text);
            };
            document.addEventListener('copy', listener);
            document.execCommand('copy');
            document.removeEventListener('copy', listener);
            alert('Berhasil copy url download file. Silahkan paste pada browser!');
        }

        $.ajax({
            url: 'https://api.github.com/emojis',
            async: false
        }).then(function (data) {
            window.emojis = Object.keys(data);
            window.emojiUrls = data;
        });

        $('#txtkomentar').summernote({
            minHeight: 100,
            toolbar: false,
            placeholder: 'Ketik komentar disini, untuk emoji awali dengan : dan dilanjutkan dengan huruf lainya.',
            hint: {
                match: /:([\-+\w]+)$/,
                search: function (keyword, callback) {
                    callback($.grep(emojis, function (item) {
                        return item.indexOf(keyword) === 0;
                    }));
                },
                template: function (item) {
                    var content = emojiUrls[item];
                    return '<img src="' + content + '" width="20" /> :' + item + ':';
                },
                content: function (item) {
                    var url = emojiUrls[item];
                    if (url) {
                        return $('<img />').attr('src', url).css('width', 20)[0];
                    }
                    return '';
                }
            }
        });
    });
</script>
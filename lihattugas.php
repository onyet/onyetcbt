<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');
$ac = dekripsi($ac);
$tugas = mysqli_fetch_array(mysqli_query($koneksi, "select * from tugas where id_tugas='$ac'"));
$mapel = mysqli_fetch_array(mysqli_query($koneksi, "select * from mata_pelajaran where kode_mapel='$tugas[mapel]'"));
?>
<div class='row'>
    <div class='col-md-12'>
        <div class='box box-solid'>
            <div class='box-header with-border'>

                <h3 class='box-title'><i class="fas fa-file-signature    "></i> Detail Tugas Siswa</h3>
            </div><!-- /.box-header -->
            <div class='box-body'>
                <table class='table table-bordered table-striped'>
                    <tr>
                        <th width='150'>Mata Pelajaran</th>
                        <td width='10'>:</td>
                        <td><?= $mapel['nama_mapel'] ?></td>

                    </tr>

                    <tr>
                        <th>Tgl Mulai</th>
                        <td width='10'>:</td>
                        <td><?= $tugas['tgl_mulai'] ?></td>
                    </tr>
                    <tr>
                        <th>Tgl Selesai</th>
                        <td width='10'>:</td>
                        <td><?= $tugas['tgl_selesai'] ?></td>
                    </tr>

                </table>
                <br>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Materi & Soal</a></li>
                        <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="true">Kirim Jawaban</a></li>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1">
                            <?php if ($tugas['file'] <> null) { ?>
                                Download File Pendukung<p>
                                    
                                    <?php  if(isset($_SESSION['is_mobile'])) { ?>

                                    <a target="_blank" href="#" onclick="copyToClipboard('<?= $homeurl ?>/berkas/<?= $tugas['file'] ?>')" class="btn btn-primary">Copy Link Download</a>
                                    <a href="<?= $homeurl ?>/viewer/<?= enkripsi(urlencode($homeurl .'/berkas/'. $tugas['file'])) ?>" class="btn btn-success">Lihat File Sekarang</a>
                                    
                                    <?php } else { ?>

                                        <a target="_blank" href='<?= $homeurl ?>/berkas/<?= $tugas['file'] ?>' class="btn btn-primary">Unduh File Pendukung</a>
                                    
                                    <?php } ?>
                            <?php } ?>
                                <center>
                                    <h3><?= $tugas['judul'] ?></h3>
                                </center>
                                <p><?= $tugas['tugas'] ?></p>
                        </div>
                        <div class="tab-pane" id="tab_2">
                            <?php
                            $kondisi = array(
                                'id_siswa' => $_SESSION['id_siswa'],
                                'id_tugas' => $tugas['id_tugas']
                            );
                            $jawab_tugas = fetch($koneksi, 'jawaban_tugas', $kondisi);
                            if ($jawab_tugas) {
                                $jawaban = $jawab_tugas['jawaban'];
                            } else {
                                $jawaban = "";
                            }
                            ?>
                            <?php if ($jawab_tugas['nilai'] <> '') { ?>
                                <div class="alert alert-success" role="alert">
                                    <strong>Jawaban telah dikoreksi dan dinilai</strong>
                                </div>
                                <h1>Nilai Kamu : <?= $jawab_tugas['nilai'] ?></h1>
                            <?php } else { ?>
                                <div class="alert alert-danger" role="alert">
                                    <strong>Kerjakan dengan jujur dan benar.</strong>
                                </div>

                                <form id='formjawaban'>
                                    <input type="hidden" name="id_tugas" value="<?= $tugas['id_tugas'] ?>">
                                    <div class="form-group">
                                        <label for="">Lembar Jawaban</label>
                                        <textarea class="form-control" name="jawaban" id="txtjawaban" rows="10"><?= $jawaban ?></textarea>
                                    </div>
                                    <?php if ($jawab_tugas['file'] <> '') { ?>

                                        <div class="alert alert-success" role="alert">
                                            <strong>file jawaban berhasil dikirim</strong>
                                            <?php  if(isset($_SESSION['is_mobile'])) { ?>
                                                <a href='<?= $homeurl ?>/viewer/<?= enkripsi(urlencode($homeurl .'/tugas/'. $jawab_tugas['file'])) ?>'>Lihat file</a>
                                            <?php } else { ?>
                                                <a href="<?= $homeurl ?>/tugas/<?= $jawab_tugas['file'] ?>">Lihat</a>
                                            <?php } ?>
                                        </div>

                                    <?php  } ?>
                                    
                                    <div class="form-group">
                                        <label for="">Upload Jawaban</label>
                                        <input type="file" class="form-control-file" name="file" aria-describedby="fileHelpId">
                                        <small id="fileHelpId" class="form-text text-muted">jika jawaban diupload. Gunakan format jpg, png, docx, pdf atau xlsx.</small>
                                    </div>

                                    <div class="form-group">
                                        <button id="btnsubmitjawabn" type="submit" class="btn btn-primary">Simpan Jawaban</button>
                                    </div>
                                </form>
                            <?php  } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#formjawaban').submit(function(e) {
        e.preventDefault();
        var data = new FormData(this);
        var homeurl = '<?= $homeurl ?>';
        var btnsubmit = $('#btnsubmitjawabn')
        
        btnsubmit.attr('disabled', 'disabled');
        btnsubmit.text('Sedang Menyimpan...');
        $.ajax({
            type: 'POST',
            url: homeurl + '/simpantugas.php',
            enctype: 'multipart/form-data',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {

                if (data = 'ok') {
                    toastr.success("jawaban berhasil dikirim");
                    window.location.reload();
                } else {
                    toastr.error("jawaban gagal dikirim");
                    btnsubmit.removeAttr('disabled');
                    btnsubmit.text('Simpan Jawaban');
                }


            }
        });
        return false;
    });
</script>
<script>
    $(document).ready(function() {
        
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

        $('#txtjawaban').summernote({
            minHeight: 300,
            callbacks: {
                onImageUpload: function(files) {
                    data = new FormData();
                    data.append("file", files[0]);
                    data.append("api_key", "<?= KEY ?>");
                    $.ajax({
                        data: data,
                        type: "POST",
                        url: "<?= $homeurl ?>/tools/upload.php",
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function(url) {
                            var a = JSON.parse(url);
                            if (a.status != 'error') {
                                toastr.success(a.message);
                                $('#txtjawaban').summernote('insertImage', a.data);
                            } else {
                                toastr.error(a.message);
                            }
                        }
                    });
                }
            }
        });
    });
</script>
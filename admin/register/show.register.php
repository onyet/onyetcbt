<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');
?>
<?php if ($ac == '') : ?>
	<div class='row'>
		<div class='col-md-12'>
			<div class='box box-solid'>
				<div class='box-header with-border '>
					<h3 class='box-title'><i class="fas fa-user-friends fa-fw"></i> Peserta Mendaftar Mandiri</h3>
				</div><!-- /.box-header -->
				<div class='box-body'>
					<div class='table-responsive'>
						<table style="font-size: 11px" id='tabelsiswa' class='table table-bordered table-striped'>
							<thead>
								<tr>
									<th width='3px'></th>
									<th>NIS</th>
									<th>Nama</th>
									<th>Kelas</th>
									<th>Tempat Lahir</th>
									<th>Tanggal Lahir</th>
									<th>Jenis Kelamin</th>
									<th>Agama</th>
									<th>Nama Ayah</th>
                                    <th>Nama Ibu</th>
                                    <th>No HP</th>
                                    <th>Tahun Masuk</th>
									<?php if ($pengawas['level'] == 'admin') : ?>
                                        <th width='70px'></th>
									<?php endif ?>
								</tr>
							</thead>
						</table>
					</div>
				</div><!-- /.box-body -->
			</div><!-- /.box -->
		</div>
	</div>
<?php elseif ($ac == 'hapus') : ?>
	<?php
	if (isset($_GET['id'])) {
		$id = $_GET['id'];
		$exec = mysqli_query($koneksi, "DELETE FROM registrasi_siswa WHERE id=". $id);
		jump("?pg=$pg");
	}
    ?>
<?php elseif ($ac == 'konfirmasi') : ?>
    <?php
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $exec = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM registrasi_siswa LEFT JOIN kelas ON registrasi_siswa.id_kelas = kelas.id_kelas WHERE registrasi_siswa.id=". $id));

        if (count($exec) > 0) {

            $idpk = 'NULL';

            if ($setting['jenjang'] == "SMK") {
                if (substr($exec['id_kelas'], -2, 1) == 'N') {
                    $idpk = "'NAUTIKA'";
                }
                if (substr($exec['id_kelas'], -2, 1) == 'T') {
                    $idpk = "'TEKNIKA'";
                }
            }

            $exec = mysqli_query($koneksi,"INSERT INTO siswa(id_kelas,nis,no_peserta,nama,level,username,password,jenis_kelamin,tempat_lahir,tanggal_lahir,agama,alamat,hp,nama_ayah,nama_ibu,angkatan,idpk) VALUES('". $exec['id_kelas'] ."','". $exec['nis'] ."','". $exec['nis'] ."','". $exec['nama_lengkap'] ."','". $exec['level'] ."','". $exec['username_login'] ."','". $exec['password_login'] ."','". $exec['jenis_kelamin'] ."','". $exec['tempat_lahir'] ."','". $exec['tgl_lahir'] ."','". $exec['agama'] ."','". $exec['alamat'] ."','". $exec['no_hp'] ."','". $exec['nama_ayah'] ."','". $exec['nama_ibu'] ."',". $exec['th_masuk'] .",". $idpk .")");
            if ($exec) {
                $exec = mysqli_query($koneksi, "DELETE FROM registrasi_siswa WHERE id=". $id);
            }
        }

        jump("?pg=$pg");
    }
    ?>
<?php endif ?>

<script>
	$(document).ready(function() {
		var t = $('#tabelsiswa').DataTable({
			'ajax': 'register/data.register.php',
			'order': [
				[1, 'asc']
			],
			'columns': [{
					'data': null,
					'width': '10px',
					'sClass': 'text-center'
				},
				{
					'data': 'nis'
				},
				{
					'data': 'nama_lengkap'
				},
				{
					'data': 'id_kelas'
				},
				{
					'data': 'tempat_lahir'
				},
				{
					'data': 'tgl_lahir'
				},
				{
					'data': 'jenis_kelamin'
				},
				{
					'data': 'agama'
				},
				{
					'data': 'nama_ayah'
				},
				{
					'data': 'nama_ibu'
				},
				{
					'data': 'no_hp'
				},
				{
					'data': 'th_masuk'
				},
                <?php if ($pengawas['level'] == 'admin') { ?> {
                        'data': 'id',
                        'width': '60px',
                        'sClass': 'text-left',
                        'orderable': false,
                        'mRender': function(data) {
                            return '<a class="btn btn-flat btn-xs bg-blue" href="?pg=registrasi&ac=konfirmasi&id=' + data + '" onclick="javascript:return confirm(\'Anda yakin akan mengkonfirmasi data ini ?\');"><i class="fas fa-check"></i> Konfirmasi</a>\n\
                            <a class="btn btn-flat btn-xs bg-maroon" href="?pg=registrasi&ac=hapus&id=' + data + '" onclick="javascript:return confirm(\'Anda yakin akan menghapus data ini?\');"><i class="fa fa-trash"></i> Hapus</a>';
                        }
                    }
				<?php } ?>
			]
		});
		t.on('order.dt search.dt', function() {
			t.column(0, {
				search: 'applied',
				order: 'applied'
			}).nodes().each(function(cell, i) {
				cell.innerHTML = i + 1;
			});
		}).draw();
	});
</script>
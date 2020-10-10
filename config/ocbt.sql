-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `agama`;
CREATE TABLE `agama` (
  `agamaku` varchar(25) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `agama`;
INSERT INTO `agama` (`agamaku`) VALUES
('Islam'),
('Kristen Katolik'),
('Kristen Protestan'),
('Hindu'),
('Budha'),
('Konghucu');

DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita` (
  `id_berita` int NOT NULL AUTO_INCREMENT,
  `id_mapel` int NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text,
  `tgl_ujian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_berita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `berita`;

DROP TABLE IF EXISTS `file_pendukung`;
CREATE TABLE `file_pendukung` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `id_mapel` int DEFAULT '0',
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jawaban`;
CREATE TABLE `jawaban` (
  `id_jawaban` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `id_mapel` int NOT NULL,
  `id_soal` int NOT NULL,
  `id_ujian` int NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int NOT NULL,
  `esai` text,
  `nilai_esai` int NOT NULL DEFAULT '0',
  `ragu` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jawaban`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `jawaban_tugas`;
CREATE TABLE `jawaban_tugas` (
  `id_jawaban` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int DEFAULT NULL,
  `id_tugas` int DEFAULT NULL,
  `jawaban` longtext,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nilai` varchar(5) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_jawaban`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jenis`;
CREATE TABLE `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `jenis`;
INSERT INTO `jenis` (`id_jenis`, `nama`, `status`) VALUES
('PAS',	'Penilaian Akhir Semester',	'tidak'),
('PAT',	'Penilaian Akhir Tahun',	'tidak'),
('PTS',	'Penilaian Tengah Semester',	'aktif'),
('ULH',	'ULANGAN HARIAN',	'tidak'),
('USBK',	'Ujian Sekolah',	'tidak');

DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `jurusan`;

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `kelas`;
INSERT INTO `kelas` (`id_kelas`, `level`, `nama`, `rombongan_belajar_id`, `semester_id`) VALUES
('X NA',	'X',	'X NA',	NULL,	NULL),
('X NB',	'X',	'X NB',	NULL,	NULL),
('X TA',	'X',	'X TA',	NULL,	NULL),
('X TB',	'X',	'X TB',	NULL,	NULL),
('XI NA',	'XI',	'XI NA',	NULL,	NULL),
('XI NB',	'XI ',	'XI NB',	NULL,	NULL),
('XI NC',	'XI',	'XI NC',	NULL,	NULL),
('XI TA',	'XI',	'XI TA',	NULL,	NULL),
('XI TB',	'XI',	'XI TB',	NULL,	NULL),
('XI TC',	'XI',	'XI TC',	NULL,	NULL),
('XII NA',	'XII',	'XII NA',	NULL,	NULL),
('XII NB',	'XII',	'XII NB',	NULL,	NULL),
('XII NC',	'XII',	'XII NC',	NULL,	NULL),
('XII ND',	'XII',	'XII ND',	NULL,	NULL),
('XII TA',	'XII',	'XII TA',	NULL,	NULL),
('XII TB',	'XII',	'XII TB',	NULL,	NULL),
('XII TC',	'XII',	'XII TC',	NULL,	NULL);

DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `level`;
INSERT INTO `level` (`kode_level`, `keterangan`, `rombongan_belajar_id`) VALUES
('EX',	'ALUMNI',	NULL),
('X',	'Kelas X',	NULL),
('XI',	'Kelas XI',	NULL),
('XII',	'Kelas XII',	NULL);

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=1760 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `mapel`;
CREATE TABLE `mapel` (
  `id_mapel` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int NOT NULL,
  `jml_esai` int NOT NULL DEFAULT '0',
  `tampil_pg` int NOT NULL,
  `tampil_esai` int NOT NULL DEFAULT '0',
  `bobot_pg` int NOT NULL,
  `bobot_esai` int NOT NULL DEFAULT '0',
  `level` varchar(5) NOT NULL,
  `opsi` int NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) NOT NULL,
  `kkm` int DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(150) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kode_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `mata_pelajaran`;
INSERT INTO `mata_pelajaran` (`kode_mapel`, `nama_mapel`, `mata_pelajaran_id`) VALUES
('BIND',	'BAHASA INDONESIA',	NULL),
('BING',	'BAHASA INGGRIS',	NULL),
('BINGMAR',	'BAHASA INGGRIS MARITIM',	NULL),
('BJAWA',	'BAHASA JAWA',	NULL),
('BKKP',	'BUDAYA KESELAMATAN, KEAMANAN DAN PELAYANAN',	NULL),
('DJM',	'DINAS JAGA MESIN',	NULL),
('ELK',	'ELEKTRONIKA',	NULL),
('FISIKA',	'FISIKA',	NULL),
('GMS',	'GAMBAR MESIN',	NULL),
('HMAR',	'HUKUM MARITIM',	NULL),
('ILB',	'ILMU BAHAN',	NULL),
('IPAD',	'ILMU PELAYARAN DATAR',	NULL),
('IPAS',	'ILMU PELAYARAN ASTRONOMI',	NULL),
('IVK',	'ISYARAT VISUAL KAPAL',	NULL),
('KBH',	'KECAKAPAN BAHARI',	NULL),
('KEKK',	'KEPEMIMPINAN, ETOS KERJA DAN KETERAMPILAN KERJA SAMA',	NULL),
('KIMIA',	'KIMIA',	NULL),
('KIS',	'KOMUNIKASI DAN ISYARAT',	NULL),
('KLPP',	'KEPEDULIAN LINGKUNGAN DAN PENCEGAHAN PENCEMARAN',	NULL),
('KSBK',	'KONSTRUKSI DAN STABILITAS BANGUNAN KAPAL',	NULL),
('KSK',	'KONSTRUKSI DAN STABILITAS KAPAL',	NULL),
('MEK',	'MEKANIKA',	NULL),
('MPU',	'MESIN PENGGERAK UTAMA',	NULL),
('MTG',	'METEOROLOGI',	NULL),
('MTK',	'MATEMATIKA',	NULL),
('NELK',	'NAVIGASI ELEKTRONIK',	NULL),
('OGPK',	'OGPK',	NULL),
('PAI',	'PENDIDIKAN AGAMA ISLAM',	NULL),
('PAK',	'PENDIDIKAN AGAMA KRISTEN',	NULL),
('PDS',	'PROSEDUR DARURAT DAN SAR',	NULL),
('PJOK',	'PENDIDIKAN JASMANI DAN OLAH RAGA',	NULL),
('PKK',	'PKK',	NULL),
('PKN',	'PENDIDIKAN KEWARGANEGARAAN',	NULL),
('PLK',	'PERLENGKAPAN KAPAL',	NULL),
('PMB',	'PERMESINAN BANTU',	NULL),
('PMK',	'PERMESINAN KAPAL',	NULL),
('PPK',	'PERAWATAN DAN PERAWATAN KAPAL',	NULL),
('PPKMB',	'PPKM BERTENAGA',	NULL),
('PPM',	'PENGATURAN PENANGANAN MUATAN',	NULL),
('PPP',	'PP PERMESINAN',	NULL),
('PPTL',	'PPTL DAN DINAS JAGA',	NULL),
('SBD',	'SENI BUDAYA',	NULL),
('SEJINDO',	'SEJARAH BAHASA INDONESIA',	NULL),
('SIMD',	'SIMULASI DAN KOMUNIKASI DIGITAL',	NULL),
('Simulasi',	'Simulasi',	NULL),
('SKK',	'SISTEM KELISTRIKAN KAPAL',	NULL),
('SKM',	'SISTEM KOMPAS KEMUDI',	NULL),
('SP3',	'SISTEM PENGOPRASIAN, PERAWATAN DAN PERBAIKAN',	NULL),
('SYKON',	'SISTEM KONTROL',	NULL),
('THE',	'THERMODINAMIKA',	NULL),
('TIK',	'TEKNOLOGI DAN INFORMASI KOMPUTER',	NULL),
('UUPKI',	'UUP & KI',	NULL);

DROP TABLE IF EXISTS `materi`;
CREATE TABLE `materi` (
  `id_materi` int NOT NULL AUTO_INCREMENT,
  `id_guru` int NOT NULL DEFAULT '0',
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_materi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `materi`;

DROP TABLE IF EXISTS `materi_komentar`;
CREATE TABLE `materi_komentar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_materi` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `komentar` text,
  `level` varchar(20) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `materi_komentar`;

DROP TABLE IF EXISTS `meet`;
CREATE TABLE `meet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_guru` int DEFAULT NULL,
  `id_mapel` varchar(50) DEFAULT NULL,
  `id_kelas` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `judul` varchar(110) DEFAULT NULL,
  `deskripsi` varchar(250) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

TRUNCATE `meet`;

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE `nilai` (
  `id_nilai` int NOT NULL AUTO_INCREMENT,
  `id_ujian` int NOT NULL,
  `id_mapel` int NOT NULL,
  `id_siswa` int NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int DEFAULT NULL,
  `jml_salah` int DEFAULT NULL,
  `nilai_esai` double DEFAULT NULL,
  `skor` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int NOT NULL,
  `jawaban` text,
  `jawaban_esai` longtext,
  `nilai_esai2` text,
  `online` int NOT NULL DEFAULT '0',
  `id_soal` longtext,
  `id_opsi` longtext,
  `id_esai` text,
  `blok` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nilai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `pengawas`;
CREATE TABLE `pengawas` (
  `id_pengawas` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text,
  `ruang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pengawas`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

TRUNCATE `pengawas`;
INSERT INTO `pengawas` (`id_pengawas`, `nip`, `nama`, `jabatan`, `username`, `password`, `level`, `no_ktp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_hp`, `email`, `alamat_jalan`, `rt_rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `nuptk`, `bidang_studi`, `jenis_ptk`, `tgs_tambahan`, `status_pegawai`, `status_aktif`, `status_nikah`, `sumber_gaji`, `ahli_lab`, `nama_ibu`, `nama_suami`, `nik_suami`, `pekerjaan`, `tmt`, `keahlian_isyarat`, `kewarganegaraan`, `npwp`, `foto`, `ptk_id`, `password2`, `ruang`) VALUES
(1,	'-',	'administrator',	'',	'admin',	'$2y$10$2UroxlVBt0lGC6y96A9bgOsyqpY5uATosqq0lgo.5mv9.rEwlw.CK',	'admin',	'',	'',	'0000-00-00',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'0000-00-00',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(261,	'19870520.01.092',	'Gia Budi Satwanto, SH.SE.MH.',	NULL,	'guru3',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(262,	'19520302.01.038',	'Drs. M. Junaedi',	NULL,	'guru4',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(263,	'1',	'Drs. Edi Wahyono, M.Si.',	NULL,	'guru1',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(264,	'19640417.01.008',	'Dra. Surtinah',	NULL,	'guru2',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(265,	'19520628.01.086',	'Franciscus Mardiyanto - ANT III, SE',	NULL,	'frans',	'123456',	'guru',	NULL,	'',	'2020-09-24',	'',	'',	'081381239752',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'19520628.01.086.jpg',	NULL,	NULL,	NULL),
(266,	'19790714.01.029',	'Eko Yuli Rusmanto',	NULL,	'transzaq',	'010407',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(267,	'',	'Diana Agus Prihantoro',	NULL,	'dian',	'didin99',	'guru',	NULL,	'Wonosobo',	'1981-08-31',	'Laki-Laki',	'Islam',	'085709916585',	NULL,	'Gataksari RT.02 RW.02 Serang, Kejajar, Wonosobo 56354',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(268,	'19700309.01.034',	'Nasrulloh,S.Ag.',	NULL,	'guru5',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(269,	'19660705.01.010',	'Dra. Sukaisi',	NULL,	'Sukaisi',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(270,	'19741116.01.012',	'Christian.WA, SE.M.Si.',	NULL,	'Christian',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(271,	'8',	'Yusak Zifri, S.Th',	NULL,	'guru8',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(272,	'19620612.01.045',	'Drs. Harso Hadiatmo',	NULL,	'guru9',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(273,	'10',	'Ninik Setyani, S.Sos.M.Si.',	NULL,	'guru10',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(274,	'19760405.01.052',	'Diding Chaerudin,SE.',	NULL,	'Diding',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(275,	'19801202.01.030',	'Ika Dessy Susanti, SE',	NULL,	'dessy',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(276,	'19810831.01.059',	'Diana Agus Prihantoro, S.E',	NULL,	'dianaagusprihantoro',	'123456',	'guru',	NULL,	'Wonosobo',	'1981-08-31',	'Laki-Laki',	'Islam',	'085709916585',	NULL,	'Karangrau Rt.02 / Rw.02 Sokaraja, Banyumas',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'19810831.01.059.jpg',	NULL,	NULL,	NULL),
(277,	'19680611.01.037',	'Drs. Mundirin, M.Si.',	NULL,	'guru14',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(278,	'19650210.01.094',	'Makmuri, S.Pd.',	NULL,	'guru15',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(279,	'19630519.01.006',	'Bomantari Tri Asih,SE.',	NULL,	'Bomantari',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(280,	'19630303.01.004',	'Drs. Marcus.ES',	NULL,	'guru17',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(281,	'19700713.01.042',	'Retno Wuryansari,S.Pd.',	NULL,	'guru18',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(282,	'19880413.01.079',	'Nanjar Wiwit Mulyani, S.Pd.',	NULL,	'guru19',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(283,	'20',	'Ken Widya Agustina, S.Pd.',	NULL,	'widya_ken',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(284,	'19800423.01.074',	'Rakhmi. Kadraeni, S.Pd.',	NULL,	'rakhmi',	'123456',	'guru',	NULL,	'Purwokerto',	'2020-09-21',	'Perempuan',	'Islam',	'085747572565',	NULL,	'Perum Ketapang Indah Blok C.4 no 57',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(285,	'19780314.01.068',	'Rasikin, S.Pd.',	NULL,	'rasikin',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(286,	'19720405.01.026',	'Tati Purwati,ANT-III, S.Pd.M.Si.',	NULL,	'Tati',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(287,	'19860122.01.58',	'Riyani, S.Pd.Si',	NULL,	'guru25',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(288,	'26',	'Sri Wahyuningsih,SH.',	NULL,	'Wahyuningsih',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(289,	'19680628.01.003',	'Antonius Nahyanto, S.Pd.',	NULL,	'Antonius',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(290,	'19920408.01.096',	'Ema Puji Endarwati, S.Pd., Gr,',	NULL,	'emapujiendarwati',	'123456',	'guru',	NULL,	'Cilacap',	'2020-04-08',	'Perempuan',	'Islam',	'081353689910',	NULL,	'Cilacap',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'19920408.01.096.jpg',	NULL,	NULL,	NULL),
(291,	'62',	'Farda Fitriyanti',	NULL,	'onyet',	'123456',	'guru',	NULL,	'Purwokerto ',	'1996-02-24',	'Perempuan',	'Islam',	'082221874500',	NULL,	'Jl. Jend. Suprapto, Gg. 2, RT.03/RW.08, Kauman Lam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(292,	'31',	'Tati Purwati, S.Pd. M.Si.',	NULL,	'tati',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(293,	'19760510.01.069',	'Slamet Subagyo, S.E., ANT-III',	NULL,	'slametsubagyo',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(294,	'33',	'Drajat Sudarmanto',	NULL,	'guru33',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(295,	'34',	'Andy Wulanegara, SH.',	NULL,	'guru34',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(296,	'35',	'Satria Adi Krisna, ANT II, SE.',	NULL,	'guru35',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(297,	'19701015.01.87',	'Slamet Riyanto, SE',	NULL,	'guru36',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(298,	'37',	'Sri Hidayati',	NULL,	'guru37',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(299,	'19670802.01.092',	'Capt. Asmadi, M. Mar.',	NULL,	'Asmadi',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(300,	'39',	'Wahyu Utomo',	NULL,	'guru39',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(301,	'40',	'Sumidi',	NULL,	'guru40',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(302,	'41',	'Andi Suwaryanto, SH.',	NULL,	'guru41',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(303,	'42',	'Dwi Muhammad Nurdin, SE.',	NULL,	'guru42',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(304,	'19720515.01.025',	'M. Abdullah Al Amin,SE.',	NULL,	'guru43',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(305,	'19550629.01.085',	'H. Tri Priambodo, SE.',	NULL,	'guru44',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(306,	'45',	'Rudi Wahyudi',	NULL,	'guru45',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(307,	'46',	'Didik Sutanto,ST.',	NULL,	'guru46',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(308,	'47',	'R.Toni Kusbarno',	NULL,	'guru47',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(309,	'48',	'M. Nurhidayat, SE.',	NULL,	'Nurhidayat',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(310,	'19710116.01.061',	'Ndaru Listiono, SE.',	NULL,	'guru49',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(311,	'50',	'Pambiko Sumarno Putro',	NULL,	'guru50',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(312,	'51',	'Sugianto. SE.',	NULL,	'Sugianto',	'123456',	'guru',	NULL,	NULL,	NULL,	'Laki-Laki',	NULL,	'',	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(313,	'19821225.01.097',	'Iwan Kurniawan',	NULL,	'guru52',	'123456',	'guru',	NULL,	'Banyumas',	'1982-12-25',	'Laki-Laki',	'Islam',	'085870097009',	NULL,	'Jl. Pasiraja 43 Bantarsoka Purwokerto Barat',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'19821225.01.097.jpeg',	NULL,	NULL,	NULL),
(314,	'53',	'Tjatur Priyadi',	NULL,	'guru53',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(315,	'19530428.01.095',	'R. Herry Purnomo, ATT. I, M.Eng',	NULL,	'guru54',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(316,	'55',	'Hj. Supinah.SE',	NULL,	'guru55',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(317,	'56',	'Rachman',	NULL,	'guru56',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(318,	'57',	'Didi Sutardi',	NULL,	'guru57',	'123456',	'guru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(319,	'19710707.01.084',	'M. Fuad Bunyamin, SE.M.Si.',	NULL,	'Fuad',	'123456',	'guru',	NULL,	'Banyumas',	'1971-07-07',	'Laki-Laki',	'Islam',	'081327538561',	NULL,	'Jalan Kenanga No.126 Grendeng Purwokerto',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'19710707.01.084.jpg',	NULL,	NULL,	NULL),
(320,	'-',	'proktor2',	NULL,	'proktor2',	'$2y$10$nCeIh.rKxdgxz7RrI46yROc7SRvSxxG7duoWFVpjvldo5.cFg12Eq',	'proktor',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'R2'),
(321,	'-',	'proktor1',	NULL,	'proktor1',	'$2y$10$i/K10LRIhaco5JNj8r0cCej3lT83ed6rUN2Ll3jNrIZ656W6XY1Uy',	'proktor',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'R1'),
(322,	'-',	'pengawas1',	NULL,	'pengawas1',	'$2y$10$R2r2qSJmgdrkf0nouAWhMe1Bn38g417ZPibjQeoHeBU0Ur8XG5s6q',	'pengawas',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'R1'),
(323,	'-',	'Aulia Nisa',	NULL,	'icha',	'$2y$10$qUSCS.Qj7bgEWdZFa0o1NugJAgEpJo9Z5rNnuVjz4bhC72f0Knr6W',	'admin',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(324,	'-',	'proktor3',	NULL,	'proktor3',	'$2y$10$dpXLoULxrB/p3A.FmpRPneywOi5CMifZnKWhwx8doqwaZWDPLiYwO',	'proktor',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'R3'),
(325,	'-',	'pengawas2',	NULL,	'pengawas2',	'$2y$10$yYcjVhtOMHLeI6aioAMmwO5nHiNlCD13IZKqozXOqhU.w68oWhuLO',	'pengawas',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'R2'),
(326,	'-',	'pengawas3',	NULL,	'pengawas3',	'$2y$10$VbEbLjmuC.1Xv0en9/tG4.uF5GUXJZR5A7McOYqt0wGFcoFOcwNJy',	'pengawas',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'R3'),
(327,	'-',	'ken',	NULL,	'keshiro',	'$2y$10$LFzAw60DEMMNkST4Ek.qMeojtsU3DCXa/ho1bzTnfZ6z42MgLiAv6',	'admin',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `pengumuman`;
CREATE TABLE `pengumuman` (
  `id_pengumuman` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pengumuman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `pengumuman`;

DROP TABLE IF EXISTS `pk`;
CREATE TABLE `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `pk`;
INSERT INTO `pk` (`id_pk`, `program_keahlian`, `jurusan_id`) VALUES
('NAUTIKA',	'NAUTIKA KAPAL NIAGA',	NULL),
('semua',	'semua',	NULL),
('TEKNIKA',	'TEKNIKA KAPAL NIAGA',	NULL);

DROP TABLE IF EXISTS `referensi_jurusan`;
CREATE TABLE `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int NOT NULL,
  `untuk_smk` int NOT NULL,
  `jenjang_pendidikan_id` int DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `referensi_jurusan`;

DROP TABLE IF EXISTS `registrasi_siswa`;
CREATE TABLE `registrasi_siswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nis` varchar(30) DEFAULT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `th_masuk` int DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `username_login` varchar(50) DEFAULT NULL,
  `password_login` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registrasi_nis_siswa` (`nis`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ruang`;
CREATE TABLE `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `ruang`;
INSERT INTO `ruang` (`kode_ruang`, `keterangan`) VALUES
('R1',	'ROOM DARING 1'),
('R2',	'ROOM DARING 2'),
('R3',	'ROOM DARING 3');

DROP TABLE IF EXISTS `savsoft_options`;
CREATE TABLE `savsoft_options` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `qid` int NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `savsoft_options`;

DROP TABLE IF EXISTS `savsoft_qbank`;
CREATE TABLE `savsoft_qbank` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int NOT NULL,
  `lid` int NOT NULL,
  `no_time_served` int NOT NULL DEFAULT '0',
  `no_time_corrected` int NOT NULL DEFAULT '0',
  `no_time_incorrected` int NOT NULL DEFAULT '0',
  `no_time_unattempted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `savsoft_qbank`;

DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `semester`;

DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `server`;
INSERT INTO `server` (`kode_server`, `nama_server`, `status`) VALUES
('SERVER01',	'ELEARNING SERVER SATU',	'aktif');

DROP TABLE IF EXISTS `sesi`;
CREATE TABLE `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_sesi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `sesi`;
INSERT INTO `sesi` (`kode_sesi`, `nama_sesi`) VALUES
('1',	'Sesi Pagi'),
('2',	'Sesi Siang'),
('3',	'Sesi Sore');

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `session`;

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text,
  `header` text,
  `header_kartu` text,
  `nama_ujian` text,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

TRUNCATE `setting`;
INSERT INTO `setting` (`id_setting`, `aplikasi`, `kode_sekolah`, `sekolah`, `jenjang`, `kepsek`, `nip`, `alamat`, `kecamatan`, `kota`, `telp`, `fax`, `web`, `email`, `logo`, `header`, `header_kartu`, `nama_ujian`, `versi`, `ip_server`, `waktu`, `server`, `id_server`, `url_host`, `token_api`, `sekolah_id`, `npsn`, `db_versi`) VALUES
(1,	'E-LEARNING SPM',	'20302130',	'SMK SPM NASIONAL PURWOKERTO',	'SMK',	'Drs. Edi Wahyono, M.Si.',	'-',	'Jalan Kyai Haji Wachid Hasyim No. 93, Karangklesem, Purwokerto Selatan',	'Purwokerto    ',	'Banyumas',	'0281 631 952',	'-',	'www.spmnasionalpwt.sch.id',	'spmnasionalpwt@gmail.com',	'dist/img/logo87.png',	'',	'KARTU PESERTA',	'Penilaian Tengah Semester',	'3.0',	'139.180.158.157',	'Asia/Jakarta',	'pusat',	'SR01',	'https://apiq.host',	'fqyhJuxulHCA90',	'8cce47df-aae7-4274-83cb-5af3093eab56',	'69787351',	'8.0.21');

DROP TABLE IF EXISTS `sinkron`;
CREATE TABLE `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int DEFAULT NULL,
  PRIMARY KEY (`nama_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` int DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` int DEFAULT '1',
  `online` int DEFAULT '0',
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=latin1;

TRUNCATE `siswa`;
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(1,	'X NA',	'NAUTIKA',	'205749',	'K-03-07-225-001',	'AAN DWI SAPUTRO',	'X',	'R1',	1,	'205749',	'1818',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(2,	'X NA',	'NAUTIKA',	'205750',	'K-03-07-225-002',	'ACHMAD FAHMI AZIZ HABIBIE',	'X',	'R1',	1,	'205750',	'1297',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(3,	'X NA',	'NAUTIKA',	'205751',	'K-03-07-225-003',	'ADIT DWI APRIAN',	'X',	'R1',	1,	'205751',	'1261',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(4,	'X NA',	'NAUTIKA',	'205752',	'K-03-07-225-004',	'AHLAN HIDAYAT',	'X',	'R1',	1,	'205752',	'1921',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(5,	'X NA',	'NAUTIKA',	'205753',	'K-03-07-225-005',	'AKBAR RIZQI SYAWAL ERYO',	'X',	'R1',	1,	'205753',	'1800',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(6,	'X NA',	'NAUTIKA',	'205754',	'K-03-07-225-006',	'ALFIAN YOGI PRAYOGO',	'X',	'R1',	1,	'205754',	'1826',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(7,	'X NA',	'NAUTIKA',	'205755',	'K-03-07-225-007',	'ANGGUN RIHHADATUL AISY PUTRI AZIZAH',	'X',	'R1',	1,	'205755',	'1914',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(8,	'X NA',	'NAUTIKA',	'205756',	'K-03-07-225-008',	'APRILIANA PUTRI RAHAYU',	'X',	'R1',	1,	'205756',	'1677',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(9,	'X NA',	'NAUTIKA',	'205757',	'K-03-07-225-009',	'ARINDA LUTFI RAMADHANING FADILA ',	'X',	'R1',	1,	'205757',	'1023',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(10,	'X NA',	'NAUTIKA',	'205758',	'K-03-07-225-010',	'ARUM MULYANINGTYAS ',	'X',	'R1',	1,	'205758',	'1095',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(11,	'X NA',	'NAUTIKA',	'205759',	'K-03-07-225-011',	'DELA HARTANTI',	'X',	'R1',	1,	'205759',	'1694',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(12,	'X NA',	'NAUTIKA',	'205760',	'K-03-07-225-012',	'DIANA OKTA AFISA ROSADI',	'X',	'R1',	1,	'205760',	'1741',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(13,	'X NA',	'NAUTIKA',	'205761',	'K-03-07-225-013',	'DWI SATRIO',	'X',	'R1',	1,	'205761',	'1922',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(14,	'X NA',	'NAUTIKA',	'205762',	'K-03-07-225-014',	'ERLANGGA MUSTOFA',	'X',	'R1',	1,	'205762',	'1411',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(15,	'X NA',	'NAUTIKA',	'205763',	'K-03-07-225-015',	'FIGUR BUDI PRANATA',	'X',	'R1',	1,	'205763',	'1272',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(16,	'X NA',	'NAUTIKA',	'205764',	'K-03-07-225-016',	'GALIH RESTU ARDI NUGROHO',	'X',	'R1',	1,	'205764',	'1144',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(17,	'X NA',	'NAUTIKA',	'205765',	'K-03-07-225-017',	'GUMILANG NAVA DIATI SANTOSA',	'X',	'R1',	1,	'205765',	'1038',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(18,	'X NA',	'NAUTIKA',	'205766',	'K-03-07-225-018',	'ILYAS MULYANA BAHTIAR',	'X',	'R1',	1,	'205766',	'1637',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(19,	'X NA',	'NAUTIKA',	'205767',	'K-03-07-225-019',	'INDRA KURNIAWAN ',	'X',	'R1',	1,	'205767',	'1142',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(20,	'X NA',	'NAUTIKA',	'205768',	'K-03-07-225-020',	'KRISNA PRIAMBUDI',	'X',	'R1',	1,	'205768',	'1792',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(21,	'X NA',	'NAUTIKA',	'205769',	'K-03-07-225-021',	'LINTANG NUGROHO',	'X',	'R1',	1,	'205769',	'1197',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(22,	'X NA',	'NAUTIKA',	'205770',	'K-03-07-225-022',	'MALIK DINAR',	'X',	'R1',	1,	'205770',	'1924',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(23,	'X NA',	'NAUTIKA',	'205771',	'K-03-07-225-023',	'MUHAMAD BAGUS HIDHAYATULLAH',	'X',	'R1',	1,	'205771',	'1445',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(24,	'X NA',	'NAUTIKA',	'205772',	'K-03-07-225-024',	'NANANG RIYANTO ',	'X',	'R1',	1,	'205772',	'1714',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(25,	'X NA',	'NAUTIKA',	'205773',	'K-03-07-225-025',	'NASYWA ALHAFIZH',	'X',	'R1',	1,	'205773',	'1863',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(26,	'X NA',	'NAUTIKA',	'205774',	'K-03-07-225-026',	'RENDI BAGAS ZAKARIA ',	'X',	'R1',	1,	'205774',	'1361',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(27,	'X NA',	'NAUTIKA',	'205775',	'K-03-07-225-027',	'RESKY NUR BAETI ',	'X',	'R1',	1,	'205775',	'1491',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(28,	'X NA',	'NAUTIKA',	'205776',	'K-03-07-225-028',	'RESZA KURNIAWAN',	'X',	'R1',	1,	'205776',	'1572',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(29,	'X NA',	'NAUTIKA',	'205777',	'K-03-07-225-029',	'SISILIA KURNIANA',	'X',	'R1',	1,	'205777',	'1812',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(30,	'X NA',	'NAUTIKA',	'205778',	'K-03-07-225-030',	'SURYA NANDA MIRANTO',	'X',	'R1',	1,	'205778',	'1148',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(31,	'X NA',	'NAUTIKA',	'205779',	'K-03-07-225-031',	'TIO BUDI PAMUNGKAS',	'X',	'R1',	1,	'205779',	'1076',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(32,	'X NA',	'NAUTIKA',	'205780',	'K-03-07-225-032',	'YOGI BARET PRAYOGA',	'X',	'R1',	1,	'205780',	'1030',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(33,	'X NA',	'NAUTIKA',	'205781',	'K-03-07-225-033',	'YUGA MUNGGAHAN OKTAFIAN',	'X',	'R1',	1,	'205781',	'1184',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(34,	'X NB',	'NAUTIKA',	'205782',	'K-03-07-225-034',	'ADELIA KHARISMA NINGTIAS ',	'X',	'R1',	1,	'205782',	'1056',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(35,	'X NB',	'NAUTIKA',	'205783',	'K-03-07-225-035',	'AISAH LIS ANGGRAENI',	'X',	'R1',	1,	'205783',	'1798',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(36,	'X NB',	'NAUTIKA',	'205784',	'K-03-07-225-036',	'ALI AMAR',	'X',	'R1',	1,	'205784',	'1688',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(37,	'X NB',	'NAUTIKA',	'205785',	'K-03-07-225-037',	'ANANDA YAHYA HARI WIBOWO',	'X',	'R1',	1,	'205785',	'1982',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(38,	'X NB',	'NAUTIKA',	'205786',	'K-03-07-225-038',	'ANDRIAN DIAZ TRI NUGROHO',	'X',	'R1',	1,	'205786',	'1673',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(39,	'X NB',	'NAUTIKA',	'205787',	'K-03-07-225-039',	'ANGGITA KUSUMAWATI',	'X',	'R1',	1,	'205787',	'1490',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(40,	'X NB',	'NAUTIKA',	'205788',	'K-03-07-225-040',	'ARIS MUSTOFA TAMIM',	'X',	'R1',	1,	'205788',	'1691',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(41,	'X NB',	'NAUTIKA',	'205789',	'K-03-07-225-041',	'ATHA GHANIM AGRI MAJID',	'X',	'R1',	1,	'205789',	'1938',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(42,	'X NB',	'NAUTIKA',	'205790',	'K-03-07-225-042',	'DEVA YULIS ARDHANI',	'X',	'R1',	1,	'205790',	'1469',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(43,	'X NB',	'NAUTIKA',	'205791',	'K-03-07-225-043',	'DYAH AYU SUBEKTI ',	'X',	'R1',	1,	'205791',	'1396',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(44,	'X NB',	'NAUTIKA',	'205792',	'K-03-07-225-044',	'ERWIN ZAKARYA',	'X',	'R1',	1,	'205792',	'1410',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(45,	'X NB',	'NAUTIKA',	'205793',	'K-03-07-225-045',	'FAIZAH MULTIA',	'X',	'R1',	1,	'205793',	'1309',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(46,	'X NB',	'NAUTIKA',	'205794',	'K-03-07-225-046',	'FRESHA RAIHANDIKA FIRMANSYAH',	'X',	'R1',	1,	'205794',	'1071',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(47,	'X NB',	'NAUTIKA',	'205795',	'K-03-07-225-047',	'GESTY PANDU DANAN DOYO',	'X',	'R1',	1,	'205795',	'1990',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(48,	'X NB',	'NAUTIKA',	'205796',	'K-03-07-225-048',	'IRVAN SUGENG PRANOTO',	'X',	'R1',	1,	'205796',	'1181',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(49,	'X NB',	'NAUTIKA',	'205797',	'K-03-07-225-049',	'ISDHINAR PRATAMA',	'X',	'R1',	1,	'205797',	'1685',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(50,	'X NB',	'NAUTIKA',	'205798',	'K-03-07-225-050',	'KHAIRUNNISA AMARA I.H',	'X',	'R1',	1,	'205798',	'1179',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(51,	'X NB',	'NAUTIKA',	'205799',	'K-03-07-225-051',	'KRISNA TRI SUBASTIAR',	'X',	'R1',	1,	'205799',	'1807',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(52,	'X NB',	'NAUTIKA',	'205800',	'K-03-07-225-052',	'MARZA FAZA FALANSA WIBOWO',	'X',	'R1',	1,	'205800',	'1643',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(53,	'X NB',	'NAUTIKA',	'205801',	'K-03-07-225-053',	'MOCHAMAD ILHAM SRIHADI',	'X',	'R1',	1,	'205801',	'1928',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(54,	'X NB',	'NAUTIKA',	'205802',	'K-03-07-225-054',	'MOHAMAD ABIYU NOFAL RAMADAN',	'X',	'R1',	1,	'205802',	'1978',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(55,	'X NB',	'NAUTIKA',	'205803',	'K-03-07-225-055',	'MUHAMAD FIRDA DWIAN ANWARIS',	'X',	'R1',	1,	'205803',	'1481',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(56,	'X NB',	'NAUTIKA',	'205804',	'K-03-07-225-056',	'NAOMI NATASHA JOSHE PUTRI',	'X',	'R1',	1,	'205804',	'1886',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(57,	'X NB',	'NAUTIKA',	'205805',	'K-03-07-225-057',	'NOKI PUTRAYAZA',	'X',	'R1',	1,	'205805',	'1788',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(58,	'X NB',	'NAUTIKA',	'205806',	'K-03-07-225-058',	'RAFLI SAPUTRA',	'X',	'R1',	1,	'205806',	'1919',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(59,	'X NB',	'NAUTIKA',	'205807',	'K-03-07-225-059',	'REVANDA BAGUS HENDRASYAH',	'X',	'R1',	1,	'205807',	'1434',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(60,	'X NB',	'NAUTIKA',	'205808',	'K-03-07-225-060',	'RICO PUTRA BRITAMA',	'X',	'R1',	1,	'205808',	'1125',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(61,	'X NB',	'NAUTIKA',	'205809',	'K-03-07-225-061',	'SALWA AYU FADHILAH',	'X',	'R1',	1,	'205809',	'1928',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(62,	'X NB',	'NAUTIKA',	'205810',	'K-03-07-225-062',	'WAFIQ HAMDANI',	'X',	'R1',	1,	'205810',	'1593',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(63,	'X NB',	'NAUTIKA',	'205811',	'K-03-07-225-063',	'WAHYU SAPUTRA',	'X',	'R1',	1,	'205811',	'1279',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(64,	'X NB',	'NAUTIKA',	'205812',	'K-03-07-225-064',	'WIDYADITA SAPUTRI',	'X',	'R1',	1,	'205812',	'1739',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(65,	'X NB',	'NAUTIKA',	'205813',	'K-03-07-225-065',	'ZIDAN AGUSTIAN NUGRAHA',	'X',	'R1',	1,	'205813',	'1360',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(66,	'X NB',	'NAUTIKA',	'205814',	'K-03-07-225-066',	'ZIDAN PRASETYO MUKTI',	'X',	'R1',	1,	'205814',	'1040',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(67,	'X TA',	'TEKNIKA',	'205815',	'K-03-07-225-067',	'AFRIDO FEBRIANSAH',	'X',	'R1',	1,	'205815',	'1276',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(68,	'X TA',	'TEKNIKA',	'205816',	'K-03-07-225-068',	'AGUNG YUSUF SAFUTRA',	'X',	'R1',	1,	'205816',	'1385',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(69,	'X TA',	'TEKNIKA',	'205817',	'K-03-07-225-069',	'AKIRA EGA SYAFAVIAN',	'X',	'R1',	1,	'205817',	'1096',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(70,	'X TA',	'TEKNIKA',	'205818',	'K-03-07-225-070',	'BAGAS FABRIAN FATHURROHMAN',	'X',	'R1',	1,	'205818',	'1999',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(71,	'X TA',	'TEKNIKA',	'205819',	'K-03-07-225-071',	'DARMA SAPUTRA',	'X',	'R1',	1,	'205819',	'1544',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Kristen',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(72,	'X TA',	'TEKNIKA',	'205820',	'K-03-07-225-072',	'DIMAS WIDIYASTAMA',	'X',	'R1',	1,	'205820',	'1984',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(73,	'X TA',	'TEKNIKA',	'205821',	'K-03-07-225-073',	'ERI ZULIANTO',	'X',	'R1',	1,	'205821',	'1873',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(74,	'X TA',	'TEKNIKA',	'205822',	'K-03-07-225-074',	'ERLANGGA BANGKIT VIRGIAWAN',	'X',	'R1',	1,	'205822',	'1707',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(75,	'X TA',	'TEKNIKA',	'205823',	'K-03-07-225-075',	'FADIL MAULANA',	'X',	'R1',	1,	'205823',	'1890',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(76,	'X TA',	'TEKNIKA',	'205824',	'K-03-07-225-076',	'FADILAH KIRANA',	'X',	'R1',	1,	'205824',	'1491',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(77,	'X TA',	'TEKNIKA',	'205825',	'K-03-07-225-077',	'HABIBI KHUSAINI',	'X',	'R1',	1,	'205825',	'1092',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(78,	'X TA',	'TEKNIKA',	'205826',	'K-03-07-225-078',	'HAIDAR ZAKI ANDRIYANTO',	'X',	'R1',	1,	'205826',	'1267',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(79,	'X TA',	'TEKNIKA',	'205827',	'K-03-07-225-079',	'IQBAL RAMADHANI',	'X',	'R1',	1,	'205827',	'1140',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(80,	'X TA',	'TEKNIKA',	'205828',	'K-03-07-225-080',	'IRGI SANDY EFRIAWAN',	'X',	'R1',	1,	'205828',	'1685',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(81,	'X TA',	'TEKNIKA',	'205829',	'K-03-07-225-081',	'JONATHAN PUTRA HANANDA',	'X',	'R1',	1,	'205829',	'1637',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(82,	'X TA',	'TEKNIKA',	'205830',	'K-03-07-225-082',	'LANJAR SAPUTRA',	'X',	'R1',	1,	'205830',	'1503',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(83,	'X TA',	'TEKNIKA',	'205831',	'K-03-07-225-083',	'MOCHAMAD THOMAS TIRTA WARDANA',	'X',	'R1',	1,	'205831',	'1537',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(84,	'X TA',	'TEKNIKA',	'205832',	'K-03-07-225-084',	'MUHAMMAD ABDI CARAKA',	'X',	'R1',	1,	'205832',	'1420',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(85,	'X TA',	'TEKNIKA',	'205833',	'K-03-07-225-085',	'PAGAH BUDI PRASTYO',	'X',	'R1',	1,	'205833',	'1270',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(86,	'X TA',	'TEKNIKA',	'205834',	'K-03-07-225-086',	'PRASETYO ERDI NUGROHO',	'X',	'R1',	1,	'205834',	'1734',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(87,	'X TA',	'TEKNIKA',	'205835',	'K-03-07-225-087',	'RIKO DWI SUSANTO',	'X',	'R1',	1,	'205835',	'1868',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(88,	'X TA',	'TEKNIKA',	'205836',	'K-03-07-225-088',	'RIZKI SAPTONO EFENDI',	'X',	'R1',	1,	'205836',	'1432',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(89,	'X TA',	'TEKNIKA',	'205837',	'K-03-07-225-089',	'SONY ARYANTO',	'X',	'R1',	1,	'205837',	'1882',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Kristen',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(90,	'X TA',	'TEKNIKA',	'205838',	'K-03-07-225-090',	'SYAFIQ ADI IRAWAN',	'X',	'R1',	1,	'205838',	'1860',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(91,	'X TA',	'TEKNIKA',	'205839',	'K-03-07-225-091',	'THOMAS JOHAN SURBAKTI',	'X',	'R1',	1,	'205839',	'1928',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Katholik',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(92,	'X TA',	'TEKNIKA',	'205840',	'K-03-07-225-092',	'TRI AGUNG NOTO NEGORO ',	'X',	'R1',	1,	'205840',	'1000',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(93,	'X TA',	'TEKNIKA',	'205867',	'K-03-07-225-093',	'ADI MUHAMAD IQBALL',	'X',	'R1',	1,	'205867',	'1993',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(94,	'X TB',	'TEKNIKA',	'205841',	'K-03-07-225-094',	'ANDRO MEDHA CAHYA RAMADHAN',	'X',	'R1',	1,	'205841',	'1428',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(95,	'X TB',	'TEKNIKA',	'205842',	'K-03-07-225-095',	'ANGGIT FISMANTORO',	'X',	'R1',	1,	'205842',	'1108',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(96,	'X TB',	'TEKNIKA',	'205843',	'K-03-07-225-096',	'ARYA PRANATHA DIPUTRA',	'X',	'R1',	1,	'205843',	'1327',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(97,	'X TB',	'TEKNIKA',	'205844',	'K-03-07-225-097',	'CHAFIDZ PANGGIH PANGESTU',	'X',	'R1',	1,	'205844',	'1060',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(98,	'X TB',	'TEKNIKA',	'205845',	'K-03-07-225-098',	'DAVID MAHARDENI',	'X',	'R1',	1,	'205845',	'1393',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(99,	'X TB',	'TEKNIKA',	'205846',	'K-03-07-225-099',	'DIMAS NANDA FEBRIANSYAH',	'X',	'R1',	1,	'205846',	'1165',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(100,	'X TB',	'TEKNIKA',	'205847',	'K-03-07-225-100',	'FAJAR DWI ANGGARA',	'X',	'R1',	1,	'205847',	'1560',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(101,	'X TB',	'TEKNIKA',	'205848',	'K-03-07-225-101',	'FAZZLEY MUHAMMAD FERDINAND',	'X',	'R1',	1,	'205848',	'1569',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(102,	'X TB',	'TEKNIKA',	'205849',	'K-03-07-225-102',	'FEMAS PRAMUDITYA',	'X',	'R1',	1,	'205849',	'1266',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(103,	'X TB',	'TEKNIKA',	'205850',	'K-03-07-225-103',	'FIKI ADE SABRIAN',	'X',	'R1',	1,	'205850',	'1305',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(104,	'X TB',	'TEKNIKA',	'205851',	'K-03-07-225-104',	'FIRDAUS BINTANG MAULANA SAPUTRA',	'X',	'R1',	1,	'205851',	'1737',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(105,	'X TB',	'TEKNIKA',	'205852',	'K-03-07-225-105',	'FIRMAN NUR KHOLIS',	'X',	'R1',	1,	'205852',	'1134',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(106,	'X TB',	'TEKNIKA',	'205853',	'K-03-07-225-106',	'HANAFI ARDIANSYAH',	'X',	'R1',	1,	'205853',	'1713',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(107,	'X TB',	'TEKNIKA',	'205854',	'K-03-07-225-107',	'IHSAN ANSHARI',	'X',	'R1',	1,	'205854',	'1165',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(108,	'X TB',	'TEKNIKA',	'205855',	'K-03-07-225-108',	'JHONATAN APRIANTO',	'X',	'R1',	1,	'205855',	'1974',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(109,	'X TB',	'TEKNIKA',	'205856',	'K-03-07-225-109',	'KHRISNA HAPPY KURNIA',	'X',	'R1',	1,	'205856',	'1894',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(110,	'X TB',	'TEKNIKA',	'205857',	'K-03-07-225-110',	'MOCH ZACKY UBAIDILLAH',	'X',	'R1',	1,	'205857',	'1942',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(111,	'X TB',	'TEKNIKA',	'205858',	'K-03-07-225-111',	'MUHAMAD TOFANI',	'X',	'R1',	1,	'205858',	'1849',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(112,	'X TB',	'TEKNIKA',	'205859',	'K-03-07-225-112',	'MUKHAMAD YAHYA KHAERUSOFAN',	'X',	'R1',	1,	'205859',	'1511',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(113,	'X TB',	'TEKNIKA',	'205860',	'K-03-07-225-113',	'PRASETYO NURAHHARTANTO',	'X',	'R1',	1,	'205860',	'1692',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(114,	'X TB',	'TEKNIKA',	'205861',	'K-03-07-225-114',	'RACHEL AZIZ SAPUTRA',	'X',	'R1',	1,	'205861',	'1394',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(115,	'X TB',	'TEKNIKA',	'205862',	'K-03-07-225-115',	'RYAN DWI HARTONO',	'X',	'R1',	1,	'205862',	'1205',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(116,	'X TB',	'TEKNIKA',	'205863',	'K-03-07-225-116',	'SATRIA BAGAS SAPUTRA',	'X',	'R1',	1,	'205863',	'1989',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(117,	'X TB',	'TEKNIKA',	'205864',	'K-03-07-225-117',	'SYAHRI FAQIHATUL MUHAMAD',	'X',	'R1',	1,	'205864',	'1627',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(118,	'X TB',	'TEKNIKA',	'205865',	'K-03-07-225-118',	'TEGAR MAULANA RIZKI ',	'X',	'R1',	1,	'205865',	'1292',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(119,	'X TA',	'TEKNIKA',	'205866',	'K-03-07-225-119',	'ZAYYIN MUBAROK',	'X',	'R1',	1,	'205866',	'1818',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(120,	'X TB',	'TEKNIKA',	'205868',	'K-03-07-225-120',	'ROBBY NUGRAHA',	'X',	'R1',	1,	'205868',	'1010',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(121,	'XI NA',	'NAUTIKA',	'195594',	'K-03-07-225-121',	'ANASTASIA ESCARDITA PUSPITASARI',	'XI',	'R2',	2,	'195594',	'1817',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(122,	'XI NA',	'NAUTIKA',	'195595',	'K-03-07-225-122',	'ANYA MARWA ZAMZAMIL FIRDAUS',	'XI',	'R2',	2,	'195595',	'1715',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(123,	'XI NA',	'NAUTIKA',	'195596',	'K-03-07-225-123',	'ARDI WILDAN SAPUTRA',	'XI',	'R2',	2,	'195596',	'1698',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(124,	'XI NA',	'NAUTIKA',	'195597',	'K-03-07-225-124',	'BISMA SATRIA PRATAMA',	'XI',	'R2',	2,	'195597',	'1974',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(125,	'XI NA',	'NAUTIKA',	'195598',	'K-03-07-225-125',	'DANI ANDRIAN RAMADHAN',	'XI',	'R2',	2,	'195598',	'1025',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(126,	'XI NA',	'NAUTIKA',	'195599',	'K-03-07-225-126',	'DIKA SETIAWAN',	'XI',	'R2',	2,	'195599',	'1439',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(127,	'XI NA',	'NAUTIKA',	'195600',	'K-03-07-225-127',	'DITA PERMATASARI',	'XI',	'R2',	2,	'195600',	'1456',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(128,	'XI NA',	'NAUTIKA',	'195601',	'K-03-07-225-128',	'DIVA SENDI KURIAWAN',	'XI',	'R2',	2,	'195601',	'1463',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(129,	'XI NA',	'NAUTIKA',	'195602',	'K-03-07-225-129',	'DWI ELANG WIRANA PUTRA',	'XI',	'R2',	2,	'195602',	'1038',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(130,	'XI NA',	'NAUTIKA',	'195603',	'K-03-07-225-130',	'ERIKA FITRIA NUR MAYASARI',	'XI',	'R2',	2,	'195603',	'1815',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(131,	'XI NA',	'NAUTIKA',	'195604',	'K-03-07-225-131',	'ERVIN ADI KUSUMA',	'XI',	'R2',	2,	'195604',	'1492',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(132,	'XI NA',	'NAUTIKA',	'195605',	'K-03-07-225-132',	'EVANDARELL',	'XI',	'R2',	2,	'195605',	'1406',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(133,	'XI NA',	'NAUTIKA',	'195606',	'K-03-07-225-133',	'HANAAN HASTUNGKORO',	'XI',	'R2',	2,	'195606',	'1065',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(134,	'XI NA',	'NAUTIKA',	'195607',	'K-03-07-225-134',	'ILHAM MAULANA DAFFA AZIZI',	'XI',	'R2',	2,	'195607',	'1969',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(135,	'XI NA',	'NAUTIKA',	'195608',	'K-03-07-225-135',	'INDAH PURWANINGSIH',	'XI',	'R2',	2,	'195608',	'1157',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(136,	'XI NA',	'NAUTIKA',	'195609',	'K-03-07-225-136',	'IRFAN FAUZI RAMDHANI',	'XI',	'R2',	2,	'195609',	'1531',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(137,	'XI NA',	'NAUTIKA',	'195610',	'K-03-07-225-137',	'IRMA PRATIWI',	'XI',	'R2',	2,	'195610',	'1727',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(138,	'XI NA',	'NAUTIKA',	'195611',	'K-03-07-225-138',	'JHOSE  ADI PUTRA',	'XI',	'R2',	2,	'195611',	'1771',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(139,	'XI NA',	'NAUTIKA',	'195612',	'K-03-07-225-139',	'KARTIKA DEA SEPA',	'XI',	'R2',	2,	'195612',	'1581',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(140,	'XI NA',	'NAUTIKA',	'195613',	'K-03-07-225-140',	'MUHAMAD HAFIDZ GUNTUR RUSLANI',	'XI',	'R2',	2,	'195613',	'1239',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(141,	'XI NA',	'NAUTIKA',	'195614',	'K-03-07-225-141',	'MUHAMAD KHOLID ALFAUZAN',	'XI',	'R2',	2,	'195614',	'1729',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(142,	'XI NA',	'NAUTIKA',	'195615',	'K-03-07-225-142',	'MUHAMMAD RATHIB NUR ALIF',	'XI',	'R2',	2,	'195615',	'1402',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(143,	'XI NA',	'NAUTIKA',	'195616',	'K-03-07-225-143',	'RAFI DIAS KURNIAWAN',	'XI',	'R2',	2,	'195616',	'1291',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(144,	'XI NA',	'NAUTIKA',	'195617',	'K-03-07-225-144',	'RAHMAT SUBEKHI',	'XI',	'R2',	2,	'195617',	'1966',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(145,	'XI NA',	'NAUTIKA',	'195618',	'K-03-07-225-145',	'REZA NURHUDA WIJAYA',	'XI',	'R2',	2,	'195618',	'1924',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(146,	'XI NA',	'NAUTIKA',	'195619',	'K-03-07-225-146',	'WAHID NUROHMAN',	'XI',	'R2',	2,	'195619',	'1601',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(147,	'XI NA',	'NAUTIKA',	'195620',	'K-03-07-225-147',	'YOGI NAUFAL NURJAMIL',	'XI',	'R2',	2,	'195620',	'1635',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(148,	'XI NB',	'NAUTIKA',	'195621',	'K-03-07-225-148',	'ADINDA DWI FRASTICA',	'XI ',	'R2',	2,	'195621',	'1222',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(149,	'XI NB',	'NAUTIKA',	'195622',	'K-03-07-225-149',	'ADINDA SELFI SEPTIANA',	'XI ',	'R2',	2,	'195622',	'1970',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(150,	'XI NB',	'NAUTIKA',	'195623',	'K-03-07-225-150',	'AGUNG SATRYA WINATA',	'XI ',	'R2',	2,	'195623',	'1512',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(151,	'XI NB',	'NAUTIKA',	'195624',	'K-03-07-225-151',	'AJI PANUNTUN',	'XI ',	'R2',	2,	'195624',	'1189',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(152,	'XI NB',	'NAUTIKA',	'195625',	'K-03-07-225-152',	'ANGGA DWI APRILIANDA',	'XI ',	'R2',	2,	'195625',	'1567',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(153,	'XI NB',	'NAUTIKA',	'195626',	'K-03-07-225-153',	'ANGGA PUTRA PRAMUDYA',	'XI ',	'R2',	2,	'195626',	'1241',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(154,	'XI NB',	'NAUTIKA',	'195627',	'K-03-07-225-154',	'ANGGA WAHYU PUTRA',	'XI ',	'R2',	2,	'195627',	'1080',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(155,	'XI NB',	'NAUTIKA',	'195628',	'K-03-07-225-155',	'APRILIA DWI CAHYANI',	'XI ',	'R2',	2,	'195628',	'1113',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(156,	'XI NB',	'NAUTIKA',	'195629',	'K-03-07-225-156',	'CHINDI CINTA WULANDARI',	'XI ',	'R2',	2,	'195629',	'1375',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(157,	'XI NB',	'NAUTIKA',	'195630',	'K-03-07-225-157',	'DIPA VIRYA PUTRA PUJI JANUARTA',	'XI ',	'R2',	2,	'195630',	'1803',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(158,	'XI NB',	'NAUTIKA',	'195631',	'K-03-07-225-158',	'ETIA MONICA',	'XI ',	'R2',	2,	'195631',	'1337',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(159,	'XI NB',	'NAUTIKA',	'195632',	'K-03-07-225-159',	'FAIS PRATAMA',	'XI ',	'R2',	2,	'195632',	'1916',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(160,	'XI NB',	'NAUTIKA',	'195633',	'K-03-07-225-160',	'FEBRY EKA SAPUTRA',	'XI ',	'R2',	2,	'195633',	'1950',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(161,	'XI NB',	'NAUTIKA',	'195634',	'K-03-07-225-161',	'GEMPAR SUROSO',	'XI ',	'R2',	2,	'195634',	'1766',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(162,	'XI NB',	'NAUTIKA',	'195635',	'K-03-07-225-162',	'IYON CIPTO WIDODO',	'XI ',	'R2',	2,	'195635',	'1114',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(163,	'XI NB',	'NAUTIKA',	'195636',	'K-03-07-225-163',	'M INTAN MURDIONO',	'XI ',	'R2',	2,	'195636',	'1438',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(164,	'XI NB',	'NAUTIKA',	'195637',	'K-03-07-225-164',	'MUHAMMAD DWI BAGUS NUR ALFIAN',	'XI ',	'R2',	2,	'195637',	'1662',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(165,	'XI NB',	'NAUTIKA',	'195638',	'K-03-07-225-165',	'NAZAR BAYU AROKHMAN',	'XI ',	'R2',	2,	'195638',	'1900',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(166,	'XI NB',	'NAUTIKA',	'195639',	'K-03-07-225-166',	'PAUZI AL MUNAWAR',	'XI ',	'R2',	2,	'195639',	'1471',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(167,	'XI NB',	'NAUTIKA',	'195640',	'K-03-07-225-167',	'PUTRI KHANSA MUTHMAINAH',	'XI ',	'R2',	2,	'195640',	'1794',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(168,	'XI NB',	'NAUTIKA',	'195641',	'K-03-07-225-168',	'RANGGA FERIANTO',	'XI ',	'R2',	2,	'195641',	'1618',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(169,	'XI NB',	'NAUTIKA',	'195642',	'K-03-07-225-169',	'RANGGA PUTRA PRIADI ',	'XI ',	'R2',	2,	'195642',	'1353',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(170,	'XI NB',	'NAUTIKA',	'195643',	'K-03-07-225-170',	'RIKI DWI SAPUTRA',	'XI ',	'R2',	2,	'195643',	'1570',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(171,	'XI NB',	'NAUTIKA',	'195644',	'K-03-07-225-171',	'SEIKA PUTRA ADE PRATAMA',	'XI ',	'R2',	2,	'195644',	'1205',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(172,	'XI NB',	'NAUTIKA',	'195645',	'K-03-07-225-172',	'TEGAR ARI PRASETYO',	'XI ',	'R2',	2,	'195645',	'1549',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(173,	'XI NB',	'NAUTIKA',	'195646',	'K-03-07-225-173',	'TRI HAPSARI',	'XI ',	'R2',	2,	'195646',	'1791',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(174,	'XI NB',	'NAUTIKA',	'195647',	'K-03-07-225-174',	'VIGAN RAMSONI',	'XI ',	'R2',	2,	'195647',	'1382',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(175,	'XI NC',	'NAUTIKA',	'195648',	'K-03-07-225-175',	'AGIL ROBANI',	'XI',	'R2',	2,	'195648',	'1235',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(176,	'XI NC',	'NAUTIKA',	'195649',	'K-03-07-225-176',	'AGUNG DHARMAWAN',	'XI',	'R2',	2,	'195649',	'1446',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(177,	'XI NC',	'NAUTIKA',	'195650',	'K-03-07-225-177',	'AJI ILHAM SYAUKI',	'XI',	'R2',	2,	'195650',	'1452',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(178,	'XI NC',	'NAUTIKA',	'195651',	'K-03-07-225-178',	'ANGGORO FARIZQI',	'XI',	'R2',	2,	'195651',	'1535',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(179,	'XI NC',	'NAUTIKA',	'195652',	'K-03-07-225-179',	'BHERTA ADINA NATALIA HARTANTO',	'XI',	'R2',	2,	'195652',	'1355',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(180,	'XI NC',	'NAUTIKA',	'195653',	'K-03-07-225-180',	'DWIMAS ADI NUGROHO',	'XI',	'R2',	2,	'195653',	'1329',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(181,	'XI NC',	'NAUTIKA',	'195654',	'K-03-07-225-181',	'EKA WAHYU ADIYANSAH',	'XI',	'R2',	2,	'195654',	'1368',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(182,	'XI NC',	'NAUTIKA',	'195655',	'K-03-07-225-182',	'ELA DWI FIRDAYANTI',	'XI',	'R2',	2,	'195655',	'1716',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(183,	'XI NC',	'NAUTIKA',	'195656',	'K-03-07-225-183',	'FAQIH OWEN PRADANA',	'XI',	'R2',	2,	'195656',	'1389',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(184,	'XI NC',	'NAUTIKA',	'195657',	'K-03-07-225-184',	'ISNA MA\'RIFATUL HIDAYATI',	'XI',	'R2',	2,	'195657',	'1074',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(185,	'XI NC',	'NAUTIKA',	'195658',	'K-03-07-225-185',	'JULIA PUTRI ELISABET',	'XI',	'R2',	2,	'195658',	'1836',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(186,	'XI NC',	'NAUTIKA',	'195659',	'K-03-07-225-186',	'KURNIAWAN DWI PRASETYO',	'XI',	'R2',	2,	'195659',	'1636',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(187,	'XI NC',	'NAUTIKA',	'195660',	'K-03-07-225-187',	'LUKMAN BAEHAQI',	'XI',	'R2',	2,	'195660',	'1770',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(188,	'XI NC',	'NAUTIKA',	'195661',	'K-03-07-225-188',	'LYSIA RAHMA YANUARTI',	'XI',	'R2',	2,	'195661',	'1882',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(189,	'XI NC',	'NAUTIKA',	'195662',	'K-03-07-225-189',	'MAHATMA CHARLIE RIZKY ARSA',	'XI',	'R2',	2,	'195662',	'1254',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(190,	'XI NC',	'NAUTIKA',	'195663',	'K-03-07-225-190',	'MUHAMMAD RAIHAN RAMADAN',	'XI',	'R2',	2,	'195663',	'1488',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(191,	'XI NC',	'NAUTIKA',	'195664',	'K-03-07-225-191',	'MUHAMMAD FAJAR ARIEF SETYAWAN',	'XI',	'R2',	2,	'195664',	'1020',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(192,	'XI NC',	'NAUTIKA',	'195665',	'K-03-07-225-192',	'NUR FATUROHMAN',	'XI',	'R2',	2,	'195665',	'1004',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(193,	'XI NC',	'NAUTIKA',	'195666',	'K-03-07-225-193',	'RENALDHI WICAKSONO',	'XI',	'R2',	2,	'195666',	'1796',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(194,	'XI NC',	'NAUTIKA',	'195667',	'K-03-07-225-194',	'RIZAL PADRI MARIO',	'XI',	'R2',	2,	'195667',	'1258',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(195,	'XI NC',	'NAUTIKA',	'195668',	'K-03-07-225-195',	'SAIFUL ANWAR',	'XI',	'R2',	2,	'195668',	'1700',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(196,	'XI NC',	'NAUTIKA',	'195669',	'K-03-07-225-196',	'TANIA MONICA',	'XI',	'R2',	2,	'195669',	'1428',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(197,	'XI NC',	'NAUTIKA',	'195670',	'K-03-07-225-197',	'UA ARUJI MUKTI',	'XI',	'R2',	2,	'195670',	'1559',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(198,	'XI NC',	'NAUTIKA',	'195671',	'K-03-07-225-198',	'UMAM MUNAHDA',	'XI',	'R2',	2,	'195671',	'1398',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(199,	'XI NC',	'NAUTIKA',	'195672',	'K-03-07-225-199',	'WAHYU AJI NUR FAHMI',	'XI',	'R2',	2,	'195672',	'1341',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(200,	'XI TA',	'TEKNIKA',	'195674',	'K-03-07-225-200',	'AFIF WAHYU ROMADHON',	'XI',	'R2',	2,	'195674',	'1883',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(201,	'XI TA',	'TEKNIKA',	'195675',	'K-03-07-225-201',	'AFRIZAL TRI SUBEKTI',	'XI',	'R2',	2,	'195675',	'1960',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(202,	'XI TA',	'TEKNIKA',	'195676',	'K-03-07-225-202',	'ALFIN ALBAIHAQI',	'XI',	'R2',	2,	'195676',	'1137',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(203,	'XI TA',	'TEKNIKA',	'195677',	'K-03-07-225-203',	'AZIS MAULANA SAFRUDIN',	'XI',	'R2',	2,	'195677',	'1262',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(204,	'XI TA',	'TEKNIKA',	'195678',	'K-03-07-225-204',	'DANANG GALIH PANJI TARAKA',	'XI',	'R2',	2,	'195678',	'1274',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(205,	'XI TA',	'TEKNIKA',	'195679',	'K-03-07-225-205',	'DEO SAPUTRA',	'XI',	'R2',	2,	'195679',	'1214',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(206,	'XI TA',	'TEKNIKA',	'195680',	'K-03-07-225-206',	'DEWANGGA RESTU BAYU',	'XI',	'R2',	2,	'195680',	'1831',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(207,	'XI TA',	'TEKNIKA',	'195681',	'K-03-07-225-207',	'DIMAS ADIM PUTRA NUGRAHA',	'XI',	'R2',	2,	'195681',	'1259',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(208,	'XI TA',	'TEKNIKA',	'195682',	'K-03-07-225-208',	'DIMAS SAPTO WIBOWO',	'XI',	'R2',	2,	'195682',	'1398',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(209,	'XI TA',	'TEKNIKA',	'195683',	'K-03-07-225-209',	'DWI AJI NUGROHO',	'XI',	'R2',	2,	'195683',	'1226',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(210,	'XI TA',	'TEKNIKA',	'195685',	'K-03-07-225-210',	'FAHMI DENI FEBIAN',	'XI',	'R2',	2,	'195685',	'1290',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(211,	'XI TA',	'TEKNIKA',	'195686',	'K-03-07-225-211',	'FAHRUL ROZI RAHMAN',	'XI',	'R2',	2,	'195686',	'1759',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(212,	'XI TA',	'TEKNIKA',	'195687',	'K-03-07-225-212',	'GESIT ELSADAI',	'XI',	'R2',	2,	'195687',	'1328',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(213,	'XI TA',	'TEKNIKA',	'195688',	'K-03-07-225-213',	'GHIFARI AKMAL RAMDHANI',	'XI',	'R2',	2,	'195688',	'1309',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(214,	'XI TA',	'TEKNIKA',	'195689',	'K-03-07-225-214',	'HAFIDZ AGENG PRATAMA',	'XI',	'R2',	2,	'195689',	'1912',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(215,	'XI TA',	'TEKNIKA',	'195691',	'K-03-07-225-215',	'JAFAL NOFAZ MUFRIZAL',	'XI',	'R2',	2,	'195691',	'1645',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(216,	'XI TA',	'TEKNIKA',	'195692',	'K-03-07-225-216',	'MUKHAMAD ABDUL AZIS',	'XI',	'R2',	2,	'195692',	'1233',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(217,	'XI TA',	'TEKNIKA',	'195693',	'K-03-07-225-217',	'M. ULUL FAHMI',	'XI',	'R2',	2,	'195693',	'1862',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(218,	'XI TA',	'TEKNIKA',	'195694',	'K-03-07-225-218',	'MAHESA DWI WIBOWO',	'XI',	'R2',	2,	'195694',	'1198',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(219,	'XI TA',	'TEKNIKA',	'195695',	'K-03-07-225-219',	'MUHAMAD AKROM AWALI',	'XI',	'R2',	2,	'195695',	'1601',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(220,	'XI TA',	'TEKNIKA',	'195696',	'K-03-07-225-220',	'MUHAMMAD AREEF',	'XI',	'R2',	2,	'195696',	'1948',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(221,	'XI TA',	'TEKNIKA',	'195697',	'K-03-07-225-221',	'TANTIO ANUGRAH BASKORO',	'XI',	'R2',	2,	'195697',	'1565',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(222,	'XI TA',	'TEKNIKA',	'195698',	'K-03-07-225-222',	'TANTRA MAHEZA PRIBAGYA PRATAMA',	'XI',	'R2',	2,	'195698',	'1366',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(223,	'XI TB',	'TEKNIKA',	'195699',	'K-03-07-225-223',	'ADAM FIRMANSYAH',	'XI',	'R2',	2,	'195699',	'1509',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(224,	'XI TB',	'TEKNIKA',	'195700',	'K-03-07-225-224',	'AGIL PURNOMO',	'XI',	'R2',	2,	'195700',	'1813',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(225,	'XI TB',	'TEKNIKA',	'195701',	'K-03-07-225-225',	'AHMAD JAENUR ROFIQ',	'XI',	'R2',	2,	'195701',	'1909',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(226,	'XI TB',	'TEKNIKA',	'195702',	'K-03-07-225-226',	'ARIFIAN AZZAHRA',	'XI',	'R2',	2,	'195702',	'1630',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(227,	'XI TB',	'TEKNIKA',	'195703',	'K-03-07-225-227',	'BINTANG AL FARIDZI',	'XI',	'R2',	2,	'195703',	'1102',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(228,	'XI TB',	'TEKNIKA',	'195704',	'K-03-07-225-228',	'DARMAWAN RIFKI INDRIANSYAH',	'XI',	'R2',	2,	'195704',	'1237',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(229,	'XI TB',	'TEKNIKA',	'195705',	'K-03-07-225-229',	'DHANA AYOM PATRIOT AZITYA',	'XI',	'R2',	2,	'195705',	'1300',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(230,	'XI TB',	'TEKNIKA',	'195706',	'K-03-07-225-230',	'FAISAL ADI PUTRA',	'XI',	'R2',	2,	'195706',	'1964',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(231,	'XI TB',	'TEKNIKA',	'195707',	'K-03-07-225-231',	'FAUZI ALFAHRUL',	'XI',	'R2',	2,	'195707',	'1661',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(232,	'XI TB',	'TEKNIKA',	'195708',	'K-03-07-225-232',	'HELIZAR FIRZA ADIKUSUMA',	'XI',	'R2',	2,	'195708',	'1831',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(233,	'XI TB',	'TEKNIKA',	'195709',	'K-03-07-225-233',	'HEROWIONO',	'XI',	'R2',	2,	'195709',	'1582',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(234,	'XI TB',	'TEKNIKA',	'195710',	'K-03-07-225-234',	'IBRA AZIZ SEPTIAN PRATAMA',	'XI',	'R2',	2,	'195710',	'1006',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(235,	'XI TB',	'TEKNIKA',	'195711',	'K-03-07-225-235',	'ILHAM SIREGAR',	'XI',	'R2',	2,	'195711',	'1255',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(236,	'XI TB',	'TEKNIKA',	'195712',	'K-03-07-225-236',	'ISMA MEIDIAA LAKSMANA',	'XI',	'R2',	2,	'195712',	'1199',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(237,	'XI TB',	'TEKNIKA',	'195713',	'K-03-07-225-237',	'KATON PANCA ARYA DIVA',	'XI',	'R2',	2,	'195713',	'1850',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(238,	'XI TB',	'TEKNIKA',	'195714',	'K-03-07-225-238',	'MOCHAMAD ALI RAHMAN',	'XI',	'R2',	2,	'195714',	'1014',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(239,	'XI TB',	'TEKNIKA',	'195715',	'K-03-07-225-239',	'MUHAMMAD FAJAR REZANDI',	'XI',	'R2',	2,	'195715',	'1169',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(240,	'XI TB',	'TEKNIKA',	'195716',	'K-03-07-225-240',	'MUHAMMAD ISKANDAR',	'XI',	'R2',	2,	'195716',	'1540',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(241,	'XI TB',	'TEKNIKA',	'195717',	'K-03-07-225-241',	'MUHAMMAD YAZID ZIDAN',	'XI',	'R2',	2,	'195717',	'1404',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(242,	'XI TB',	'TEKNIKA',	'195718',	'K-03-07-225-242',	'MUHAMMAD UMAR SAPUTRA',	'XI',	'R2',	2,	'195718',	'1161',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(243,	'XI TB',	'TEKNIKA',	'195719',	'K-03-07-225-243',	'NUR ALIF ARDYANTO',	'XI',	'R2',	2,	'195719',	'1759',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(244,	'XI TB',	'TEKNIKA',	'195720',	'K-03-07-225-244',	'RACHMAT NUR SARIFUDIN',	'XI',	'R2',	2,	'195720',	'1093',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(245,	'XI TB',	'TEKNIKA',	'195721',	'K-03-07-225-245',	'RIDLO SEPTIAN',	'XI',	'R2',	2,	'195721',	'1151',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(246,	'XI TA',	'TEKNIKA',	'195722',	'K-03-07-225-246',	'TAUFIK ANANDA SAPUTRA',	'XI',	'R2',	2,	'195722',	'1364',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(247,	'XI TB',	'TEKNIKA',	'195723',	'K-03-07-225-247',	'WAHYU SAFRIL DA\'I',	'XI',	'R2',	2,	'195723',	'1422',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(248,	'XI TB',	'TEKNIKA',	'195724',	'K-03-07-225-248',	'WILDAN ABDILLAH ',	'XI',	'R2',	2,	'195724',	'1938',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(249,	'XI TB',	'TEKNIKA',	'195725',	'K-03-07-225-249',	'YULDANI DHYLAND PRAKOSO',	'XI',	'R2',	2,	'195725',	'1974',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(250,	'XI TC',	'TEKNIKA',	'195726',	'K-03-07-225-250',	'ANDRI SAPUTRA',	'XI',	'R2',	2,	'195726',	'1753',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(251,	'XI TC',	'TEKNIKA',	'195727',	'K-03-07-225-251',	'ARDIKA WAHYU ERGA S',	'XI',	'R2',	2,	'195727',	'1188',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(252,	'XI TC',	'TEKNIKA',	'195728',	'K-03-07-225-252',	'DESFIAN FEMAS MAULANA',	'XI',	'R2',	2,	'195728',	'1522',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(253,	'XI TC',	'TEKNIKA',	'195729',	'K-03-07-225-253',	'EDHITYIA BAYU PAMUNGKAS',	'XI',	'R2',	2,	'195729',	'1360',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(254,	'XI TC',	'TEKNIKA',	'195730',	'K-03-07-225-254',	'ERIK SEBASTIAN',	'XI',	'R2',	2,	'195730',	'1121',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(255,	'XI TC',	'TEKNIKA',	'195731',	'K-03-07-225-255',	'FAISAL ABI NUGROHO',	'XI',	'R2',	2,	'195731',	'1711',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(256,	'XI TC',	'TEKNIKA',	'195732',	'K-03-07-225-256',	'FIKRI NURRAHMAN',	'XI',	'R2',	2,	'195732',	'1332',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(257,	'XI TC',	'TEKNIKA',	'195733',	'K-03-07-225-257',	'GESANG LEKSANA',	'XI',	'R2',	2,	'195733',	'1356',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(258,	'XI TC',	'TEKNIKA',	'195734',	'K-03-07-225-258',	'HENANDAR ARWAN NURIZKHI',	'XI',	'R2',	2,	'195734',	'1591',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(259,	'XI TC',	'TEKNIKA',	'195735',	'K-03-07-225-259',	'MUHAMMAD HAIDAR ANWAR',	'XI',	'R2',	2,	'195735',	'1781',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(260,	'XI TC',	'TEKNIKA',	'195736',	'K-03-07-225-260',	'OCHA YUS PRATAMA',	'XI',	'R2',	2,	'195736',	'1144',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(261,	'XI TC',	'TEKNIKA',	'195737',	'K-03-07-225-261',	'OKTA ALIFVIAN BAROKAH',	'XI',	'R2',	2,	'195737',	'1507',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(262,	'XI TC',	'TEKNIKA',	'195738',	'K-03-07-225-262',	'RAIKHANIF HILMY RIADI',	'XI',	'R2',	2,	'195738',	'1599',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(263,	'XI TC',	'TEKNIKA',	'195739',	'K-03-07-225-263',	'RAIKHANESTA ALMADIVA',	'XI',	'R2',	2,	'195739',	'1605',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(264,	'XI TC',	'TEKNIKA',	'195740',	'K-03-07-225-264',	'REZKY PRATAMA',	'XI',	'R2',	2,	'195740',	'1231',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(265,	'XI TC',	'TEKNIKA',	'195741',	'K-03-07-225-265',	'RIFQI LATIFUL FADOLI',	'XI',	'R2',	2,	'195741',	'1376',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(266,	'XI TC',	'TEKNIKA',	'195742',	'K-03-07-225-266',	'SATRIA BINTANG RAMADHAN',	'XI',	'R2',	2,	'195742',	'1381',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(267,	'XI TC',	'TEKNIKA',	'195743',	'K-03-07-225-267',	'UUS RAHMAWAN DIANTO',	'XI',	'R2',	2,	'195743',	'1818',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(268,	'XI TC',	'TEKNIKA',	'195744',	'K-03-07-225-268',	'VEMAS HASBIYALLOH ARSYIDIN',	'XI',	'R2',	2,	'195744',	'1385',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(269,	'XI TC',	'TEKNIKA',	'195745',	'K-03-07-225-269',	'YEKTI IKSAN MAULANA',	'XI',	'R2',	2,	'195745',	'1155',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(270,	'XI TC',	'TEKNIKA',	'195746',	'K-03-07-225-270',	'YOGA PRIANTO',	'XI',	'R2',	2,	'195746',	'1590',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(271,	'XI TC',	'TEKNIKA',	'195747',	'K-03-07-225-271',	'ZAKI BASWARA SURINDRA',	'XI',	'R2',	2,	'195747',	'1233',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(272,	'XI TC',	'TEKNIKA',	'195748',	'K-03-07-225-272',	'ZETTA PUTRA RENATA',	'XI',	'R2',	2,	'195748',	'1603',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(273,	'XII NA',	'NAUTIKA',	'185405',	'K-03-07-225-273',	'ADNAN FAUZI',	'XII',	'R3',	3,	'185405',	'1988',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(274,	'XII NA',	'NAUTIKA',	'185406',	'K-03-07-225-274',	'AJENG WAHYUNING MEYLIANA',	'XII',	'R3',	3,	'185406',	'1125',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(275,	'XII NA',	'NAUTIKA',	'185407',	'K-03-07-225-275',	'ANDRIAN HERA SANDY',	'XII',	'R3',	3,	'185407',	'1196',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(276,	'XII NA',	'NAUTIKA',	'185408',	'K-03-07-225-276',	'ARIA WAHYU NUGRAHA',	'XII',	'R3',	3,	'185408',	'1917',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(277,	'XII NA',	'NAUTIKA',	'185410',	'K-03-07-225-277',	'EKA FEBIANTO',	'XII',	'R3',	3,	'185410',	'1883',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(278,	'XII NA',	'NAUTIKA',	'185411',	'K-03-07-225-278',	'ERVIN PRIANTO',	'XII',	'R3',	3,	'185411',	'1501',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(279,	'XII NA',	'NAUTIKA',	'185412',	'K-03-07-225-279',	'FAIZAL ADI NUGROHO',	'XII',	'R3',	3,	'185412',	'1781',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(280,	'XII NA',	'NAUTIKA',	'185413',	'K-03-07-225-280',	'FANDI HIDAYAH',	'XII',	'R3',	3,	'185413',	'1096',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(281,	'XII NA',	'NAUTIKA',	'185414',	'K-03-07-225-281',	'FERA NUR JULFIANA',	'XII',	'R3',	3,	'185414',	'1706',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(282,	'XII NA',	'NAUTIKA',	'185415',	'K-03-07-225-282',	'ISNAENI BEGYO WAHYUNI',	'XII',	'R3',	3,	'185415',	'1841',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(283,	'XII NA',	'NAUTIKA',	'185416',	'K-03-07-225-283',	'JESICA DAFA MALAU',	'XII',	'R3',	3,	'185416',	'1154',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Kristen',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(284,	'XII NA',	'NAUTIKA',	'185417',	'K-03-07-225-284',	'M. LUTFI FAJAR SIDIQ',	'XII',	'R3',	3,	'185417',	'1107',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(285,	'XII NA',	'NAUTIKA',	'185418',	'K-03-07-225-285',	'M. ZOVAN VAHLEVI',	'XII',	'R3',	3,	'185418',	'1627',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(286,	'XII NA',	'NAUTIKA',	'185420',	'K-03-07-225-286',	'MUHAMMAD DAFFA\' ZIKRI ANGGORO',	'XII',	'R3',	3,	'185420',	'1444',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(287,	'XII NA',	'NAUTIKA',	'185421',	'K-03-07-225-287',	'NADHIA ARFIANI PUTRI',	'XII',	'R3',	3,	'185421',	'1443',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(288,	'XII NA',	'NAUTIKA',	'185422',	'K-03-07-225-288',	'RESTU MUHAMAD FAUZI',	'XII',	'R3',	3,	'185422',	'1379',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(289,	'XII NA',	'NAUTIKA',	'185423',	'K-03-07-225-289',	'RISKA MEILANI PUTRI',	'XII',	'R3',	3,	'185423',	'1548',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(290,	'XII NA',	'NAUTIKA',	'185424',	'K-03-07-225-290',	'RIZKY SAPUTRA',	'XII',	'R3',	3,	'185424',	'1325',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(291,	'XII NA',	'NAUTIKA',	'185425',	'K-03-07-225-291',	'ROLANDSYAH SUDEWA',	'XII',	'R3',	3,	'185425',	'1288',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(292,	'XII NA',	'NAUTIKA',	'185426',	'K-03-07-225-292',	'SHAFAF AGIL MAULANA',	'XII',	'R3',	3,	'185426',	'1295',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(293,	'XII NA',	'NAUTIKA',	'185427',	'K-03-07-225-293',	'SYAHRUL HIDAYAT',	'XII',	'R3',	3,	'185427',	'1395',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(294,	'XII NA',	'NAUTIKA',	'185428',	'K-03-07-225-294',	'TALITA ZERLINA AZALIA',	'XII',	'R3',	3,	'185428',	'1192',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(295,	'XII NA',	'NAUTIKA',	'185429',	'K-03-07-225-295',	'TEGAR LILO PRASETYO',	'XII',	'R3',	3,	'185429',	'1665',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(296,	'XII NA',	'NAUTIKA',	'185430',	'K-03-07-225-296',	'WAHRI YULIANTO',	'XII',	'R3',	3,	'185430',	'1452',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(297,	'XII NA',	'NAUTIKA',	'185431',	'K-03-07-225-297',	'WAHYU RESTU WIJAYANTO',	'XII',	'R3',	3,	'185431',	'1259',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(298,	'XII NB',	'NAUTIKA',	'185432',	'K-03-07-225-298',	'ASRINDA ALWITA WANDASARI',	'XII',	'R3',	3,	'185432',	'1333',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(299,	'XII NB',	'NAUTIKA',	'185433',	'K-03-07-225-299',	'AYU PUSPITASARI',	'XII',	'R3',	3,	'185433',	'1252',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(300,	'XII NB',	'NAUTIKA',	'185434',	'K-03-07-225-300',	'BAGUS TRIYATAMA',	'XII',	'R3',	3,	'185434',	'1842',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(301,	'XII NB',	'NAUTIKA',	'185435',	'K-03-07-225-301',	'DAFFA YUANDA HAFIZH',	'XII',	'R3',	3,	'185435',	'1810',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(302,	'XII NB',	'NAUTIKA',	'185436',	'K-03-07-225-302',	'DANANG PRAYOGO',	'XII',	'R3',	3,	'185436',	'1654',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(303,	'XII NB',	'NAUTIKA',	'185437',	'K-03-07-225-303',	'DIMAS CATUR PAMUNGKAS',	'XII',	'R3',	3,	'185437',	'1015',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(304,	'XII NB',	'NAUTIKA',	'185438',	'K-03-07-225-304',	'ERLAN DEFVANKA BAHARI',	'XII',	'R3',	3,	'185438',	'1960',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(305,	'XII NB',	'NAUTIKA',	'185439',	'K-03-07-225-305',	'FILYVIA MONTERA',	'XII',	'R3',	3,	'185439',	'1021',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(306,	'XII NB',	'NAUTIKA',	'185440',	'K-03-07-225-306',	'FIRMAN SYAH AVRILIYANDANU',	'XII',	'R3',	3,	'185440',	'1700',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(307,	'XII NB',	'NAUTIKA',	'185442',	'K-03-07-225-307',	'GITA CINTYA RAHMANDANI',	'XII',	'R3',	3,	'185442',	'1190',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(308,	'XII NB',	'NAUTIKA',	'185443',	'K-03-07-225-308',	'HILMY FATUROHMAN',	'XII',	'R3',	3,	'185443',	'1426',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(309,	'XII NB',	'NAUTIKA',	'185444',	'K-03-07-225-309',	'INDIT PAMULYAN',	'XII',	'R3',	3,	'185444',	'1020',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(310,	'XII NB',	'NAUTIKA',	'185446',	'K-03-07-225-310',	'IVAN ARDIANSYAH',	'XII',	'R3',	3,	'185446',	'1194',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(311,	'XII NB',	'NAUTIKA',	'185449',	'K-03-07-225-311',	'MUHAMAD ALDI PRASETYA',	'XII',	'R3',	3,	'185449',	'1871',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(312,	'XII NB',	'NAUTIKA',	'185450',	'K-03-07-225-312',	'MUHAMAD KHOLID ALFARIZI',	'XII',	'R3',	3,	'185450',	'1928',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(313,	'XII NB',	'NAUTIKA',	'185451',	'K-03-07-225-313',	'R. VITTO MAHENDRA PUTRANTO',	'XII',	'R3',	3,	'185451',	'1038',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(314,	'XII NB',	'NAUTIKA',	'185452',	'K-03-07-225-314',	'RINO MUGI WIBOWO',	'XII',	'R3',	3,	'185452',	'1735',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(315,	'XII NB',	'NAUTIKA',	'185453',	'K-03-07-225-315',	'RISKA OKTAVIA SARI',	'XII',	'R3',	3,	'185453',	'1828',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(316,	'XII NB',	'NAUTIKA',	'185454',	'K-03-07-225-316',	'RIZKY AL FARIZ',	'XII',	'R3',	3,	'185454',	'1040',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(317,	'XII NB',	'NAUTIKA',	'185456',	'K-03-07-225-317',	'UJI LAKSONO',	'XII',	'R3',	3,	'185456',	'1461',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(318,	'XII NB',	'NAUTIKA',	'185457',	'K-03-07-225-318',	'WULANDARI ROIS ROSYADA ROWWAHUNISA',	'XII',	'R3',	3,	'185457',	'1092',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(319,	'XII NB',	'NAUTIKA',	'185458',	'K-03-07-225-319',	'YUSUF FATHONI',	'XII',	'R3',	3,	'185458',	'1702',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(320,	'XII NB',	'NAUTIKA',	'02265',	'K-03-07-225-320',	'REIHAN FATTAH YOGA PRABOWO',	'XII',	'R3',	3,	'02265',	'1960',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(321,	'XII NC',	'NAUTIKA',	'185459',	'K-03-07-225-321',	'AFIF FARHAN',	'XII',	'R3',	3,	'185459',	'1992',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(322,	'XII NC',	'NAUTIKA',	'185460',	'K-03-07-225-322',	'AGETTHA PUAN FISYABILLA ANANTA',	'XII',	'R3',	3,	'185460',	'1979',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(323,	'XII NC',	'NAUTIKA',	'185461',	'K-03-07-225-323',	'ALFAN NIZAR ARIFIN',	'XII',	'R3',	3,	'185461',	'1239',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(324,	'XII NC',	'NAUTIKA',	'185462',	'K-03-07-225-324',	'AMANULLOH HASAN',	'XII',	'R3',	3,	'185462',	'1996',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(325,	'XII NC',	'NAUTIKA',	'185463',	'K-03-07-225-325',	'ANANDA ADAM PRATAMA',	'XII',	'R3',	3,	'185463',	'1086',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(326,	'XII NC',	'NAUTIKA',	'185464',	'K-03-07-225-326',	'ANDREA PARDOMUAN SITINDAON',	'XII',	'R3',	3,	'185464',	'1632',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(327,	'XII NC',	'NAUTIKA',	'185465',	'K-03-07-225-327',	'ANDREAN HANAFI',	'XII',	'R3',	3,	'185465',	'1431',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(328,	'XII NC',	'NAUTIKA',	'185466',	'K-03-07-225-328',	'DANIEL GIAN IMANUEL',	'XII',	'R3',	3,	'185466',	'1871',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Kristen',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(329,	'XII NC',	'NAUTIKA',	'185467',	'K-03-07-225-329',	'DWI ERYAN',	'XII',	'R3',	3,	'185467',	'1995',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(330,	'XII NC',	'NAUTIKA',	'185468',	'K-03-07-225-330',	'ERGI WIDIANTO',	'XII',	'R3',	3,	'185468',	'1884',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(331,	'XII NC',	'NAUTIKA',	'185469',	'K-03-07-225-331',	'FAUZI GIMNASTI',	'XII',	'R3',	3,	'185469',	'1731',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(332,	'XII NC',	'NAUTIKA',	'185470',	'K-03-07-225-332',	'FAUZIAH NISA NADA ZUHROH',	'XII',	'R3',	3,	'185470',	'1239',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(333,	'XII NC',	'NAUTIKA',	'185471',	'K-03-07-225-333',	'KLORA ALFIANDA',	'XII',	'R3',	3,	'185471',	'1346',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(334,	'XII NC',	'NAUTIKA',	'185472',	'K-03-07-225-334',	'LIDIA PERMANA PUTRI',	'XII',	'R3',	3,	'185472',	'1425',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(335,	'XII NC',	'NAUTIKA',	'185473',	'K-03-07-225-335',	'MAYLANI DWI NURNI\'MAH',	'XII',	'R3',	3,	'185473',	'1253',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(336,	'XII NC',	'NAUTIKA',	'185476',	'K-03-07-225-336',	'NOVEL INDRA RAMADHAN',	'XII',	'R3',	3,	'185476',	'1447',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(337,	'XII NC',	'NAUTIKA',	'185477',	'K-03-07-225-337',	'RESTU MEI ADITYA',	'XII',	'R3',	3,	'185477',	'1310',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(338,	'XII NC',	'NAUTIKA',	'185479',	'K-03-07-225-338',	'SIGIT PRASETYO',	'XII',	'R3',	3,	'185479',	'1388',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(339,	'XII NC',	'NAUTIKA',	'185480',	'K-03-07-225-339',	'TAUFIK HIDAYAT',	'XII',	'R3',	3,	'185480',	'1302',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(340,	'XII NC',	'NAUTIKA',	'185481',	'K-03-07-225-340',	'THANDEUS FRANSISCO',	'XII',	'R3',	3,	'185481',	'1978',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(341,	'XII NC',	'NAUTIKA',	'185483',	'K-03-07-225-341',	'WIKI HIDAYAH SAPUTRA',	'XII',	'R3',	3,	'185483',	'1444',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(342,	'XII NC',	'NAUTIKA',	'185485',	'K-03-07-225-342',	'YOGI DWIKI SUGANDI',	'XII',	'R3',	3,	'185485',	'1184',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(343,	'XII ND',	'NAUTIKA',	'185486',	'K-03-07-225-343',	'AISYAH APRILLIA ADAMA',	'XII',	'R3',	3,	'185486',	'1553',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(344,	'XII ND',	'NAUTIKA',	'185487',	'K-03-07-225-344',	'ALOYSIUS ARYA WIDYANTO',	'XII',	'R3',	3,	'185487',	'1139',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Katholik',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(345,	'XII ND',	'NAUTIKA',	'185489',	'K-03-07-225-345',	'ARIS SYAPUTRA ',	'XII',	'R3',	3,	'185489',	'1256',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(346,	'XII ND',	'NAUTIKA',	'185491',	'K-03-07-225-346',	'ELEN WAHYUNINGRUM',	'XII',	'R3',	3,	'185491',	'1047',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(347,	'XII ND',	'NAUTIKA',	'185492',	'K-03-07-225-347',	'FARIS PRADITA',	'XII',	'R3',	3,	'185492',	'1344',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(348,	'XII ND',	'NAUTIKA',	'185493',	'K-03-07-225-348',	'FERNANDO HARIS TRIMUKTI',	'XII',	'R3',	3,	'185493',	'1106',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(349,	'XII ND',	'NAUTIKA',	'185494',	'K-03-07-225-349',	'FITROHTUL SAHARANI',	'XII',	'R3',	3,	'185494',	'1158',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(350,	'XII ND',	'NAUTIKA',	'185495',	'K-03-07-225-350',	'ILHAM FAHMI',	'XII',	'R3',	3,	'185495',	'1887',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(351,	'XII ND',	'NAUTIKA',	'185496',	'K-03-07-225-351',	'M.OLGA NOITA PUTRA',	'XII',	'R3',	3,	'185496',	'1002',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(352,	'XII ND',	'NAUTIKA',	'185497',	'K-03-07-225-352',	'MACHMUD APRIYANTO',	'XII',	'R3',	3,	'185497',	'1208',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(353,	'XII ND',	'NAUTIKA',	'185498',	'K-03-07-225-353',	'MIFTAHUL HUDA KHOIRU R',	'XII',	'R3',	3,	'185498',	'1781',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(354,	'XII ND',	'NAUTIKA',	'185499',	'K-03-07-225-354',	'MUHAMMAD AMINUDIN',	'XII',	'R3',	3,	'185499',	'1974',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(355,	'XII ND',	'NAUTIKA',	'185500',	'K-03-07-225-355',	'MUHAMMAD FAJAR RUKUN',	'XII',	'R3',	3,	'185500',	'1652',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(356,	'XII ND',	'NAUTIKA',	'185501',	'K-03-07-225-356',	'NOVA NUR EKARAHIM',	'XII',	'R3',	3,	'185501',	'1224',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(357,	'XII ND',	'NAUTIKA',	'185502',	'K-03-07-225-357',	'PUTRA APRIL ADANG ARYANTO',	'XII',	'R3',	3,	'185502',	'1931',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(358,	'XII ND',	'NAUTIKA',	'185503',	'K-03-07-225-358',	'PUTRI KHORI FEBIOLA',	'XII',	'R3',	3,	'185503',	'1271',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(359,	'XII ND',	'NAUTIKA',	'185504',	'K-03-07-225-359',	'QORI HUDA RAMADHANI',	'XII',	'R3',	3,	'185504',	'1171',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(360,	'XII ND',	'NAUTIKA',	'185505',	'K-03-07-225-360',	'RAIKHANDRA PUTRA KHUSMAY FIDIANTORO',	'XII',	'R3',	3,	'185505',	'1683',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(361,	'XII ND',	'NAUTIKA',	'185506',	'K-03-07-225-361',	'RIZKY ADHIE YOSO PUTRO',	'XII',	'R3',	3,	'185506',	'1067',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(362,	'XII ND',	'NAUTIKA',	'185507',	'K-03-07-225-362',	'RIZQI IQBAL HANAFI',	'XII',	'R3',	3,	'185507',	'1533',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(363,	'XII ND',	'NAUTIKA',	'185508',	'K-03-07-225-363',	'SYIFALITA HIDAWANI',	'XII',	'R3',	3,	'185508',	'1423',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(364,	'XII ND',	'NAUTIKA',	'185509',	'K-03-07-225-364',	'TISTA ANDRIANI L',	'XII',	'R3',	3,	'185509',	'1801',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(365,	'XII ND',	'NAUTIKA',	'185510',	'K-03-07-225-365',	'YOGI AGASAPUTRA',	'XII',	'R3',	3,	'185510',	'1055',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(366,	'XII ND',	'NAUTIKA',	'185511',	'K-03-07-225-366',	'YUGO WIRAWANT',	'XII',	'R3',	3,	'185511',	'1607',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(367,	'XII ND',	'NAUTIKA',	'185512',	'K-03-07-225-367',	'ZAENAL.ABIDIN',	'XII',	'R3',	3,	'185512',	'1851',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(368,	'XII TA',	'TEKNIKA',	'185513',	'K-03-07-225-368',	'ADITYA RESA PRIANTOMO',	'XII',	'R3',	3,	'185513',	'1865',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(369,	'XII TA',	'TEKNIKA',	'185514',	'K-03-07-225-369',	'ALDO ALVIAN ABDI PRAMUDITYA',	'XII',	'R3',	3,	'185514',	'1287',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(370,	'XII TA',	'TEKNIKA',	'185515',	'K-03-07-225-370',	'ANUGRAH PRASTIKA YULISTIAN',	'XII',	'R3',	3,	'185515',	'1397',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(371,	'XII TA',	'TEKNIKA',	'185516',	'K-03-07-225-371',	'BAYU TRI FATKUROHMUJI',	'XII',	'R3',	3,	'185516',	'1427',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(372,	'XII TA',	'TEKNIKA',	'185517',	'K-03-07-225-372',	'DEVANGGA BAGUS ARDIKA',	'XII',	'R3',	3,	'185517',	'1469',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(373,	'XII TA',	'TEKNIKA',	'185518',	'K-03-07-225-373',	'DIVA KURNIA NUR SAFURA',	'XII',	'R3',	3,	'185518',	'1715',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(374,	'XII TA',	'TEKNIKA',	'185519',	'K-03-07-225-374',	'EKO ADI YUWANTO',	'XII',	'R3',	3,	'185519',	'1532',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(375,	'XII TA',	'TEKNIKA',	'185520',	'K-03-07-225-375',	'FAIZAL FAIS AULIA FATURAHMAN',	'XII',	'R3',	3,	'185520',	'1843',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(376,	'XII TA',	'TEKNIKA',	'185521',	'K-03-07-225-376',	'FENDI PRABOWO',	'XII',	'R3',	3,	'185521',	'1524',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(377,	'XII TA',	'TEKNIKA',	'185522',	'K-03-07-225-377',	'FERI KURNIAWAN',	'XII',	'R3',	3,	'185522',	'1546',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(378,	'XII TA',	'TEKNIKA',	'185523',	'K-03-07-225-378',	'FERNANDA ADI NUGROHO',	'XII',	'R3',	3,	'185523',	'1652',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(379,	'XII TA',	'TEKNIKA',	'185524',	'K-03-07-225-379',	'MAFTUH A\'IN NURHAFIZ',	'XII',	'R3',	3,	'185524',	'1520',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(380,	'XII TA',	'TEKNIKA',	'185526',	'K-03-07-225-380',	'MUHAMMAD ABYAN DZAKY',	'XII',	'R3',	3,	'185526',	'1829',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(381,	'XII TA',	'TEKNIKA',	'185527',	'K-03-07-225-381',	'NIRWANA SETYA PAMBUDI',	'XII',	'R3',	3,	'185527',	'1252',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(382,	'XII TA',	'TEKNIKA',	'185528',	'K-03-07-225-382',	'NURACHARTO ADHI ANGGORO',	'XII',	'R3',	3,	'185528',	'1411',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(383,	'XII TA',	'TEKNIKA',	'185529',	'K-03-07-225-383',	'PRIMA BRUILIAN LINTANG GUMILANG',	'XII',	'R3',	3,	'185529',	'1834',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(384,	'XII TA',	'TEKNIKA',	'185530',	'K-03-07-225-384',	'RANGGI PRIANTORO',	'XII',	'R3',	3,	'185530',	'1029',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(385,	'XII TA',	'TEKNIKA',	'185531',	'K-03-07-225-385',	'RIAN SUTANTO',	'XII',	'R3',	3,	'185531',	'1544',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(386,	'XII TA',	'TEKNIKA',	'185532',	'K-03-07-225-386',	'RIKO BAYU SAPUTRA',	'XII',	'R3',	3,	'185532',	'1084',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(387,	'XII TA',	'TEKNIKA',	'185533',	'K-03-07-225-387',	'RISMA MAULANA',	'XII',	'R3',	3,	'185533',	'1888',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(388,	'XII TA',	'TEKNIKA',	'185534',	'K-03-07-225-388',	'RIZKI SATRIA',	'XII',	'R3',	3,	'185534',	'1981',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(389,	'XII TA',	'TEKNIKA',	'185535',	'K-03-07-225-389',	'SUBHAN RAHMATULJADI',	'XII',	'R3',	3,	'185535',	'1626',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(390,	'XII TA',	'TEKNIKA',	'185536',	'K-03-07-225-390',	'SULISTIO NUGROHO',	'XII',	'R3',	3,	'185536',	'1206',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(391,	'XII TA',	'TEKNIKA',	'185537',	'K-03-07-225-391',	'TEGAR DIMAS BAYU SAPUTRA',	'XII',	'R3',	3,	'185537',	'1332',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(392,	'XII TA',	'TEKNIKA',	'185538',	'K-03-07-225-392',	'YUDI FA\'AN ALWI',	'XII',	'R3',	3,	'185538',	'1647',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(393,	'XII TA',	'TEKNIKA',	'185539',	'K-03-07-225-393',	'YUHANES KRESNA ADI PRASETIYO',	'XII',	'R3',	3,	'185539',	'1924',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Kristen',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(394,	'XII TB',	'TEKNIKA',	'185540',	'K-03-07-225-394',	'AHMAD FATUROHMAN FAOZI',	'XII',	'R3',	3,	'185540',	'1572',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(395,	'XII TB',	'TEKNIKA',	'185541',	'K-03-07-225-395',	'AHMAD FAUZAN AZIDQI',	'XII',	'R3',	3,	'185541',	'1785',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(396,	'XII TB',	'TEKNIKA',	'185542',	'K-03-07-225-396',	'ARFAN FAIZAL PAMUNGKAS',	'XII',	'R3',	3,	'185542',	'1565',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(397,	'XII TB',	'TEKNIKA',	'185543',	'K-03-07-225-397',	'ARIF SANTOSA',	'XII',	'R3',	3,	'185543',	'1282',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(398,	'XII TB',	'TEKNIKA',	'185544',	'K-03-07-225-398',	'AZIZ SUKMA PURUHITA',	'XII',	'R3',	3,	'185544',	'1608',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(399,	'XII TB',	'TEKNIKA',	'185545',	'K-03-07-225-399',	'DAFFA PRIANDITA',	'XII',	'R3',	3,	'185545',	'1945',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(400,	'XII TB',	'TEKNIKA',	'185546',	'K-03-07-225-400',	'DANI RUDI IRAWAN',	'XII',	'R3',	3,	'185546',	'1468',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(401,	'XII TB',	'TEKNIKA',	'185547',	'K-03-07-225-401',	'DEBRI VANS PRATAMA',	'XII',	'R3',	3,	'185547',	'1602',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(402,	'XII TB',	'TEKNIKA',	'185548',	'K-03-07-225-402',	'DIAZ GAIZKA PUTRA',	'XII',	'R3',	3,	'185548',	'1163',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(403,	'XII TB',	'TEKNIKA',	'185549',	'K-03-07-225-403',	'DIKA RIYANSAH',	'XII',	'R3',	3,	'185549',	'1016',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(404,	'XII TB',	'TEKNIKA',	'185550',	'K-03-07-225-404',	'DIMAS ADHITYA',	'XII',	'R3',	3,	'185550',	'1208',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(405,	'XII TB',	'TEKNIKA',	'185551',	'K-03-07-225-405',	'FADILAH SAPUTRA',	'XII',	'R3',	3,	'185551',	'1101',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(406,	'XII TB',	'TEKNIKA',	'185552',	'K-03-07-225-406',	'GALANG RAMADHAN WIRANEGARA',	'XII',	'R3',	3,	'185552',	'1325',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(407,	'XII TB',	'TEKNIKA',	'185553',	'K-03-07-225-407',	'KAKHA AGNIANSYAH',	'XII',	'R3',	3,	'185553',	'1211',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(408,	'XII TB',	'TEKNIKA',	'185555',	'K-03-07-225-408',	'MOHAMMAD ZAKY MUS\'IDUL ARHAM',	'XII',	'R3',	3,	'185555',	'1857',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(409,	'XII TB',	'TEKNIKA',	'185556',	'K-03-07-225-409',	'MUHAMAD RAFLI FAUZI',	'XII',	'R3',	3,	'185556',	'1280',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(410,	'XII TB',	'TEKNIKA',	'185557',	'K-03-07-225-410',	'MUHAMMAD DWI LUQMAN',	'XII',	'R3',	3,	'185557',	'1805',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(411,	'XII TB',	'TEKNIKA',	'185558',	'K-03-07-225-411',	'PRATAMA TEGAR PAMBUDI',	'XII',	'R3',	3,	'185558',	'1390',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(412,	'XII TB',	'TEKNIKA',	'185559',	'K-03-07-225-412',	'PRIO WICAKSONO',	'XII',	'R3',	3,	'185559',	'1134',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(413,	'XII TB',	'TEKNIKA',	'185560',	'K-03-07-225-413',	'RISKI ADI SAPUTRA',	'XII',	'R3',	3,	'185560',	'1520',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(414,	'XII TB',	'TEKNIKA',	'185561',	'K-03-07-225-414',	'RULLY HASBI DODY RAVEMBA',	'XII',	'R3',	3,	'185561',	'1105',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(415,	'XII TB',	'TEKNIKA',	'185562',	'K-03-07-225-415',	'SAFRIL FIRMANSYAH',	'XII',	'R3',	3,	'185562',	'1659',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(416,	'XII TB',	'TEKNIKA',	'185563',	'K-03-07-225-416',	'TAUFIK HIDAYAT',	'XII',	'R3',	3,	'185563',	'1935',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(417,	'XII TB',	'TEKNIKA',	'185564',	'K-03-07-225-417',	'VICKY BAGUS ARDIANSYAH',	'XII',	'R3',	3,	'185564',	'1722',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(418,	'XII TB',	'TEKNIKA',	'185565',	'K-03-07-225-418',	'WIKO KARTA MANGGALA',	'XII',	'R3',	3,	'185565',	'1513',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(419,	'XII TB',	'TEKNIKA',	'185566',	'K-03-07-225-419',	'YUSUF ANDY DARMAWAN',	'XII',	'R3',	3,	'185566',	'1536',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(420,	'XII TC',	'TEKNIKA',	'185567',	'K-03-07-225-420',	'AGUM ALAMSYAH',	'XII',	'R3',	3,	'185567',	'1209',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(421,	'XII TC',	'TEKNIKA',	'185568',	'K-03-07-225-421',	'ALEKSANDER JUNIOR TODA',	'XII',	'R3',	3,	'185568',	'1927',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Katholik',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(422,	'XII TC',	'TEKNIKA',	'185569',	'K-03-07-225-422',	'ANANDA CAHYO LATIF',	'XII',	'R3',	3,	'185569',	'1374',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(423,	'XII TC',	'TEKNIKA',	'185570',	'K-03-07-225-423',	'CAHYO WIDJIARTO SUDIRO',	'XII',	'R3',	3,	'185570',	'1360',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(424,	'XII TC',	'TEKNIKA',	'185571',	'K-03-07-225-424',	'DANANJAYA AGIL SAPUTRA',	'XII',	'R3',	3,	'185571',	'1271',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(425,	'XII TC',	'TEKNIKA',	'185572',	'K-03-07-225-425',	'DEKA NANDA PRATAMA',	'XII',	'R3',	3,	'185572',	'1937',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(426,	'XII TC',	'TEKNIKA',	'185573',	'K-03-07-225-426',	'EKWAEREEL VESYAH',	'XII',	'R3',	3,	'185573',	'1291',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(427,	'XII TC',	'TEKNIKA',	'185574',	'K-03-07-225-427',	'FARIS NUR RIDHA',	'XII',	'R3',	3,	'185574',	'1932',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(428,	'XII TC',	'TEKNIKA',	'185575',	'K-03-07-225-428',	'GALUH BAGAS PRAMUDYA',	'XII',	'R3',	3,	'185575',	'1037',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(429,	'XII TC',	'TEKNIKA',	'185576',	'K-03-07-225-429',	'GEVARA GEBLIAN ABIMANYU',	'XII',	'R3',	3,	'185576',	'1978',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(431,	'XII TC',	'TEKNIKA',	'185578',	'K-03-07-225-431',	'IRSYAD ADAM ARDIANSYAH',	'XII',	'R3',	3,	'185578',	'1191',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(432,	'XII TC',	'TEKNIKA',	'185579',	'K-03-07-225-432',	'JABO AKVIN KUSYAGUM',	'XII',	'R3',	3,	'185579',	'1137',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(433,	'XII TC',	'TEKNIKA',	'185580',	'K-03-07-225-433',	'KRISNANDO MURYANTO',	'XII',	'R3',	3,	'185580',	'1163',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(434,	'XII TC',	'TEKNIKA',	'185581',	'K-03-07-225-434',	'LILIK SUGENG RIYADI',	'XII',	'R3',	3,	'185581',	'1339',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(435,	'XII TC',	'TEKNIKA',	'185582',	'K-03-07-225-435',	'LUKMAN JORDANTARA',	'XII',	'R3',	3,	'185582',	'1254',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(436,	'XII TC',	'TEKNIKA',	'185583',	'K-03-07-225-436',	'M RIFQY BILLZAKI',	'XII',	'R3',	3,	'185583',	'1387',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(437,	'XII TC',	'TEKNIKA',	'185584',	'K-03-07-225-437',	'MOHAMMAD AZZRIEL INDIANSYAH SIRAIT',	'XII',	'R3',	3,	'185584',	'1768',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(438,	'XII TC',	'TEKNIKA',	'185585',	'K-03-07-225-438',	'MUHAMMAD IRHAM FADILAH',	'XII',	'R3',	3,	'185585',	'1917',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(439,	'XII TC',	'TEKNIKA',	'185586',	'K-03-07-225-439',	'MUSTOFA KHADARISMAN APDILLAH',	'XII',	'R3',	3,	'185586',	'1058',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(440,	'XII TC',	'TEKNIKA',	'185587',	'K-03-07-225-440',	'RENDY MUHAMMAD ARIFIN',	'XII',	'R3',	3,	'185587',	'1313',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(441,	'XII TC',	'TEKNIKA',	'185588',	'K-03-07-225-441',	'SAGAF ADNAN MAULANA',	'XII',	'R3',	3,	'185588',	'1486',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(442,	'XII TC',	'TEKNIKA',	'185589',	'K-03-07-225-442',	'TEGUH PUJA NUGRAHA',	'XII',	'R3',	3,	'185589',	'1515',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(443,	'XII TC',	'TEKNIKA',	'185590',	'K-03-07-225-443',	'TIRTA ANANDA',	'XII',	'R3',	3,	'185590',	'1422',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(444,	'XII TC',	'TEKNIKA',	'185591',	'K-03-07-225-444',	'TONI SETIAWAN',	'XII',	'R3',	3,	'185591',	'1154',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(445,	'XII TC',	'TEKNIKA',	'185592',	'K-03-07-225-445',	'WILY MARSELA',	'XII',	'R3',	3,	'185592',	'1922',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0),
(446,	'XII TC',	'TEKNIKA',	'185593',	'K-03-07-225-446',	'ZAKIYUL FUAD DESTIONO',	'XII',	'R3',	3,	'185593',	'1078',	'',	'SERVER01',	NULL,	NULL,	NULL,	'Islam',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0);

DROP TABLE IF EXISTS `soal`;
CREATE TABLE `soal` (
  `id_soal` int NOT NULL AUTO_INCREMENT,
  `id_mapel` int NOT NULL,
  `nomor` int DEFAULT NULL,
  `soal` longtext,
  `jenis` int DEFAULT NULL,
  `pilA` longtext,
  `pilB` longtext,
  `pilC` longtext,
  `pilD` longtext,
  `pilE` longtext,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext,
  `file1` mediumtext,
  `fileA` mediumtext,
  `fileB` mediumtext,
  `fileC` mediumtext,
  `fileD` mediumtext,
  `fileE` mediumtext,
  PRIMARY KEY (`id_soal`)
) ENGINE=InnoDB AUTO_INCREMENT=2907 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id_token` int NOT NULL AUTO_INCREMENT,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `masa_berlaku` time NOT NULL,
  PRIMARY KEY (`id_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

TRUNCATE `token`;
INSERT INTO `token` (`id_token`, `token`, `time`, `masa_berlaku`) VALUES
(2,	'IOXCWI',	'2020-09-20 12:12:37',	'00:15:00');

DROP TABLE IF EXISTS `tugas`;
CREATE TABLE `tugas` (
  `id_tugas` int NOT NULL AUTO_INCREMENT,
  `id_guru` int NOT NULL DEFAULT '0',
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_tugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ujian`;
CREATE TABLE `ujian` (
  `id_ujian` int NOT NULL AUTO_INCREMENT,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int NOT NULL,
  `id_mapel` int NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int NOT NULL,
  `jml_esai` int NOT NULL,
  `bobot_pg` int NOT NULL,
  `opsi` int NOT NULL,
  `bobot_esai` int NOT NULL,
  `tampil_pg` int NOT NULL,
  `tampil_esai` int NOT NULL,
  `lama_ujian` int NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int NOT NULL,
  `token` int NOT NULL,
  `status` int DEFAULT NULL,
  `hasil` int DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int DEFAULT NULL,
  PRIMARY KEY (`id_ujian`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;


-- 2020-10-04 20:31:02

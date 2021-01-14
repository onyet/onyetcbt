![Login](https://shareku.net/screencapture-apiq-host-mobile_login-php-1602340283880.png)

# 📌 Deprecated
Onyet CBT with native PHP 7.X is deprecated. Furthermore, the Onyet CBT version is being developed in Codeigniter 4.x and Laravel versions, possibly in the future it will be developed using Pyhton (Django). Thank you for your cooperation and assistance so far.

## 🎊 Tentang OnyetCBT

OnyetCBT adalah Aplikasi opensource yang diperuntukan untuk instansi seperti sekolah, madrasah, ataupun yang lain, OnyetCBT ini biasa digunakan untuk PTS/PAS/USBN/SIMULASI UNBK. Aplikasi ini bersumber dari [CandyCBT](https://cbtcandy.com) yang dikembangkan kembali guna keperluan lebih lanjut. Aplikasi ini masih bersifat Open Source dengan lisensi MIT atau harap jangan menghilangkan nama yang sudah berkontribusi dalam pembuatan dan pengembangan aplikasi ini.

Fitur OnyetCBT:

- [Responsive - Bootstrap 3](https://getbootstrap.com/docs/3.3).
- [Pengelolaan Mudah](https://shareku.net).
- [3 Jenjang Pendidikan](https://shareku.net).
- [Role : Admin, Guru, Pengawas, Proktor, Siswa](https://shareku.net).
- [Pengumuman](https://shareku.net)
- [E-Learning, Tugas dan Komentar](https://shareku.net)
- [Absen Harian](https://shareku.net)
- [Meeting Room](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-start)
- [Aplikasi Android - Harap kontak kami](mailto:onyet@shareku.net)

## 🛠 Requirement

- PHP Version : PHP 7.x, Rekomendasi PHP 7.4
- PHP Imagick
- Jitsi Server: Optional
- MariaDB Version : 10.x

## 🎭 Admin Login

```bash
http://yourdomainroot/mobile_login.php

user		: admin
password	: adminpassword
```

## 🧬 Proses Pemasangan

### XAMPP

- Unduh [XAMPP](https://www.apachefriends.org/download.html)
- Lakukan [pemasangan XAMPP](https://www.wikihow.com/Install-the-Apache-Web-Server-on-a-Windows-PC)
- Unduh ZIP file atau Clone Repositori ini
- Masuk pada direktori/ folder XAMPP yang telah terpasang dan letakan semua file dalam repositori ini ke dalam folder ``htdocs``
- Jalankan XAMPP dan akse alamat XAMPP, biasanya ``http://localhost/_install.php``

### LARAGON

- Unduh [Laragon](https://laragon.org/download/index.html)
- Pasang atau ekstrak Laragon
- Unduh ZIP file atau Clone Repositori ini
- Masuk pada direktori/ folder Laragon yang telah terpasang dan letakan semua file dalam repositori ini ke dalam folder ``www``
- Jalankan Laragon dan akse alamat Laragon, biasanya ``http://localhost/_install.php``

### Apache Linux Server

- Siapkan semua package yang dibutuhkan : Apache/Apache2, MariaDB/MySQL, PHP 7.X, PHP7.X-FPM, PHP-Imagick dan kebutuhan webserver lainnya.
- Masuk ke Linux server menggunakan ssh/tls/filezilla
- Unduh ZIP file atau Clone Repositori ini
- Masuk pada dan unggah hasil clone repositori ini ke direktori/ folder ``/var/www/html``
- Mulai ulang / restart Apache/Apache2 dan akses melalui alamat web yang terhubung ke server tersebut.

Akses halaman instalasi atau pemasangan.
```bash
http://yourdomainroot/_install.php
```

## 📲 Aplikasi Android atau IOS

Untuk anda yang menginginkan aplikasi Android atau IOS build manual bisa hubungi kami langsung :
- Email : onyetcorp@gmail.com
- Whatsapp : +6282221874400
- Telegram : +6282221874400

Pada vesi android ada beberapa fitur tambahan seperti :
- Melihat Dokumen MS.office, PDF, Gambar secara langsung
- Mencegah perekaman atau penangkapan layar

## 🧨 Kerentanan Aplikasi

Jika anda mendapati bahwa aplikasi ini memeiliki kerentanan keamanan atau ada fungsi yang tidak berkerja dengan optimal maka anda bisa membuat issue pada repositori ini.

## 👑 Donasi

Silahkan cek halaman github kami [disini.](https://github.com/onyet)

## 🎁 Kontribusi

Semua kontribusi perbaikan atau ide yang anda ingin tuangkan atau kembangkan silahkan lakukan pullrequest.

## 👔 Lisensi

OnyetCBT adalah perangkat lunak bersumber terbuka yang dilisensikan di bawah [Lisensi MIT](https://opensource.org/licenses/MIT).
<b>Kami harap jangan menghilangkan tulisan OCBT pada config.ocbt.php dan copyright = Onyet App.</b>

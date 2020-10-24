<?php
defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');

if (!isset($_SESSION['id_pengawas']) && !isset($_SESSION['id_siswa']) && !isset($_SESSION['id_user'])) {
    echo "<script>window.location = '". $homeurl ."'</script>";
    exit();
}

$path = (isset($_GET['file']) ? $_GET['file'] : dekripsi($ac));
$path = urldecode($path);
$temp = explode('.', $path);
$urls = '';
$exts = trim(strtolower(end($temp)));

switch ($exts) {
    case ($exts == 'jpg' || $exts == 'png' || $exts == 'jpeg' || $exts == 'gif' || $exts == 'apng' || $exts == 'bmp' || $exts == 'svg' || $exts == 'tiff'):
        $urls = $homeurl .'/tools/img.php?file='. urlencode($path);
        break;

    case 'pdf':
        $urls = $homeurl .'/tools/pdf.php?file='. $path;
        break;

    case ($exts == 'doc' || $exts == 'docx' || $exts == 'ppt' || $exts == 'xls' || $exts == 'xlsx' || $exts == 'pptx' || $exts == 'ppt'):
        $urls = 'https://view.officeapps.live.com/op/embed.aspx?src='. urlencode($path);
        break;
}

?>
<iframe src="<?= $urls ?>" style="background-color: #757575; border: none; position: absolute; width: 100%; height: 100%; top: 50px; left: 0; right: 0;"></iframe>
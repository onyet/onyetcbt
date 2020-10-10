<?php
require_once './../config/config.default.php';

/**
 * Function Helper
 */
function randomString() {
    return md5(rand(100, 200));
}

/**
 * Start here
 */
$api_key= (isset($_GET['api_key'])) ? $_GET['api_key'] : $_POST['api_key'];
$file   = (isset($_FILES['file'])) ? $_FILES['file'] : false; 

if ($api_key == KEY && $file !== false) {
    
    $name       = time() . randomString();
    $ext        = explode('.',$file['name']);
    $filename   = $name .'.'. end($ext);
    $destination= './../temp/'. $filename;
    $location   =  $_FILES["file"]["tmp_name"];
    
    if (move_uploaded_file($location,$destination)) {

        echo json_encode(array(
            'status'    => 'success',
            'data'      => $homeurl .'/temp/'. $filename,
            'message'   => 'Berhasil mengunggah gambar.'
        ));

    } else {

        echo json_encode(array(
            'status'    => 'error',
            'data'      => [],
            'message'   => 'Gagal mengunggah gambar.'
        ));

    }

} else {

    echo json_encode(array(
        'status'    => 'error',
        'data'      => [],
        'message'   => 'Anda tidak dapat mengakses.'
    ));

}
exit();
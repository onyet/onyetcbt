<?php
    require("./../config/config.default.php");

    if (!isset($_SESSION['id_pengawas']) && !isset($_SESSION['id_siswa']) && !isset($_SESSION['id_user'])) {
        exit();
    }

    $file = urldecode($_GET['file']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Images Viewer</title>
    <link  href="<?= $homeurl ?>/dist/vendor/viewerjs/viewer.css" rel="stylesheet">
    <script src="<?= $homeurl ?>/dist/vendor/viewerjs/viewer.js"></script>
</head>
<body style="margin: 0; padding: 10px; background-color: gray; color: white;">
    <div>
        <img id="image" style="width: 100%; height: auto;" src="<?= $file ?>" alt="Maaf foto tidak ada.">
    </div>

    <script>
        // You should import the CSS file.
        // import 'viewerjs/dist/viewer.css';
        // import Viewer from 'viewerjs';

        // View an image
        const viewer = new Viewer(document.getElementById('image'), {
            inline: true,
            viewed() {
                viewer.zoomTo(1);
            },
        });
    </script>
</body>
</html>
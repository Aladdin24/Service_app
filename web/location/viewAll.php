<?php
$db = mysqli_connect('localhost','root','','userdata');
if (!$db) {
 echo "Database connection faild";
}

$voiture = $db->query("SELECT * FROM voiture");
$list = array();

while ($rowdata= $voiture->fetch_assoc()) {
    $list[] = $rowdata;
}

echo json_encode($list);
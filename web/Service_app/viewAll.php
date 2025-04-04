<?php
$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}

$entreprise = $db->query("SELECT * FROM entreprise WHERE id_categorie = '5' ");
$list = array();

while ($rowdata= $entreprise->fetch_assoc()) {
    $list[] = $rowdata;
}

echo json_encode($list);


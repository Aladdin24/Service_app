<?php
$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}



$commande = $db->query("SELECT Nom_commande, delai FROM commande ");
$list = array();

while ($rowdata= $commande->fetch_assoc()) {
    $list[] = $rowdata;
}

echo json_encode($list);
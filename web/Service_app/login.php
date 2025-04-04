<?php

$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}

$username = $_POST['username'];
$pwd = $_POST['pwd'];
$id_client = $_POST['id_client'];
$Nom_client = $_POST['Nom_client'];
$prenome_client = $_POST['prenome_client'];
$adresse_client = $_POST['adresse_client'];
$tel_clinet = $_POST['tel_clinet'];


$client = $db->query("SELECT * FROM client");
$client = $db->query("SELECT * FROM client WHERE username='".$username."' and password='".$pwd."'");


$result=array();

while($rowdata= $client->fetch_assoc()){
    $result[]= $rowdata;
}


echo json_encode($result);


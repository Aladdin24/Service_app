<?php
$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}

$username = $_POST['username'];
$Nom_client = $_POST['Nom_client'];
$prenome_client = $_POST['prenome_client'];
$adresse_client = $_POST['adresse_client'];
$password = $_POST['password'];
$tel_client = $_POST['tel_client'];
$status_client = $_POST['status_client'];

$db->query("INSERT INTO client(username,password,Nom_client,adresse_client,tel_client,status_client)VALUES('".$username."','".$password."','".$Nom_client."','".$adresse_client."','".$tel_client."','".$status_client."')")


?>
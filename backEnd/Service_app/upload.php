<?php
$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}

$Nom_commande = $_POST['Nom_commande'];
$username = $_POST['username'];
$delai = $_POST['delai'];
$id_entreprise = $_POST['id_entreprise'];
$prix = $_POST['prix'];


$db->query("INSERT INTO commande(Nom_commande,prix,username,delai,id_entreprise)VALUES('".$Nom_commande."','".$prix."','".$username."','".$delai."','".$id_entreprise."')")


?>
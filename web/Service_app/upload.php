<?php
$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}

$image = $_FILES['image']['name'];
$Nom_commande = $_POST['Nom_commande'];
$username = $_POST['username'];
$delai = $_POST['delai'];
$id_entreprise = $_POST['id_entreprise'];
$prix = $_POST['prix'];
$Description = $_POST['Description'];

$imagePath = 'photos/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];


move_uploaded_file($tmp_name, $imagePath);

$db->query("INSERT INTO commande(Nom_commande,prix,username,delai,id_entreprise,Description,image)VALUES('".$Nom_commande."','".$prix."','".$username."','".$delai."','".$id_entreprise."','".$Description."','".$image."')")


?>
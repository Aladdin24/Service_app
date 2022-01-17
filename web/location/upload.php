<?php
$db = mysqli_connect('localhost','root','','userdata');
if (!$db) {
 echo "Database connection faild";
}

$image = $_FILES['image']['name'];
$marque = $_POST['marque'];
$Modele = $_POST['Modele'];
$vitesses = $_POST['vitesses'];
$nbr_places = $_POST['nbr_places'];
$Prix = $_POST['Prix'];
$Couleur = $_POST['Couleur'];
$Disponibilite = $_POST['Disponibilite'];

$imagePath = 'uploads/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name, $imagePath);

$db->query("INSERT INTO voiture(marque,image,Modele,vitesses,nbr_places,Prix,Couleur,Disponibilite)VALUES('".$marque."','".$image."','".$Modele."','".$vitesses."','".$nbr_places."','".$Prix."','".$Couleur."','".$Disponibilite."')")


?>
<?php
$db = mysqli_connect('localhost','root','','userdata');
if (!$db) {
 echo "Database connection faild";
}

$id_voiture = $_POST['id_voiture'];
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

$db->query("UPDATE voiture SET marque = '".$marque."', image ='".$image."', Modele = '".$Modele."', vitesses = '".$vitesses."', nbr_places = '".$nbr_places."', Prix = '".$Prix."', Couleur = '".$Couleur."', Disponibilite = '".$Disponibilite."' WHERE id_voiture = '".$id_voiture."'");


?>
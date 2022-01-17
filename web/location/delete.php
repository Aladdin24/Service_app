<?php
$db = mysqli_connect('localhost','root','','userdata');
if (!$db) {
 echo "Database connection faild";
}

$id_voiture = $_POST['id_voiture'];

$db->query("DELETE FROM voiture WHERE id_voiture = '".$id_voiture."'");
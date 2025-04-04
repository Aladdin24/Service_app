<?php
    include('DB.php');
	$id_entreprise = $_POST["id_entreprise"];
    $Nom_ent = $_POST["Nom_ent"];
    $categorie =  $_POST["categorie"];
	$telephone =  $_POST["telephone"];
	$email =  $_POST["email"];
	$etat =  $_POST["etat"];

    $insert_query = "INSERT INTO entreprise(Nom_ent,categorie,etat)VALUES('".$Nom_ent."','".$categorie."','1')";
    
    $result = mysqli_query($connection,$insert_query);
    
?>
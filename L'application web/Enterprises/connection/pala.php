<?php
    include('DB.php');
    $ide = array();
    // $ide = implode(",",$_POST["id"]);
    $ide = $_POST["id"];
	$id_entreprise = $_POST["id_entreprise"];
    $Nom_ent = $_POST["Nom_ent"];
    $categorie =  $_POST["categorie"];
	$telephone =  $_POST["telephone"];
	$email =  $_POST["email"];
	$etat =  $_POST["etat"];
	$photo =  $_POST["photo"];
    
    // $pala = "UPDATE entreprise SET etat=0 where id_entreprise IN(".$ide.")";
    $pala = "UPDATE entreprise SET etat=0 where id_entreprise =".$ide." ";
    
    $result = mysqli_query($connection,$pala);
    echo mysqli_error($connection);

?>
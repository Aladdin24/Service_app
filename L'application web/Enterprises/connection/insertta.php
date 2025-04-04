<?php
    include('DB.php');
	$id_client = $_POST["id_client"];
    $Nom_client = $_POST["Nom_client"];
    $prenom_client =  $_POST["prenom_client"];
	$tel_client =  $_POST["tel_client"];
	$adresse_client =  $_POST["adresse_client"];


    $insert_query1 = "INSERT INTO client(Nom_client,prenom_client,adresse_client)VALUES('".$Nom_client."','".$prenom_client."','nkcc')";
    
    $result_cl = mysqli_query($connection,$insert_query1);
    
?>
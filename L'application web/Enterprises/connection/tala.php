<?php
    include('DB.php');
    $idc = array();
    // $idc = implode(",",$_POST["id"]);
    $idc = $_POST["id"];
	$tel_client = $_POST["tel_client"];
    $Nom_client = $_POST["Nom_client"];
    $prenom_client =  $_POST["prenom_client"];
	$adresse_client =  $_POST["adresse_client"];
	$status_client =  $_POST["status_client"];
	
    
    // $tala = "UPDATE client SET etat=0 where id_entreprise IN(".$ide.")";
    $tala = "UPDATE client SET prix='ndb' where id_client =".$idc." ";
    
    $result_cl = mysqli_query($connection,$tala);
    echo mysqli_error($connection);

?>
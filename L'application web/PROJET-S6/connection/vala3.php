<?php
    include('DB.php');
    $idco = array();
    // $idco = implode(",",$_POST["id"]);
    $idco = $_POST["id"];
	$id_commande = $_POST["id_commande"];
    $Nom_commande = $_POST["Nom_commande"];
    $prix =  $_POST["prix"];
	$delai =  $_POST["delai"];
	$tel_client =$POST["tel_client"];
	$id_entreprise =$POST["id_entreprise"];
	
    
    // $vala1 = "UPDATE commande SET prix=0 where id_commande IN(".$idco.")";
    $vala3 = "UPDATE commande SET prix =0 where id_commande =".$idco." AND id_entreprise=3";
    
    $result_co1 = mysqli_query($connection,$vala3);
    echo mysqli_error($connection);

?>
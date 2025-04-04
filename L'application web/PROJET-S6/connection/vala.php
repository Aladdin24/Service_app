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
	
    
    // $vala = "UPDATE commande SET prix=0 where id_commande IN(".$idco.")";
    $vala = "UPDATE commande SET prix=0 where id_commande IN(".$idco.") ";
    
    $result_co = mysqli_query($connection,$vala);
    echo mysqli_error($connection);

?>



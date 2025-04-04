<?php
    include('DB.php');
	$id_commande = $_POST["id_commande"];
    $Nom_commande = $_POST["Nom_commande"];
    $delai =  $_POST["delai"];
	$prix =  $_POST["prix"];
	
    $insert_query2 = "INSERT INTO commande(Nom_commande,prix,delai)VALUES('".$Nom_commande."','".$prix."','2012-04-25 18:13:15')";
    
    $result_co = mysqli_query($connection,$insert_query2);
    
?>
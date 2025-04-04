<?php
require_once('identifier.php');
    require_once('./connection/connexiondb.php');
    $Nom_ent=isset($_POST['Nom_ent'])?$_POST['Nom_ent']:"";
    $categorie=isset($_POST['categorie'])?$_POST['categorie']:"";
    $telephone=isset($_POST['telephone'])?$_POST['telephone']:49079857;
    $id_entreprise=isset($_POST['id_entreprise'])?$_POST['id_entreprise']:1;
	$email= isset($_POST['email'])?$_POST['email']:"";
    $etat= isset($_POST['etat'])?$_POST['etat']:"";
	$Photo=isset($_FILES['photo']['name'])?$_FILES['photo']['name']:"";
    $imageTemp=$_FILES['photo']['tmp_name'];
    move_uploaded_file($imageTemp,"../images/".$Photo);

    $requete="insert into entreprise(Nom_ent,categorie,telephone,email,etat,photo) values(?,?,?,?,?,?)";
    $params=array($Nom_ent,$categorie,$telephone,$email,$etat,$photo);
    $resultat=$pdo->prepare($requete);
    $resultat->execute($params);
    
    header('location:./entreprise.php');

?>


<?php
    require_once('identifier.php');

    require_once('./connection/connexiondb.php');

    $iduser=isset($_POST['userid'])?$_POST['userid']:0;

    $login=isset($_POST['login'])?$_POST['login']:"";

    $email=isset($_POST['email'])?strtoupper($_POST['email']):"";
    
    $requete="update users set login=?,email=? where userid=?";

    $params=array($login,$email,$iduser);

    $resultat=$pdo->prepare($requete);

    $resultat->execute($params);
    
    header('location:login.php');
?>

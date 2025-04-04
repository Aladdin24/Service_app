<?php
     session_start();
  if($_SESSION['users']['category']=='ADMIN'){ 
        if(isset($_SESSION['users'])){
            require_once('./connection/connexiondb.php');
            
            $idUser=isset($_GET['userid'])?$_GET['userid']:0;

            $requete="delete from users where userid=?";
            
            $params=array($idUser);
            
            $resultat=$pdo->prepare($requete);
            
            $resultat->execute($params);
            
            header('location:utilisateurs.php');   
            
     }
  }else {
                header('location:login.php');
        }
     
?>
<?php
        session_start();
        if($_SESSION['users']['category']=='ADMIN'){
            
            require_once('./connection/connexiondb.php');
            
            $idUser=isset($_GET['userid'])?$_GET['userid']:0;
            
            $etat=isset($_GET['etat'])?$_GET['etat']:0;
        
            if($etat==1){
                $newEtat=0;
            }else{
                $newEtat=1;
			}
            $requete="update users set etat=? where userid=?";
            
            $params=array($newEtat,$idUser);
            
            $resultat=$pdo->prepare($requete);
            
            $resultat->execute($params);
            
            header('location:utilisateurs.php');
            
     }else {
                header('location:login.php');
        }
?>
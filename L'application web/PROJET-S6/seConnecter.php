<?php
    session_start();
    require_once('./connection/connexiondb.php');
    
    $login=isset($_POST['login'])?$_POST['login']:"";
    
    $pwd=isset($_POST['pwd'])?$_POST['pwd']:"";

    $requete="select userid,login,email,category,etat 
                from users where login='$login' 
                and pwd=MD5('$pwd')";
    
    $resultat=$pdo->query($requete);

    if($users=$resultat->fetch()){
       
        if($users['etat']==1){
            
            $_SESSION['users']=$users;
            header('location:./index.php');
            
        }else{
            
            $_SESSION['erreurLogin']="<strong>Erreur!!</strong> Votre compte est désactivé.<br> Veuillez contacter l'administrateur";
            header('location:login.php');
        }
		
		
		

    }
	
	else{
        $_SESSION['erreurLogin']="<strong>Erreur!!</strong> Login ou mot de passe incorrecte!!!";
        header('location:login.php');
    }

?>

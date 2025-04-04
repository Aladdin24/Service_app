<?php

require_once("./connection/connexiondb.php");
require_once("./fonctions.php");

//echo 'Nombre des  user1 :  '.rechercher_par_login('user1');
//echo 'Nombre des  user1@gmail.com :  '.rechercher_par_email('user1@gmail.com');
$validationErrors = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $login = $_POST['login'];
	$category = $_POST['category'];
    $pwd1 = $_POST['pwd1'];
    $pwd2 = $_POST['pwd2'];
    $email = $_POST['email'];


    if (isset($login)) {
        $filtredLogin = filter_var($login, FILTER_SANITIZE_STRING);

        if (strlen($filtredLogin) < 4) {
            $validationErrors[] = "Erreur!!! Le login doit contenir au moins 4 caratères";
        }
    }

    if (isset($pwd1) && isset($pwd2)) {

        if (empty($pwd1)) {
            $validationErrors[] = "Erreur!!! Le mot ne doit pas etre vide";
        }

        if (md5($pwd1) !== md5($pwd2)) {
            $validationErrors[] = "Erreur!!! les deux mot de passe ne sont pas identiques";

        }
    }

    if (isset($email)) {
        $filtredEmail = filter_var($login, FILTER_SANITIZE_EMAIL);

        if ($filtredEmail != true) {
            $validationErrors[] = "Erreur!!! Email  non valid";

        }
    }

    if (empty($validationErrors)) {
        if (rechercher_par_login($login) == 0 & rechercher_par_email($email) == 0) {
            $requete = $pdo->prepare("INSERT INTO users(login,email,pwd,category,etat) 
                                        VALUES(:plogin,:pemail,:ppwd,:pcategory,:petat)");

            $requete->execute(array('plogin' => $login,
                'pemail' => $email,
                'ppwd' => md5($pwd1),
                'pcategory' => $category,
                'petat' => 0));

            $success_msg = "Félicitation, votre compte est crée, mais temporairement inactif jusqu'a activation par l'admin";
        } else {
            if (rechercher_par_login($login) > 0) {
                $validationErrors[] = 'Désolé le login exsite deja';
            }
            if (rechercher_par_email($email) > 0) {
                $validationErrors[] = 'Désolé cet email exsite deja';
            }
        }

    }

}

?>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>

    <title> Nouvel utilisateur </title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>

</head>
<body>
<div class="panel panel-warning margetop60 " >
<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" ><B> Création d'un nouveau compte utilisateur</B>

    <form class="form" method="post">

        <div class="input-container">

            <input type="text"
                   required="required"
                   minlength="4"
                   title="Le login doit contenir au moins 4 caractères..."
                   name="login"
                   placeholder="Taper votre nom d'utilisateur"
                   autocomplete="off"
                   class="form-control">
        </div>

        <div class="input-container">
            <input type="password"
                   required="required"
                   minlength="3"
                   title="Le Mot de passe doit contenir au moins 3 caractères..."
                   name="pwd1"
                   placeholder="Taper votre mot de passe"
                   autocomplete="new-password"
                   class="form-control">
        </div>

        <div class="input-container">
            <input type="password"
                   required="required"
                   minlength="3"
                   name="pwd2"
                   placeholder="retaper votre mot de passe pour le confirmer"
                   autocomplete="new-password"
                   class="form-control">
        </div>

        <div class="input-container">

            <input type="email"
                   required="required"
                   name="email"
                   placeholder="Taper votre email"
                   autocomplete="off"
                   class="form-control">
        </div>
		
		<div class="input-container">

            <input type="category"
                   required="required"
                   name="category"
                   placeholder="Taper votre categorie"
                   autocomplete="off"
                   class="form-control">
        </div>

        <input type="submit" class="btn btn-info" value="Enregistrer">
    </form>
    <br>
    <?php

    if (isset($validationErrors) && !empty($validationErrors)) {
        foreach ($validationErrors as $error) {
            echo '<div class="alert alert-danger">' . $error . '</div>';
        }
    }


    if (isset($success_msg) && !empty($success_msg)) {
        echo '<div class="alert alert-success">' . $success_msg . '</div>';

        header('refresh:5;url=login.php');
    }

    ?>

</div>

</body>

</html>




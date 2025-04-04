<?php
session_start();
if (isset($_SESSION['erreurLogin']))
    $erreurLogin = $_SESSION['erreurLogin'];
else {
    $erreurLogin = "";
}
session_destroy();
?>
<! DOCTYPE HTML>
<HTML>
<head>
    <meta charset="utf-8">
    <title>Se connecter</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
  
</head>
<body>
<div class="container col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
    <div class="panel panel-warning margetop60">
        <div class="panel-heading">Se connecter :</div>
        <div class="panel-body">
            <form method="post" action="seConnecter.php" class="form">

                <?php if (!empty($erreurLogin)) { ?>
                    <div class="alert alert-danger">
                        <?php echo $erreurLogin ?>
                    </div>
                <?php } ?>

                <div class="form-group">
                    <label for="login">Login :</label>
                    <input type="text" name="login" placeholder="Login"
                           class="form-control" autocomplete="off"/>
                </div>

                <div class="form-group">
                    <label for="pwd">Mot de passe :</label>
                    <input type="password" name="pwd"
                           placeholder="Mot de passe" class="form-control"/>
                </div>

                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-log-in"></span>
                    Se connecter
                </button>
                <p class="text-right">
                    <a href="InitialiserPwd.php">Mot de passe Oublié</a>

                    &nbsp &nbsp

                    <a href="nouvelUtilisateur.php">Créer un compte</a>
                </p>
            </form>
        </div>
    </div>
</div>
</body>
</HTML>

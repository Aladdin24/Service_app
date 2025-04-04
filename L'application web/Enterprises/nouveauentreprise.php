<?php

require_once('identifier.php');
include("./connection/connexiondb.php")

   // $requete_ent="select * from entreprise";
   // $resultat_ent=$pdo->query($requete_ent);

?>
<! DOCTYPE HTML>
<HTML>
    <head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    </head>
	
    <body>
       
        <?php require("menu.php"); ?>
        <div class="container">
                       
             <div class="panel panel-warning margetop60">
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"> <B>Les infos du nouveau entreprise :</B></div>
                <div class="panel-body">
                    <form method="post" action="insertentreprise.php" class="form"  enctype="multipart/form-data">
						
                        <div class="form-group">
                             <label for="Nom_livre"><B>Nom d'entreprise :</B></label>
                            <input type="text" name="Nom_ent" placeholder="Nom_ent" class="form-control"/>
                        </div>
                        <div class="form-group">
                             <label for="auteur"><B>categorie :</B></label>
                            <input type="text" name="categorie" placeholder="categorie" class="form-control"/>
                        </div>
						<div class="form-group">
                             <label for="auteur"><B>telephone :</B></label>
                            <input type="text" name="telephone" placeholder="telephone" class="form-control"/>
                        </div>
						<div class="form-group">
                             <label for="auteur"><B>email :</B></label>
                            <input type="text" name="email" placeholder="E-mail" class="form-control"/>
                        </div>
						<div class="form-group">
                             <label for="auteur"><B>etat :</B></label>
                            <input type="text" name="etat" placeholder="etat" class="form-control"/>
                        </div>
						<div class="form-group">
                             <label for="photo">Photo :</label>
                            <input type="file" name="photo" />
                        </div>
						
						
						
						
						
						
						
						
                      
                        

				        <button type="submit" class="btn btn-info" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;>
                            <span class="glyphicon glyphicon-save" style="color:b"></span>
                            <B>Enregistrer</B>
                        </button> 
                      
					</form>
                </div>
            </div>   
        </div>      
    </body>
</HTML>
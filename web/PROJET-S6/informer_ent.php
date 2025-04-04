<!DOCTYPE html>
<html>
<head>
	<title>Informer le client</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
</head>
<body>
<?php require("menu.php"); ?>
<div class="container">

<hr>
	<?php 
		if(isset($_POST['sendmail'])) {
			if(mail($_POST['email'],$_POST['subject'],$_POST['message'])) {
			echo"Email envoyer";
		}else{ 
				
				echo"Désolé, echec de l'envoi !";
			}
		}
	 ?>
	 
	 <div class="container" >
            <div class="panel panel-warning class margetop90 " >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" > <B><center>INFORMER L'entreprise</center> </B></div>
	 
	 
	<div class="row">
    <div class="col-md-9 col-md-offset-2">
        <form role="form" method="post" enctype="multipart/form-data">
        	<div class="row">
                <div class="col-sm-9 form-group">
                    <label for="email"><B>Email d'entreprise:</B></label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Entrez l'email de l'entreprise" maxlength="50">
                </div>
            </div>
			

            <div class="row">
                <div class="col-sm-9 form-group">
                    <label for="subject"><B>Objet:</B></label>
                    <input type="text" class="form-control" id="subject" name="subject" value="COMMANDE DEMANDé par le client" maxlength="50">
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-9 form-group">
                    <label for="name"><B>Message:</B></label>
                    <textarea class="form-control" type="textarea" id="message" name="message" placeholder="Your Message Here" maxlength="6000" rows="4">LA COMMANDE</textarea>
                </div>
            </div>
           
             <div class="row">
                <div class="col-sm-9 form-group">
                    // <button type="submit" name="sendmail" class="btn btn-lg btn-info btn-block">Envoi</button>
                </div>
            </div>
			</div>
			</div>
        </form>
	</div>
</div>
</body>
</html>

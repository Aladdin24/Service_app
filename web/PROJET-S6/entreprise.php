<?php

require_once('identifier.php');
  include("./connection/connexiondb.php");
 
    ?>
 
<!DOCTYPE HTML>
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
	
	<?php 
    $Nom_ent=isset($_GET['Nom_ent'])?$_GET['Nom_ent']:"";
    $id_entreprise=isset($_GET['id_entreprise'])?$_GET['id_entreprise']:0;
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
    
    $requete_ent="select id_entreprise, Nom_ent, Nom_categorie, telephone, email, etat, photo, Nom_categorie from entreprise as E, categorie as C
		where (C.id_categorie=E.id_categorie) 
		ORDER BY id_entreprise DESC limit $size offset $offset";
				
        
        $requete_ent_Count="select count(*) countE from entreprise
                where Nom_ent like '%$Nom_ent%' ";
   
   
        
		

    $result_ent= $pdo->query($requete_ent);
    
    $result_ent_Count= $pdo->query($requete_ent_Count);
	
	
	/*$tabCount ='';
	while($rows = mysqli_fetch_assoc($result_ent)){
                $tabCount = mysqli_num_rows($result_ent);
	}*/
	
	
	/* $resultatFiliere=$pdo->query($requeteFiliere);
    $resultatStagiaire=$pdo->query($requeteStagiaire);
    $resultatCount=$pdo->query($requeteCount);

    $tabCount=$resultatCount->fetch();
    $nbrStagiaire=$tabCount['countS'];
    $reste=$nbrStagiaire % $size;   
    if($reste===0) 
        $nbrPage=$nbrStagiaire/$size;   
    else
        $nbrPage=floor($nbrStagiaire/$size)+1;  */
	
	

    $tabCount=$result_ent_Count->fetch();
    $nbrEntreprise=$tabCount['countE'];
    $reste=$nbrEntreprise % $size;   
    if($reste===0) 
        $nbrPage=$nbrEntreprise/$size;   
    else
        $nbrPage=floor($nbrEntreprise/$size)+1;  
?>
       
        
        <div class="container" >
            <div class="panel panel-warning class margetop90 " >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" > <B>Rechercher des entreprises </B></div>
				
				<div class="panel-body" >
					<form method="get" action="entreprise.php" class="form-inline">
						<div class="form-group" >
						
                            <input type="text" name="Nom_ent" 
                                   placeholder="Nom de l'entreprise"
                                   class="form-control"
                                   value="<?php echo $Nom_ent ?>"/>
                        </div>
                           
				            
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"wa	Q></span>
                            Chercher...
                        </button> 
                        
                        &nbsp;&nbsp;
                         
                         
                            <a href="nouveauentreprise.php">
                            
                                <span class="glyphicon glyphicon-plus" ></span>
                                <B>Nouveau entreprise </B>
                                
                            </a>
                            
                         
					</form>
				</div>
			</div>
            
            <div class="panel panel-info class"  >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"> <B>Liste des entreprises </B> (<B><?php echo  $nbrEntreprise  ?> entreprises </B>)</div>
                <div class="panel-body" >
                    <table class="table table-striped table-bordered" >
                        <thead>
                            <tr>
                                <th>Id entreprise</th> <th>Nom de l'entreprise</th> <th>categorie</th> 
                                <th>Telephone</th> <th>email</th> 
                                	 <th>Etat</th>  <th>photo</th> 
                             
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php while($entreprise= $result_ent->fetch()){ ?>
                                <tr>
                                    <td><?php echo $entreprise['id_entreprise'] ?> </td>
                                    <td><?php echo $entreprise['Nom_ent'] ?> </td>
                                    <td><?php echo $entreprise['Nom_categorie'] ?> </td> 
                                    <td><?php echo $entreprise['telephone'] ?> </td>
									<td><?php echo $entreprise['email'] ?> </td>
								
									<td><?php echo $entreprise['etat'] ?> </td>
                                    <td>
                                        <img src="../images/<?php echo $entreprise['photo']?>"
                                        width="50px" height="50px" class="img-circle">
                                    </td>
                                   
                                   
									
								
								</tr>
                             <?php } ?>
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination">
                        <?php for($i=1;$i<=$nbrPage;$i++){ ?>
                            <li class="<?php if($i==$page) echo 'active' ?>"> 
            <a href="entreprise.php?page=<?php echo $i;?>&Nom_ent=<?php echo $Nom_ent ?>&id_entreprise=<?php echo $id_entreprise ?>">
                                    <?php echo $i; ?>
                                </a> 
                             </li>
                        <?php } ?>
                    </ul>
                </div>
                </div>
            </div>
        </div>
    </body>
</HTML>

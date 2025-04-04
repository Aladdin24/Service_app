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
    $Nom_client=isset($_GET['Nom_client'])?$_GET['Nom_client']:"";
    $tel_client=isset($_GET['tel_client'])?$_GET['tel_client']:0;
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
    
    $requete_clt="select username, tel_client, Nom_client, adresse_client, status_client from client ORDER BY username DESC 
	limit $size 
	offset $offset";
				
        
        $requete_clt_Count="select count(*) countCL from client
                where Nom_client like '%$Nom_client%' ";
   
   
        
		

    $result_clt= $pdo->query($requete_clt);
    
    $result_clt_Count= $pdo->query($requete_clt_Count);
	
	
	
	
	
	/* $resultatFiliere=$pdo->query($requeteFiliere);
    $resultatStagiaire=$pdo->query($requeteStagiaire);
    $resultatCount=$pdo->query($requeteCount);*/

    $tabCount=$result_clt_Count->fetch();
    $nbrClient=$tabCount['countCL'];
    $reste=$nbrClient % $size;   
    if($reste===0) 
        $nbrPage=$nbrClient/$size;   
    else
        $nbrPage=floor($nbrClient/$size)+1;  
	
	
?>
       
        
        <div class="container" >
            <div class="panel panel-warning class margetop60 "  >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Rechercher des clients</B></div>
				
				<div class="panel-body" >
					<form method="get" action="client.php" class="form-inline">
						<div class="form-group" >
						
                            <input type="text" name="Nom_client" 
                                   placeholder="Nom de client"
                                   class="form-control"
                                   value="<?php echo $Nom_client ?>"/>
                        </div>
                           
				            
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"wa	Q></span>
                            Chercher...
                        </button> 
                        
                        &nbsp;&nbsp;
                         
                        
					</form>
				</div>
			</div>
            
            <div class="panel panel-info class" color :red >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Liste des clients </B>(<B><?php echo $nbrClient ?> clients</B>)</div>
                <div class="panel-body" color :red>
                    <table class="table table-striped table-bordered" >
                        <thead>
                            <tr>
                                <th>telephone client</th> <th>Nom de client</th> <th>prenom</th> 
                                <th>Adresse</th> <th>status</th> 
                                	  
                             
                            </tr>
                        </thead>
                        
                        <tbody>
						
						
						
						
					  <?php while($client= $result_clt->fetch()){ ?>
                                <tr>
                                    <td><?php echo $client['tel_client'] ?> </td>
                                    <td><?php echo $client['Nom_client'] ?> </td>
                                    <td><?php echo $client['username'] ?> </td> 
                                    <td><?php echo $client['adresse_client'] ?> </td>
									<td><?php echo $client['status_client'] ?> </td>

       <?php }?>
					

			
						
                             
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination judtify-content-end">
                        <?php for($k=1;$k<=$nbrPage;$k++){ ?>
                            <li class="<?php if($k==$page) echo 'active' ?>"> 
            <a href="client.php?page=<?php echo $k;?>&Nom_client=<?php echo $Nom_client ?>&username=<?php echo $username ?>">
                                    <?php echo $k; ?>
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

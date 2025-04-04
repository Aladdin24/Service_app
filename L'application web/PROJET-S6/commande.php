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
	 <?php if ($_SESSION['users']['category']=='ADMIN') {?>
	<?php require("menu.php"); ?>
	
	<?php 
    $Nom_commande=isset($_GET['Nom_commande'])?$_GET['Nom_commande']:"";
    $id_commande=isset($_GET['id_commande'])?$_GET['id_commande']:0;
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
	
	
    
    $requete_cmd="select id_commande, Nom_commande, prix, delai, Nom_client, Nom_ent
	from commande as C, client as CL, entreprise as E 
	where ((CL.username = C.username) AND(E.id_entreprise = C.id_entreprise)) 
	ORDER BY id_commande DESC limit $size offset $offset";
				
        
        $requete_cmd_Count="select count(*) countC from commande
                where Nom_commande like '%$Nom_commande%' ";
   
   
        
    $result_cmd= $pdo->query($requete_cmd);
    
    $result_cmd_Count= $pdo->query($requete_cmd_Count);
	
	
	/*$tabCount_cmd ='';
	while($rows = mysqli_fetch_assoc($result_cmd)){
                $tabCount_cmd = mysqli_num_rows($result_cmd);
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
	
	

    $tabCount=$result_cmd_Count->fetch();
    $nbrCommandes=$tabCount['countC'];
    $reste=$nbrCommandes % $size;   
    if($reste===0) 
        $nbrPage=$nbrCommandes/$size;   
    else
        $nbrPage=floor($nbrCommandes/$size)+1;  
?>
       
        
        <div class="container" >
            <div class="panel panel-warning margetop60 " >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" ><B>Rechercher des commandes</B></div>
				
				<div class="panel-body" >
					<form method="get" action="commande.php" class="form-inline">
						<div class="form-group" >
						
                            <input type="text" name="Nom_commande" 
                                   placeholder="Nom de la commande"
                                   class="form-control"
                                   value="<?php echo $Nom_commande ?>"/>
                        </div>
                           
				            
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"wa	Q></span>
                            Chercher...
                        </button> 
                        
                        &nbsp;&nbsp;
                         
                         
                            
                         
					</form>
				</div>
			</div>
            
            <div class="panel panel-info class" panel-info class >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Liste des commandes (<?php echo $nbrCommandes ?> commandes</B>)</div>
                <div class="panel-body" >
                    <table class="table table-striped table-bordered" >
                        <thead>
                            <tr>
                                <th>Id commande</th> <th>Nom de la commande</th> 
                                <th>delai</th> <th>Nom client</th> 
                                	 <th>nom d'entreprise</th>  <th>DEMANDE ACCEPTER</th> <th>DEMANDE REFUSER </th>
                             
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php while($commande= $result_cmd->fetch()){ ?>
                                <tr>
                                    <td><?php echo $commande['id_commande'] ?> </td>
                                    <td><?php echo $commande['Nom_commande'] ?> </td>

                                    <td><?php echo $commande['delai'] ?> </td>
									<td><?php echo $commande['Nom_client'] ?> </td>
									<td><?php echo $commande['Nom_ent'] ?> </td>
                           <td>
                                            <a href="confirmer_client.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
									
									<td>
                                            <a href="Non_confirmer.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
								</tr>
                             <?php } ?>
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination">
                        <?php for($j=1;$j<=$nbrPage;$j++){ ?>
                            <li class="<?php if($j==$page) echo 'active' ?>"> 
            <a href="commande.php?page=<?php echo $j;?>&Nom_commande=<?php echo $Nom_commande ?>&id_commande=<?php echo $id_commande ?>">
                                    <?php echo $j; ?>
                                </a> 
                             </li>
                        <?php } ?>
                    </ul>
                </div>
                </div>
            </div>
        </div>
		<?php } ?>
		 <?php if ($_SESSION['users']['category']=='ELEC') {?>
		<?php require("menu1.php"); ?>
		
	<?php 
    $Nom_commande=isset($_GET['Nom_commande'])?$_GET['Nom_commande']:"";
    $id_commande=isset($_GET['id_commande'])?$_GET['id_commande']:0;
	$id_categorie=isset($_GET['id_categorie'])?$_GET['id_categorie']:0;
	$id_entreprise=isset($_GET['id_entreprise'])?$_GET['id_entreprise']:0;
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
	
	
    
    $requete_cmd="select id_commande, Nom_commande, prix, delai, Nom_client, tel_client
	from commande as C, client as CL, entreprise as E 
	where ((CL.username = C.username) AND(E.id_entreprise = C.id_entreprise) AND(C.id_entreprise=1)) 
	ORDER BY id_commande DESC limit $size offset $offset";
				
        
        $requete_cmd_Count="select count(*) countC from commande
                where id_entreprise=1 ";
   
   
        
    $result_cmd= $pdo->query($requete_cmd);
    
    $result_cmd_Count= $pdo->query($requete_cmd_Count);
	
	
	/*$tabCount_cmd ='';
	while($rows = mysqli_fetch_assoc($result_cmd)){
                $tabCount_cmd = mysqli_num_rows($result_cmd);
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
	
	

    $tabCount=$result_cmd_Count->fetch();
    $nbrCommandes=$tabCount['countC'];
    $reste=$nbrCommandes % $size;   
    if($reste===0) 
        $nbrPage=$nbrCommandes/$size;   
    else
        $nbrPage=floor($nbrCommandes/$size)+1;  
?>
       
        
        <div class="container" >
            <div class="panel panel-warning margetop60 " >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" ><B>Rechercher des commandes</B></div>
				
				<div class="panel-body" >
					<form method="get" action="commande.php" class="form-inline">
						<div class="form-group" >
						
                            <input type="text" name="Nom_commande" 
                                   placeholder="Nom de la commande"
                                   class="form-control"
                                   value="<?php echo $Nom_commande ?>"/>
                        </div>
                           
				            
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"wa	Q></span>
                            Chercher...
                        </button> 
                        
                        &nbsp;&nbsp;
                         
                         
                            
                         
					</form>
				</div>
			</div>
            
            <div class="panel panel-info class" panel-info class >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Liste des commandes (<?php echo $nbrCommandes ?> commandes</B>)</div>
                <div class="panel-body" >
                    <table class="table table-striped table-bordered" >
                        <thead>
                            <tr>
                                <th>Id commande</th> <th>Nom de la commande</th> 
                                <th>delai</th> <th>Nom client</th> 
                                	 <th>Telephone client</th>  <th>Confirmer</th> <th>Non confirmer </th>
                             
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php while($commande= $result_cmd->fetch()){ ?>
                                <tr>
                                    <td><?php echo $commande['id_commande'] ?> </td>
                                    <td><?php echo $commande['Nom_commande'] ?> </td>
                                   
                                    <td><?php echo $commande['delai'] ?> </td>
									<td><?php echo $commande['Nom_client'] ?> </td>
									<td><?php echo $commande['tel_client'] ?> </td>
                           <td>
                                            <a href="confirmer_client.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
									
									<td>
                                            <a href="Non_confirmer.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
								</tr>
                             <?php } ?>
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination">
                        <?php for($j=1;$j<=$nbrPage;$j++){ ?>
                            <li class="<?php if($j==$page) echo 'active' ?>"> 
            <a href="commande.php?page=<?php echo $j;?>&Nom_commande=<?php echo $Nom_commande ?>&id_commande=<?php echo $id_commande ?>">
                                    <?php echo $j; ?>
                                </a> 
                             </li>
                        <?php } ?>
                    </ul>
                </div>
                </div>
            </div>
        </div>
		
		<?php } ?>
		
		 <?php if ($_SESSION['users']['category']=='PLUMBER') {?>
		<?php require("menu2.php"); ?>
	<?php 
    $Nom_commande=isset($_GET['Nom_commande'])?$_GET['Nom_commande']:"";
    $id_commande=isset($_GET['id_commande'])?$_GET['id_commande']:0;
	$id_categorie=isset($_GET['id_categorie'])?$_GET['id_categorie']:0;
	$id_entreprise=isset($_GET['id_entreprise'])?$_GET['id_entreprise']:0;
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
	
	
    
    $requete_cmd="select id_commande, Nom_commande, prix, delai, Nom_client, tel_client
	from commande as C, client as CL, entreprise as E 
	where ((CL.username = C.username) AND(E.id_entreprise = C.id_entreprise) AND(C.id_entreprise=2)) 
	ORDER BY id_commande DESC limit $size offset $offset";
				
        
        $requete_cmd_Count="select count(*) countC from commande
                where id_entreprise=2 ";
   
   
        
    $result_cmd= $pdo->query($requete_cmd);
    
    $result_cmd_Count= $pdo->query($requete_cmd_Count);
	
	
	/*$tabCount_cmd ='';
	while($rows = mysqli_fetch_assoc($result_cmd)){
                $tabCount_cmd = mysqli_num_rows($result_cmd);
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
	
	

    $tabCount=$result_cmd_Count->fetch();
    $nbrCommandes=$tabCount['countC'];
    $reste=$nbrCommandes % $size;   
    if($reste===0) 
        $nbrPage=$nbrCommandes/$size;   
    else
        $nbrPage=floor($nbrCommandes/$size)+1;  
?>
       
        
        <div class="container" >
            <div class="panel panel-warning margetop60 " >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" ><B>Rechercher des commandes</B></div>
				
				<div class="panel-body" >
					<form method="get" action="commande.php" class="form-inline">
						<div class="form-group" >
						
                            <input type="text" name="Nom_commande" 
                                   placeholder="Nom de la commande"
                                   class="form-control"
                                   value="<?php echo $Nom_commande ?>"/>
                        </div>
                           
				            
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"wa	Q></span>
                            Chercher...
                        </button> 
                        
                        &nbsp;&nbsp;
                         
                         
                            
                         
					</form>
				</div>
			</div>
            
            <div class="panel panel-info class" panel-info class >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Liste des commandes (<?php echo $nbrCommandes ?> commandes</B>)</div>
                <div class="panel-body" >
                    <table class="table table-striped table-bordered" >
                        <thead>
                            <tr>
                                <th>Id commande</th> <th>Nom de la commande</th> 
                                <th>delai</th> <th>Nom client</th> 
                                	 <th>Telephone client</th>  <th>Confirmer</th> <th>Non confirmer </th>
                             
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php while($commande= $result_cmd->fetch()){ ?>
                                <tr>
                                    <td><?php echo $commande['id_commande'] ?> </td>
                                    <td><?php echo $commande['Nom_commande'] ?> </td>
                                    
                                    <td><?php echo $commande['delai'] ?> </td>
									<td><?php echo $commande['Nom_client'] ?> </td>
									<td><?php echo $commande['tel_client'] ?> </td>
                           <td>
                                            <a href="confirmer_client.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
									
									<td>
                                            <a href="Non_conformer.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
								</tr>
                             <?php } ?>
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination">
                        <?php for($j=1;$j<=$nbrPage;$j++){ ?>
                            <li class="<?php if($j==$page) echo 'active' ?>"> 
            <a href="commande.php?page=<?php echo $j;?>&Nom_commande=<?php echo $Nom_commande ?>&id_commande=<?php echo $id_commande ?>">
                                    <?php echo $j; ?>
                                </a> 
                             </li>
                        <?php } ?>
                    </ul>
                </div>
                </div>
            </div>
        </div>
		
		<?php } ?>
		
		 <?php if ($_SESSION['users']['category']=='PINTURE') {?>
		<?php require("menu3.php"); ?>
		<?php 
    $Nom_commande=isset($_GET['Nom_commande'])?$_GET['Nom_commande']:"";
    $id_commande=isset($_GET['id_commande'])?$_GET['id_commande']:0;
	$id_categorie=isset($_GET['id_categorie'])?$_GET['id_categorie']:0;
	$id_entreprise=isset($_GET['id_entreprise'])?$_GET['id_entreprise']:0;
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
	
	
    
    $requete_cmd="select id_commande, Nom_commande, prix, delai, Nom_client, tel_client
	from commande as C, client as CL, entreprise as E 
	where ((CL.username = C.username) AND(E.id_entreprise = C.id_entreprise) AND(C.id_entreprise=3)) 
	ORDER BY id_commande DESC limit $size offset $offset";
				
        
        $requete_cmd_Count="select count(*) countC from commande
                where id_entreprise=3 ";
   
   
        
    $result_cmd= $pdo->query($requete_cmd);
    
    $result_cmd_Count= $pdo->query($requete_cmd_Count);
	
	
	/*$tabCount_cmd ='';
	while($rows = mysqli_fetch_assoc($result_cmd)){
                $tabCount_cmd = mysqli_num_rows($result_cmd);
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
	
	

    $tabCount=$result_cmd_Count->fetch();
    $nbrCommandes=$tabCount['countC'];
    $reste=$nbrCommandes % $size;   
    if($reste===0) 
        $nbrPage=$nbrCommandes/$size;   
    else
        $nbrPage=floor($nbrCommandes/$size)+1;  
?>
       
        
        <div class="container" >
            <div class="panel panel-warning margetop60 " >
            
				<div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" ><B>Rechercher des commandes</B></div>
				
				<div class="panel-body" >
					<form method="get" action="commande.php" class="form-inline">
						<div class="form-group" >
						
                            <input type="text" name="Nom_commande" 
                                   placeholder="Nom de la commande"
                                   class="form-control"
                                   value="<?php echo $Nom_commande ?>"/>
                        </div>
                           
				            
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"wa	Q></span>
                            Chercher...
                        </button> 
                        
                        &nbsp;&nbsp;
                         
                         
                            
                         
					</form>
				</div>
			</div>
            
            <div class="panel panel-info class" panel-info class >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Liste des commandes (<?php echo $nbrCommandes ?> commandes</B>)</div>
                <div class="panel-body" >
                    <table class="table table-striped table-bordered" >
                        <thead>
                            <tr>
                                <th>Id commande</th> <th>Nom de la commande</th>  
                                <th>delai</th> <th>Nom client</th> 
                                	 <th>Telephone client</th>  <th>Confirmer</th> <th>Non confirmer </th>
                             
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php while($commande= $result_cmd->fetch()){ ?>
                                <tr>
                                    <td><?php echo $commande['id_commande'] ?> </td>
                                    <td><?php echo $commande['Nom_commande'] ?> </td>
                                    
                                    <td><?php echo $commande['delai'] ?> </td>
									<td><?php echo $commande['Nom_client'] ?> </td>
									<td><?php echo $commande['tel_client'] ?> </td>
                           <td>
                                            <a href="confirmer_client.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
									
									<td>
                                            <a href="Non_confirmer.php?id_commande=<?php echo $commande['id_commande'] ?>">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            &nbsp; 
									</td>
									
								</tr>
                             <?php } ?>
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination">
                        <?php for($j=1;$j<=$nbrPage;$j++){ ?>
                            <li class="<?php if($j==$page) echo 'active' ?>"> 
            <a href="commande.php?page=<?php echo $j;?>&Nom_commande=<?php echo $Nom_commande ?>&id_commande=<?php echo $id_commande ?>">
                                    <?php echo $j; ?>
                                </a> 
                             </li>
                        <?php } ?>
                    </ul>
                </div>
                </div>
            </div>
        </div>
		
		
			<?php } ?>
		
		
    </body>
</HTML>

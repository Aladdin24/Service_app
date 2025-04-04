<?php
    require_once('role.php');
    require_once("./connection/connexiondb.php");
    $login=isset($_GET['login'])?$_GET['login']:"";
    
    $size=isset($_GET['size'])?$_GET['size']:5;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $offset=($page-1)*$size;
   
    $requeteUser="select * from users where login like '%$login%'";
    $requeteCount="select count(*) countUser from users";
   
    $resultatUser=$pdo->query($requeteUser);
    $resultatCount=$pdo->query($requeteCount);

    $tabCount=$resultatCount->fetch();
    $nbrUser=$tabCount['countUser'];
    $reste=$nbrUser % $size;   
    if($reste===0) 
        $nbrPage=$nbrUser/$size;   
    else
        $nbrPage=floor($nbrUser/$size)+1;  
?>
<! DOCTYPE HTML>
<HTML>
    <head>
        <meta charset="utf-8">
        <title>Gestion des utilisateurs</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/monstyle.css">
    </head>
    <body>
        <?php include("menu.php"); ?>
        
        <div class="container">
		 <div class="panel panel-warning margetop60 " >
            <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;" ><B>Rechercher des utilisateurs</B></div>
			
				<div class="panel-body">
					<form method="get" action="utilisateurs.php" class="form-inline">
						<div class="form-group">
                            <input type="text" name="login" 
                                   placeholder="Login"
                                   class="form-control"
                                   value="<?php echo $login ?>"/>
                        </div>
				        <button type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-search"></span>
                            Chercher...
                        </button> 
					</form>
				</div>
			</div>
            
            <div class="panel panel-info">
                <div class="panel panel-info class" >
                <div class="panel-heading" style="z-index:-99 !important;font-size:32px;color:b;margin:0.8rem 0.6rem !important;"><B>Liste des utilisateurs (<?php echo $nbrUser ?> utilisateurs)</B></div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>login</th> <th>Email</th> <th>Category</th> 
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php while($users=$resultatUser->fetch()){ ?>
                                <tr class="<?php echo $users['etat']==1?'success':'danger'?>">
                                    <td><?php echo $users['login'] ?> </td>
                                    <td><?php echo $users['email'] ?> </td>
                                    <td><?php echo $users['category'] ?> </td>  
                                   <td>
                                       
                                        </td>       
                                </tr>
                             <?php } ?>
                        </tbody>
                    </table>
                <div>
                    <ul class="pagination">
                        <?php for($i=1;$i<=$nbrPage;$i++){ ?>
                            <li class="<?php if($i==$page) echo 'active' ?>"> 
            <a href="utilisateurs.php?page=<?php echo $i;?>&login=<?php echo $login ?>">
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
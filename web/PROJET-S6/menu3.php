


<?php
    require_once('identifier.php');
//439aCHEIKH15unC145liyo
  include("./connection/DB.php");
  include("./connection/connexiondb.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ETTEWVIGH</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <style>
        body {
             margin:0 !important;
             padding:0 !important;
             box-sizing: border-box;
             font-family: 'Roboto', sans-serif;
        }
		
        .round{
          width:20px;
          height:20px;
          border-radius:50%;
          position:relative;
          background:red;
          display:inline-block;
          padding:0.3rem 0.2rem !important;
          margin:0.3rem 0.2rem !important;
          left:-18px;
          top:10px;
          z-index: 99 !important;
        }
        .round > span {
          color:white;
          display:block;
          text-align:center;
          font-size:1rem !important;
          padding:0 !important;
        }
        #list{
         
          display: none;
          top: 33px;
          position: absolute;
          right: 2%;
          background:#ffffff;
  z-index:100 !important;
    width: 25vw;
    margin-left: -37px;
   
    padding:0 !important;
    margin:0 auto !important;
    
          
        }
        .message > span {
           width:100%;
           display:block;
           color:red;
           text-align:justify;
           margin:0.2rem 0.3rem !important;
           padding:0.3rem !important;
           line-height:1rem !important;
           font-weight:bold;
           border-bottom:1px solid white;
           font-size:1.8rem !important;

        }
        .message{
          /* background:#ff7f50;
          margin:0.3rem 0.2rem !important;
          padding:0.2rem 0 !important;
          width:100%;
          display:block; */
          
        }
        .message > .msg {
           width:90%;
           margin:0.2rem 0.3rem !important;
           padding:0.2rem 0.2rem !important;
           text-align:justify;
           font-weight:bold;
           display:block;
           word-wrap: break-word;
         
          
        }
		
	
    </style>
</head>

<body>




<?php
       $find_commande3 = "Select * from commande where prix <> 0 and id_entreprise=3";
       $result_co3 = mysqli_query($connection,$find_commande3);
       $count_active_co3 = '';
       $commande_data = array(); 
       $vala_db_pfe_dump = array();
        while($rows = mysqli_fetch_assoc($result_co3)){
                $count_active_co3 = mysqli_num_rows($result_co3);
                $commande_data[] = array(
                            "id_commande" => $rows['id_commande'],
                            "Nom_commande"=>$rows['Nom_commande'],
                            "delai"=>$rows['delai']
                );
        }
        //only five specific posts
        $vala_db_pfe3 = "Select * from commande where prix=1000 ORDER BY id_commande DESC LIMIT 0,5";
        $result_co3 = mysqli_query($connection,$vala_db_pfe3);
        while($rows = mysqli_fetch_assoc($result_co3)){
          $vala_db_pfe_dump[] = array(
                      "id_commande" => $rows['id_commande'],
                            "Nom_commande"=>$rows['Nom_commande'],
                            "delai"=>$rows['delai']
          );
        }

     ?>





	 
	 
	 

	 
	 
	 
	 <?php if ($_SESSION['users']['category']=='PINTURE') {?>
					
				
				
			
	
        <nav class="navbar bg-info">
		
	 <table class="table">
                        <thead>
                            <tr>
							
							
							
							<th>
				
				<div class="container-fluid">
                  <div class="navbar-header">
                    <a class="navbar-brand" href="commande.php" style="font-size:25px"><B><center>COMMANDES</center></B></a> 
                  </div>
                  <ul class="nav navbar-nav ">
                    <li><i class="fa fa-bell"   id="over" data-value ="<?php echo $count_active_co3;?>" style="z-index:-99 !important;font-size:25px;color:white;margin:0.8rem 0.6rem !important;"></i></li>
                    <?php if(!empty($count_active_co3)){?>
                    <div class="round" id="bell-count" data-value ="<?php echo $count_active_co3;?>"><span><?php echo $count_active_co3; ?></span></div>
                    <?php }?>
                     
                    <?php if(!empty($count_active_co3)){?>
                      <div id="list">
                       <?php
                          foreach($commande_data as $list_rows){?>
                            <li id="message_items">
                            <div class="message alert alert-warning" data-id=<?php echo $list_rows['id_commande'];?>>
                              <span><?php echo $list_rows['Nom_commande'];?></span>
                              <div class="msg">
                                <p><?php 
                                  echo $list_rows['delai'];
                                ?></p>
                              </div>
                            </div>
                            </li>
                         <?php }
                       ?> 
                       </div> 
                     <?php }else{?>
                        <!--old Messages-->
                        <div id="list">
                        <?php
                          foreach($vala_db_pfe_dump as $list_rows){?>
                            <li id="message_items">
                            <div class="message alert alert-danger" data-id=<?php echo $list_rows['id_commande'];?>>
                              <span><?php echo $list_rows['Nom_commande'];?></span>
                              <div class="msg">
                                <p><?php 
                                  echo $list_rows['delai'];
                                ?></p>
                              </div>
                            </div>
                            </li>
                         <?php }
                       ?>
                        <!--old Messages-->
                     
                     <?php } ?>
                     
                     </div>
                  </ul>
                 
                </div>
				</th>
							
							
							
							
                         <th>
				
				
  <div class="container-fluid">
    
   
    <ul class="nav navbar-nav navbar-right">
      <li><a href="seDeconnecter.php"><span class="glyphicon glyphicon-user" style="font-size:25px"></span> Sign OUT</a></li>
     
    </ul>
  </div>
</th>
				
				
				
				
				
				
				
				
				</tr>
				</thead>
				</table>
			
              </nav>
           <?php }?>
    
</body>




<script>
$(document).ready(function(){
    var idco = new Array();
    $('#over').on('click',function(){
           $('#list').toggle();  
       });

   //Message with Ellipsis
   $('div.msg').each(function(){
       var ten =$(this).text().trim(" ").split(" ");
      if(ten.length > 12){
         var vala3 =  $(this).text().trim().substring(0, 65) + "…";
         $(this).text(vala3);
      }
     
}); 


    $("#bell-count").on('click',function(k){
        k.preventDefault();

        let belvalue2 = $('#bell-count').attr('data-value');
        
        if(belvalue2 == ''){
         
          console.log("inactive");
        }else{
          $(".round").css('display','none');
          $("#list").css('display','block');
          
          // $('.message').each(function(){
          // var i = $(this).attr("data-id");
          // ids.push(i);
          
          // });
          //Ajax
          $('.message').click(function(k){
            k.preventDefault();
              $.ajax({
                url:'./connection/vala3.php',
                type:'POST',
                data:{"id":$(this).attr('data-id')},
                success:function(data){
                 
                    console.log(data);
                    location.reload();
                }
            });
        });
     }
   });

  
});
</script>

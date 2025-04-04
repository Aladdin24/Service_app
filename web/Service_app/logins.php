<?php

$db = mysqli_connect('localhost','root','','db_pfe');
if (!$db) {
 echo "Database connection faild";
}

if ($_SERVER['REQUEST_METHOD'] == "POST"){

  $username = $_POST['username'];
  $pwd = $_POST['pwd'];
  $id_client = $_POST['id_client'];
  $token = $_POST['token'];
$Nom_client = $_POST['Nom_client'];
$prenome_client = $_POST['prenome_client'];
$adresse_client = $_POST['adresse_client'];
$tel_clinet = $_POST['tel_clinet'];
  

  $stmt = $con->prepare("SELCT * FROM client WHERE username = ? and password = ?");
  $stmt->execute(array($username , $pwd));

  $user = $stmt->fetch();

   $row = $stmt->rowcount() ;

   if ($row > 0) {
       $id  = $user['username'] ;
       $stmt2 = $con->prepare("UPDATE client SET token = ? WHERE username = ? ") ;
       $stmt2->execute(array($token , $id )) ;

       $username = $user['username'];
       $pwd = $user['pwd'];
       echo json_encode(array('id' => $id , 'username' => $username , 'password' => $pwd , 'status_client' => "active"));
     }else {
        echo json_encode (array('status_client' => "faild" , 'username' => $username , 'password' => $pwd));
}
}
<?php
$connect = new mysqli("localhost","root","","db_pfe");

if($connect) {

}else{
      echo "Connection Failed";
      exit();
}
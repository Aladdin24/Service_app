﻿<?php
try {

    $pdo = new PDO("mysql:host=localhost;dbname=db_pfe",
        "root", "");

}catch (Exception $e){
    die('Erreur : ' . $e->getMessage());

    //die('Erreur : impossible de se connecter à la base de donnée');
}
?>


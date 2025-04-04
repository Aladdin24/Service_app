<?php
session_start();

if (!isset($_SESSION['users'])) {
    header('location:login.php');
    exit();
} else {
    if ($_SESSION['users']['category'] != 'ADMIN') {
        header('location:seDeconnecter.php');
        exit();
    }
}

?>

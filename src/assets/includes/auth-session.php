<?php
    session_start();
    if(!isset($_SESSION["username"])) {
        header("Location: auth-signin.html");
        exit();
    }
?>
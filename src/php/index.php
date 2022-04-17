<?php 

session_start();

if ( isset($_SESSION['sid']) && ($_SESSION['sid'] != '') ) {   
    header('location: ./index.html');
}else{
    // header('location: ./../auth-signin.html');
    header('location: ../auth-signin.html');
}
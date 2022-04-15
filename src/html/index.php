<?php 

session_start();

if ( isset($_SESSION['sid']) && ($_SESSION['sid'] != '') ) {   
    // redirect to welcome page
    header('location: ./user-profile.html');
}else{
    // redirect to login page
    header('location: ./auth-signin.html');
}
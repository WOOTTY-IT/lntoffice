<?php 

<<<<<<< Updated upstream
if ( isset($_SESSION['user_session']) ) {   
=======
session_start();

if ( isset($_SESSION['sid']) && ($_SESSION['sid'] != '') ) {   
>>>>>>> Stashed changes
    header('location: ./index.html');
}else{
    header('location: ./auth-signin.html');
}
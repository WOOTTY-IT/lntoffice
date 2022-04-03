<?php 

if ( isset($_SESSION['user_session']) ) {   
    header('location: ./index.html');
}else{
    header('location: ./auth-signin.html');
}
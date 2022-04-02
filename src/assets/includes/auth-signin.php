<?php

require('config.inc.php');
require('condb.php');

session_start();

// if ( $_SERVER["REQUEST_METHOD"] == "POST" ) {
if ( ! empty($_POST) ) {
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Getting submitted user data from database
        if ($db->connect_errno) {  
            printf("Connect failed: %s\n", $db->connect_error);  
            exit();  
        }  

        $stmt = $db->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->bind_param('s', $_POST['username']);
        $stmt->execute();
        // echo "auth-signin.php database->execute\n";
        $result = $stmt->get_result();
    	$user = $result->fetch_object();
        $password_hash = password_hash($user->password, PASSWORD_DEFAULT);
    	// Verify user password and set $_SESSION
    	if ( password_verify( $_POST['password'], $password_hash ) ) {
            /*echo ("password hash: ");
            echo ($password_hash);
            echo ("\n");*/
    		$_SESSION['user_id'] = $user->cid;
            echo $_SESSION['user_session'] = session_regenerate_id();
            // echo "index.php";
            // return;
    	}
    // echo "password not match!!!\n";
    }  
}

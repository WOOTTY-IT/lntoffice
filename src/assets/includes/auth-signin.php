<?php
// Always start this first
session_start();

if ( ! empty( $_POST ) ) {
	print_r($_POST);
    	echo ("username:" . $_POST['username'] );
    	echo ("password:" . $_POST['password'] );
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Getting submitted user data from database
        $conn = new mysqli($gaSql['server'], $gaSql['user'], $gaSql['password'], $gaSql['db']);
        $stmt = $conn->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->bind_param('s', $_POST['username']);
        $stmt->execute();
        $result = $stmt->get_result();
    	$user = $result->fetch_object();
    		
    	// Verify user password and set $_SESSION
    	if ( password_verify( $_POST['password'], $user->password ) ) {
    		$_SESSION['user_id'] = $user->cid;
    	}

    }  
}

    	// var_dump($_POST);
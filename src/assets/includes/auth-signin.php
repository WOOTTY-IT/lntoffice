<?php

require('config.inc.php');
require('condb.php');

// Initialize the session
session_start();
 

/*$_POST['username'] = "p3";
$_POST['password'] = "p3";*/

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    // Validate credentials
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Prepare a select statement
        $sql = "SELECT * FROM users WHERE username = ?";
        $stmt = $db->prepare($sql);
        $stmt->bind_param('s', $_POST['username']);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_object();
        // Verify user password and set $_SESSION
        if ( password_verify( $_POST['password'], $user->password ) ) {
            $_SESSION = (array) $user + array('isLogin' => true, 'sid' => session_id());
             print_r(json_encode($_SESSION));
        }else{
            $_SESSION = array('isLogin' => false, 'sid' => null);
            print_r(json_encode($_SESSION));
        }
    }
    $stmt->close();
    $result->close();
    $db->close();
}
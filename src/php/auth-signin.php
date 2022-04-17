<?php
require_once('includes/config.inc.php');
require_once('includes/condb.php');
session_start();
// Processing form data when form is submitted
if(strtoupper($_SERVER["REQUEST_METHOD"]) == "POST"){
    // Validate credentials
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Prepare a select statement
        $sql = "SELECT * FROM users WHERE username = ?";
        $stmt = $db->prepare($sql);
        $stmt->bind_param('s', $_POST['username']);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_object();
        // Verify user password
        if (password_verify($_POST['password'], $user->password)) {
            $_SESSION = (array) $user + array('isLogin' => true, 'sid' => session_id(), 'redirect_path' => 'index.html');
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
<?php 
require_once('config.inc.php');
require_once('condb.php');
session_start();

if(strtoupper($_SERVER["REQUEST_METHOD"]) == "POST"){

	$sql = "SELECT `cid`, `username` FROM users WHERE cid = ? OR username = ?";
	
	$stmt = $db->prepare( $sql );
    $stmt -> bind_param("ss", $cid, $username);

    $cid = trim($_POST['cid']);
	$username = trim($_POST['username']);
	$password = trim($_POST['password']);

	//Executing the statement
	if ($stmt->execute()) {
		//Retrieving the result
		$result = $stmt->get_result();
		$rows = $result->num_rows;
		// print_r($rows);
		if ($rows == 0) {
			// no user found
			$sql = "INSERT INTO `users`(`cid`,`full_name`, `username`,`password`, `account_type`) VALUES(?,?,?,?,?)";
			$stmt = $db->prepare($sql);
			$stmt->bind_param("sssss", $cid, $full_name, $username, $password_hash, $account_type);
			$full_name = 'mr.john  doe';
			$password_hash = password_hash($password, PASSWORD_DEFAULT);
			$account_type = 'user';
			if ($stmt->execute()) {
				// register success
				$_SESSION = array('status' => 'success', 'isRegistered' => true, 'redirect_path' => 'auth-signin.html');
				print_r(json_encode($_SESSION));
			}else{
				// register fail
				$_SESSION = array('status' => 'fail', 'isRegistered' => false, 'redirect_path' => '#!');
				print_r(json_encode($_SESSION));
			}

		}else{
			// duplicate user
			$_SESSION = array('status' => 'duplicate', 'isRegistered' => false, 'redirect_path' => '#!');
			print_r(json_encode($_SESSION));
		}

	}
	
	//Closing the statement
	$stmt->close();

	//Closing the connection
	$db->close();

}  
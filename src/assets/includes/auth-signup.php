<?php 
require (condb.php);

if(isset($_POST['btn-submit'])) {
	$username = trim($_POST['username']);
	$password = trim($_POST['password']);
    $cid = trim($_POST['cid']);

	$sql = "SELECT cid, username, password, fullname FROM user WHERE username=?";
	
	$stmt = $conn->prepare( $sql );
    $stmt -> bind_param("ss", $cid);

	//Executing the statement
	$stmt->execute();

	//Retrieving the result
	$result = $stmt->get_result();

	//Fetching all the rows as arrays
	while($obj = $result->fetch_assoc()){	
	   print("Name: ".$obj["Name"]."\n");
	   print("Age: ".$obj["Age"]."\n");
	}

	//Closing the statement
	$stmt->close();

	//Closing the connection
	$con->close();

}
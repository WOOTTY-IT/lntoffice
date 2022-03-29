<?php

  $db = new mysqli($gaSql['server'], $gaSql['username'],$gaSql['password'],$gaSql['database']); 
/* check connection */
if ($db->connect_errno) {  
    printf("Connect failed: %s\n", $db->connect_error);  
    exit();  
}  
if(!$db->set_charset("utf8")) {  
    printf("Error loading character set utf8: %s\n", $db->error);  
    exit();  
}
?>
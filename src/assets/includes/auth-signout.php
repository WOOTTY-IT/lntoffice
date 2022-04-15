<?php 
session_start();
session_destroy();
header("Location:  /lntoffice/dist/index.php");
<?php
	$constants_file="../includes/constants.php";
	if(!file_exists($constants_file))
		$constants_file="../../includes/constants.php";
	require_once $constants_file;
	
	
	session_start();
	
	/**
	 * This file is used to store all SESSION information including memberId
	**/
	$database=new PDO("mysql:host=". DATABASE_HOST .";port=". DATABASE_PORT .";dbname=" . DATABASE_NAME,DATABASE_USERNAME,DATABASE_PASSWORD);	
	$__USER=null;

	if(isset($_SESSION["user_id"]) && trim($_SESSION["user_id"])!=""){
		$sql="SELECT * FROM login WHERE id={$_SESSION["user_id"]}";
		$result_set=$database->query($sql);
		if($result_set!==false){
			$__USER=$result_set->fetch(PDO::FETCH_ASSOC);
		}
	}	

	function checkLogin(){
		global $__USER;
		if(!isset($_SESSION["user_id"])){
			header('Location:login.php');
		}
	}
?>
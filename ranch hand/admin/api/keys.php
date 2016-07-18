<?php
	require_once "../../includes/constants.php";
	require_once "../includes/session.php";
	

	
	if(isset($_GET["action"]) && function_exists($_GET["action"])){
		$_GET["action"]();
		echo json_encode($_OUTPUT);
		exit;
	}else{
		header("Status:403 Invalid Access format or Protocol.");
		exit;
	}
	
	/**
			Global Variables for this file.
	*/
	$_OUTPUT["success"]=false;
	$_OUTPUT["message"]="Nothing Processed on Server.";
	
		
	function getAll(){
		global $_OUTPUT;
		$db=new PDO(DATABASE_CONNECTION_STRING, DATABASE_USERNAME, DATABASE_PASSWORD);

		$sql="SELECT * FROM api_keys WHERE status=0";
		if(isset($_POST["searchKey"]) && trim($_POST["searchKey"])!=""){
			$sql .= " AND (`full_name` LIKE '{$_POST["searchKey"]}%}' OR `email_address` LIKE '%{$_POST["searchKey"]}%')";
		}
		$sql .= " ORDER BY created_at DESC";
		$_OUTPUT["sql"]=$sql;
		$result_set=$db->query($sql);
		if($result_set!==false){
			$rows=$result_set->fetchAll(PDO::FETCH_ASSOC);
			$_OUTPUT["total_records"]=count($rows);
			$_OUTPUT["data"]=$rows;
			$_OUTPUT["success"]=true;
			$_OUTPUT["message"]="Keys Fetched!";
		}else{
			$_OUTPUT["success"]=false;
			$_OUTPUT["message"]="Error while fetching keys.";
		}
	}
	
	function delete(){
		global $_OUTPUT;
		$db=new PDO(DATABASE_CONNECTION_STRING, DATABASE_USERNAME, DATABASE_PASSWORD);
		$sql="UPDATE api_keys SET status=1 WHERE id={$_POST["key_id"]}";
		$result=$db->query($sql);
		if($result!==false){
			$_OUTPUT["success"]=true;
			$_OUTPUT["message"]="Key has been deleted successfully!";
		}else{
			$_OUTPUT["success"]=false;
			$_OUTPUT["message"]="Error while deleting the selected Key. Please try again.";
		}
	}
	
	function create(){
		global $_OUTPUT;
		global $__USER;
		$db=new PDO(DATABASE_CONNECTION_STRING, DATABASE_USERNAME, DATABASE_PASSWORD);
		$key=generateKey();
		$sql="INSERT INTO api_keys(
			`key`,
			full_name,
			email_address,
			telephone,
			created_at,
			created_by
		)VALUES(
			'{$key}',
			'{$_POST["full_name"]}',
			'{$_POST["email"]}',
			'{$_POST["telephone"]}',
			NOW(),
			'{$__USER["id"]}'
		)";
		$result=$db->query($sql);
		$_OUTPUT["sql"]=$sql;
		if($result!==false){
			$_OUTPUT["success"]=true;
			$_OUTPUT["message"]="API Key has been created. Please note the Key for accessing Our HTTP API. <strong>{$key}</strong>";
		}else{
			$_OUTPUT["success"]=false;
			$_OUTPUT["message"]="Error while creating Key. Please try again later.";
		}
	}
	
	function generateKey(){
		$chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		$max=strlen($chars);
		$length=20;
		$op="";
		do{
			for($i=0;$i<$length;$i++)
				$op .= substr($chars,rand(0,$max),1);			
		}while(isKeyExists($op));
		return $op;
	}
	
	function isKeyExists($key){
		$db=new PDO(DATABASE_CONNECTION_STRING, DATABASE_USERNAME, DATABASE_PASSWORD);
		$sql="SELECT * FROM api_keys WHERE `key`='{$key}'";
		$result=$db->query($sql);
		if($result!==false){
			return ($result->fetch(PDO::FETCH_ASSOC)!==false);
		}
		return false;
	}
	
	//echo "GENERATING ..<br />";
//	echo generateKey();

?>
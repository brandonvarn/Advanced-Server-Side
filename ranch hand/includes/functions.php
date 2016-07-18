<?php
	/**
		@author 	: Brandon Varn
		@description: This file contains general methods(functions).
		@version 	: 1.0
	*/

	require_once "constants.php";
	//require_once "database.php";

	/**
		@description: Check whether API key provided in Request exists.
		@param: $key= API key found in the Request
		@return: Return true if given API key exist on Database. False, otherwise.
	*/


	// DEFINING DATABASE (NO TIME TO CREATE CLASS :(.)
	try{
		$database=new PDO("mysql:host=" . DATABASE_HOST . ";dbname=" . DATABASE_NAME . ";port=" . DATABASE_PORT,DATABASE_USERNAME,DATABASE_PASSWORD);
	}catch(PDOException $x){
		echo $x->getMessage();
	}


	function isAPIKeyExists($key){
		global $database;

		$sql="SELECT * FROM api_keys WHERE `key`='{$key}'";
		//echo $sql;
		$result_set=$database->query($sql);
		if($result_set!==false){
			$rows=$result_set->fetchAll();
			//echo "API Exists";
			return $rows[0]["id"];
		}
		//echo "API Not Found";
		return false;
	}

	/**
		@description: Logging the API call in Database.
		@param: $user_id= API Key ID takn from Database.
		@param: $api=API call that have been requested. (For now it is always 'items')
		@return: Return true if successfully logged. False, otherwise.
	*/
	function logAPICall($user_id,$api){
		global $database;

		$api_key=getKeyFromID($user_id);
		$sql="";
		$currentLogRecord=isLogRecordExists($user_id,$api);
		if($currentLogRecord!==false)
			$sql="UPDATE api_call_log SET no_of_calls=(no_of_calls+1) WHERE `api`='{$api}' AND `api_key_id`='{$user_id}' AND `date`='". date('Y-m-d') ."'";
		else
			$sql="INSERT INTO api_call_log(`date`,api_key_id,api,no_of_calls,last_call_at)VALUES('". date("Y-m-d") ."','{$user_id}','{$api}','1',NOW())";

		$result_set=$database->query($sql);
		return $result_set!==false;
	}

	/**
		@description: Get User ID/API Key ID from Database for the given API key. Usually used to double check the Request.
		@param: $key= API key found in the Request
		@return: Return API key for the given User ID/API Key ID. False, otherwise.
	*/
	function getKeyFromID($key){
		global $database;
		$sql="SELECT `key` FROM api_keys WHERE id='$key'";
		$result_set=$database->query($sql);
		if($result_set!==false){
			$rows=$result_set->fetchAll();
			if(count($rows)>0)
				return $rows[0]["key"];
		}
		return false;
	}

	/**
		@description: Check whether Log record for the given API user, API method is exists for the particular day(today).
		@param: $user_id: User ID/API Key ID which initiated the Request.
		@param: $api: API method called (alway 'items' for now)
		@return: Return true if exists. False, otherwise.
	*/
	function isLogRecordExists($user_id,$api){
		global $database;
		$sql="SELECT * FROM api_call_log WHERE `api`='{$api}' AND `api_key_id`='{$user_id}' AND `date`='". date('Y-m-d') ."'";
		$result_set=$database->query($sql);
		if($result_set!==false){
			$rows=$result_set->fetchAll();
			if(count($rows)>0)
				return true;
		}
		return false;
	}
?>
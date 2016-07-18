<?php
	/**
		@author 	: Brandon Varn
		@description: Basic file or Base file to all API calls from users.
		@version 	: 1.0
	*/

	/************************************
			Including the required
			PHP files and libraries
	//**********************************/
	require_once "includes/constants.php";

	require_once "includes/functions.php";
	require_once "includes/class/items.php";


	// API KEY assigned to the User.
	$_API_KEY=$_GET["key"];

	// These are Output Data to return to User 
	// in JSON format
	$_OUTPUT["success"]=false;
	$_OUTPUT["error"]="";


	// Getting User ID of the given API Key
	$APIKeyUser=isAPIKeyExists($_API_KEY);

	// If User not exists, Just return User with error message. 
	// No Further action is required.
	if($APIKeyUser===false){
		$_OUTPUT["success"]=false;
		$_OUTPUT["error"]= API_ERROR_INVALID_KEY;
		goto __EXIT__;
	}

	// CONTINUE IF USER EXISTS

	// Get Result for the called API method.
	$items=new Items($_GET);
	$output=$items->output();

	// If any error happens with the getting items from DB 
	// $output will return 'false'. 
	if($output!==false){
		$_OUTPUT["success"]=true;
		//Removing Error component from output to avoid confusion to user.
		unset($_OUTPUT["error"]);
		// $output is the actual data returned from called API method.
		$_OUTPUT["data"]=$output;

		//Logging API call for future reference and statistics
		logAPICall($APIKeyUser,"items");
	}else{
		$_OUTPUT["success"]=false;
		$_OUTPUT["error"]=API_ERROR_INVALID_CALL;
	}

	__EXIT__:
	header("Content-type:text/json; charset=utf-8");
	echo json_encode($_OUTPUT);
?>
<?php
	/**
		@author 	: Brandon Varn
		@description: This file contains the constants used in the project. 
		@version 	: 1.0
	*/

	// API ERROR MESSAGES
	defined("API_ERROR_INVALID_KEY")
		?null
		:define("API_ERROR_INVALID_KEY","Invalid API key.");


	defined("API_ERROR_INVALID_CALL")
		?null
		:define("API_ERROR_INVALID_CALL","Invalid Call or Data.");



	// DATABASE CONNECTION SETTINGS
	defined("DATABASE_HOST")
		?null
		:define("DATABASE_HOST","localhost");

	defined("DATABASE_USERNAME")
		?null
		:define("DATABASE_USERNAME","ranchhand.api");
	
	defined("DATABASE_PASSWORD")
		?null
		:define("DATABASE_PASSWORD","ranchhand.api");
	
	defined("DATABASE_NAME")
		?null
		:define("DATABASE_NAME","ranchhand.api");
	
	defined("DATABASE_PORT")
		?null
		:define("DATABASE_PORT","8889");
	defined("DATABASE_CONNECTION_STRING")
		?null
		:define("DATABASE_CONNECTION_STRING","mysql:host=". DATABASE_HOST .";port=". DATABASE_PORT .";dbname=" . DATABASE_NAME);


?>
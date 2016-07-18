<?php
	/**
		@author 	: Brandon Varn
		@description: This is Template file. In particular this file has class to call 'Items'.
		@version 	: 1.0
	*/
	class Items{

		/** 
		@description: Search Criteria. one of the following
				• Part Number (partNumber)
				• UPC Code (upc)
				• Model (model)
		*/
		private $_COLUMN="";

		/** 
		@description: Search method. One of the following
				• exactly 		-- return only if the exact match found for the given keyword
				• contains		-- return if criteria value contains the given keyword
				• startsWith	-- return if criteria value starts with the given keyword
				• endsWidth		-- return if criteria value ends with the given keyword
		*/
		private $_MODE="";

		/** 
		@description: Search Keyword 
		*/
		private $_KEYWORD="";


		
		private $db;

		function __construct($options){
			$this->_COLUMN=$options["column"];
			$this->_MODE=$options["mode"];
			$this->_KEYWORD=$options["search"];
			$this->db=new PDO("mysql:host=" . DATABASE_HOST . ";dbname=" . DATABASE_NAME . ";port=" . DATABASE_PORT,DATABASE_USERNAME,DATABASE_PASSWORD);
		}
		function __destruct(){
			$this->db=null;
		}

		public function output(){
			$sql="SELECT  
			categories.name AS `Category`,
			products.make,
			products.year,
			products.model,
			products.description,
			products.part_number,
			products.net_weight,
			products.gross_weight,
			products.length,
			products.width,
			products.height,
			products.tow_hooks,
			products.factory_receiver,
			products.fog_lights,
			products.upc_code
			FROM products 
			LEFT JOIN categories ON categories.id=products.category_id
			WHERE products." . $this->columnName() . $this->operator();
			$data=array();
			
			// $result_set=$this->database->query($sql);
			// if($result_set!==false){
			// 	while($row=$this->database->fetch_assoc($result_set)){
			// 		$data[]=$row;
			// 	}
			// 	return $data;
			// }
			$result_set=$this->db->query($sql);
			$rows=$result_set->fetchAll();
			if($result_set!==false){
				foreach($rows as $row){
					$data[]=$row;
				}	
				return $data;
			}
			return false;
		}

		/**
			@description: Return Column Name in Database for the given criteria.
		*/
		private function columnName(){
			switch ($this->_COLUMN) {
				case 'partNumber':
					return "part_number";
				case 'model':
					return "model";
				case 'upc':
					return "upc_code";
			}
		}

		/**
			@description: Return the actual Database Operator depends on the given search method.
		*/
		private function operator(){
			switch($this->_MODE){
				case 'exactly':
					return " ='{$this->_KEYWORD}'";
				case 'contains':
					return " LIKE '%{$this->_KEYWORD}%'";
				case 'startsWith':
					return " LIKE '%{$this->_KEYWORD}'";
				case 'endsWidth':
					return " LIKE '{$this->_KEYWORD}%'";
			}
		}

	}
?>
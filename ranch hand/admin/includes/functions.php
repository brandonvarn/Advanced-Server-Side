<?php
	require_once "database.php";
	
	function get_last_pin(){
		global $database;
		$sql="SELECT * FROM pins ORDER BY created_at DESC limit 1";
		$result_set=$database->query($sql);
		if($result_set!==false && $database->num_rows($result_set)>0){
			$row=$database->fetch_array($result_set);
			return $row["pin"];
		}
		return 0;
	}
?>
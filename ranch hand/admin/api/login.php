<?php
	require_once "../../includes/constants.php";
	require_once "../includes/session.php";
	
	$output["success"]=false;
	$output["message"]="Nothing Processed";
	$database=new PDO("mysql:host=". DATABASE_HOST .";port=". DATABASE_PORT .";dbname=" . DATABASE_NAME,DATABASE_USERNAME,DATABASE_PASSWORD);	
	$sql="SELECT * FROM login WHERE username='{$_POST["username"]}' AND password=MD5('{$_POST["password"]}')";
	$result_set=$database->query($sql);
	
	if($result_set!==false){
		$rows=$result_set->fetchAll(PDO::FETCH_ASSOC);
		if(count($rows)>0){
			$row=$rows[0];
			$_SESSION["user_id"]=$row["id"];
			$_SESSION["user_name"]=$row["name"];
			$_SESSION["user_username"]=$row["username"];
			$output["success"]=true;
			$output["message"]="Logging in as {$row["name"]}";
		}else{
			$output["success"]=false;
			$output["message"]="Invalid Username/Password";			
		}
	}else{
		$output["success"]=false;
		$output["message"]="Invalid Username/Password";
	}
	
	echo json_encode($output);
?>
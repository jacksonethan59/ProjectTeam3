<html>
<head>
	<title>Data Generator</title>
	<link rel ="stylesheet" type="text/css" href="sample.css">
</head>

<body>
<?php
function get_array_data($fileName)
{
	$handle = fopen($fileName,"r");
	while(!feof($handle))
	{
		$value = fgets($handle);
		$value = str_replace(array("\n", "\r"), '', $value); 
        if(!feof($handle)) {
		$values[] = $value;	}	
	}
	fclose($handle);
	return $values;
}

function write_table($handle, $database, $table, $columns, $values) {
	fwrite($handle, "use $database;\n\n");
	fwrite($handle, "SET AUTOCOMMIT=0;\n\n");
	fwrite($handle, "INSERT INTO $database.$table (");
	for($i = 0; $i < sizeof($columns); $i++) {
                fwrite($handle, $columns[$i]);
                if($i!= sizeof($columns)-1) { 
                    fwrite($handle, ",");
                }
            }
	fwrite($handle, ") VALUES\n");
	for($i = 0; $i < count($values); $i++) {
                fwrite($handle, "(");
                for($j = 0; $j < sizeof($values[$i]); $j++) {
                    fwrite($handle, $values[$i][$j]);
                    if($j != sizeof($values[$i]) - 1) {
                       fwrite($handle, ","); 
                    }
                }
                if($i != sizeof($values)-1) { 
                    fwrite($handle, "),\n");
                } else {
                    fwrite($handle, ");\n\nCOMMIT;");
                }
	}
}
$students_columns = array("id", "first_name","last_name","major","required_hours");
$users_columns = array("user_id","password");



const NUM_STUDENTS = 100;

print("<h1>Generating SQL script</h1>");
        
print("...");


$firstNames = get_array_data("first_names.txt");
$lastNames = get_array_data("last_names.txt");
$majors = get_array_data("majors.txt");
$characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
$id = "";
$password = "";
$creditHoursNeeded = 120;
for($i = 0; $i < NUM_STUDENTS; $i++) {
			$firstName = $firstNames[rand(0, sizeof($firstNames)-1)];
			$lastName = $lastNames[rand(0, sizeof($lastNames)-1)];
			//$major = $majors[rand(0, sizeof($majors)-1)];
			$major = "CPSC";
			
			for($j = 0; $j < 3; $j++)
			{
			$id = $id . $characters[rand(0, strlen($characters) - 1)];
			}
			$id = $id . rand(100,999);
			
			while(strlen($password) < 10)
			{
			$password  = $password . $characters[rand(0, strlen($characters) - 1)];
			//print($passwordLetters);
			}
			
			$password = $password . rand(1000,9999);
			
			
			$students[$i][0] = "'".$id."'"; 
			$students[$i][1] = "'".$firstName."'"; 
			$students[$i][2] = "'".$lastName."'"; 
			$students[$i][3] = "'".$major."'";
			$students[$i][4] = "'".$creditHoursNeeded."'";
			$users[$i][0] = "'".$id."'";
			$users[$i][1] = "'".$password."'";
			
			$id = "";
			$password = "";
}




$handle = fopen("SchedMasterStudents.sql", "w");
write_table($handle, "schedmaster", "users", $users_columns, $users);
write_table($handle, "schedmaster", "students", $students_columns, $students);



fclose($handle);
          
    print("<h1>SQL script complete!</h1>");
	?>
</body>
</html>
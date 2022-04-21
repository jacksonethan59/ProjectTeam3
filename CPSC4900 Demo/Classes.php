<html>
<head>
	<title>Class Registration</title>
	<link rel ="stylesheet" type="text/css" href="sample.css">
</head>
<body>
	<img src = "logo.png" alt = "parts Image" />
	<h3>Hi Ethan!</h3>
	<p>Here is your recommended schedule for Fall 2022, tailored just for you by SchedMaster. </p>
	<p>Major: CPSC - Software Systems 			Minor: Criminal Justice </p>
	<?php
		
	
	print("<table border = '2'>");
    
	
	
	print("<table border = '2'><tr> <th> Title </th><th> Instructor </th><th> Meeting Times</th><th>Enrollement");
	print("</tr>");
	print("<tr><td>Computer Networks</td><td>Farah Kandah</td><td>ASYNC INTERNET</td><td>21 of 40</td></tr>");
	print("<tr><td>Media in the Criminal Justice System</td><td>Sara Knox</td><td>ASYNC INTERNET</td><td>33 of 40</td></tr>");
	print("<tr><td>Senior Capstone</td><td>TBD</td><td>TR: 1:40 PM - 2:55 PM </td><td>27 of 30</td></tr>");
	print("<tr><td>Data Structures</td><td>David Schwab</td><td>MWF: 12:50 PM - 1:05 PM </td><td>23 of 40</td></tr>");
	print("</table>");

	
		
	
	?>
</body>
<form action = "REG.html" method = "post" >
	<p><input type = "submit" value = "I'd Like To Register">
		<input type = "reset" value = "I'd Like To Make Adjustments"></p>
</form>
</html>

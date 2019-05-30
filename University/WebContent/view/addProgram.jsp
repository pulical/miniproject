<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>
<h2><center> Add Program</center></h2>
<div align="center">
<form action="addProgram">
		<table>
			<tr>
				<td>Enter Program Name</td>
				<td>:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>Enter Program Description</td>
				<td>:</td>
				<td><input type="text" name="description"></td>
			</tr>
			<tr>
				<td>Program Duration</td>
				<td>:</td>
				<td><input type="number" name="duration"></td>
			</tr>
			<tr>
				<td>Program Eligibility</td>
				<td>:</td>
				<td><input type="text" name="eligibility"></td>
			</tr>
			<tr>
				<td>Location</td>
				<td>:</td>
				<td><input type="text" name="location"></td>
			</tr>
			<tr>
				<td>Sessions Per Week</td>
				<td>:</td>
				<td><input type="number" name="sessions"></td>
			</tr>
			<tr>
				<td>Degree Certificate</td>
				<td>:</td>
				<td><input type="text" name="degree"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td><input type="submit" value="Add Program"></td>
			</tr>
		</table>
	</form>
	${description}
	</div>

<style>
body {font-family: Arial, sans-serif;
background-color:;
color:blue;}
* {box-sizing: border-box;
   }
   table{border-collapse:collapse;
  width:25%;} 
  td{text-align:left;
  padding:8px;
  background-color:#f2f2f2;}
  tr:nth-child(even){background-color:#f2f2f2;} 
   /* Header/logo Title */
.header {
  padding: 80px;
  text-align: right;
  background: url("image.jpg");
  background-size: 1500px 300px;
  color: brown;
}

/* Increase the font size of the heading */
.header h1 {
  font-size: 30px;
}

.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
}
h2,a{
margin-bottom:30px;}
</style>
</body>
</html>
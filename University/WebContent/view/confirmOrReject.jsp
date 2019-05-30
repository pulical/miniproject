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
<h2><center> Confirm/Reject</center></h2>
<div align="center">
	<form action="confirmOrReject">
		<table>
			<tr>
				<td>Enter Participant Application ID</td>
				<td>:</td>
				<td><input type="number" name="appID"></td>
			</tr>
			<tr>
				<td>Select Status</td>
				<td>:</td>
				<td><select name="appStatus">
						<option>Confirmed</option>
						<option>Rejected</option></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form>
	</div>
	${status}
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
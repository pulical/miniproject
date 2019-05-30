<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

${status}

<div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>

<div align="center">
<form method="post" action="accept" style="max-width:500px;margin:auto">
	<table>
	<tr>
		<td>Application Id</td>
		<td>:</td>
		<td><a><input type="number" required placeholder="applicant Id" name="applicationId"></a></td>
	</tr>
	<tr>
		<td>date of Interview</td>
		<td>:</td>
		<td><a><input type="date"  name="interview_Date"></a></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td><b><input type="submit" value="accept"></b></td>
	</tr>
 </table>
</form>
</div>

<style>
body {font-family: Arial, sans-serif;
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
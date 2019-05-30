<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="k"%>
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

<div align="center">
	<form action="detailedSchedule">
		Enter From Date:<input type="date" name="from"> Enter To Date:<input
			type="date" name="to"> <input type="submit" value="Schedule">
		<k:forEach items="${status}" var="detail">
			<table>
			<tr>
				<td><b>Scheduled Program ID:</b>${detail.scheduledProgramID}</td>
				<td><b>Program Name:</b>${detail.programName}</td>
				<td><b>Location:</b>${detail.location}</td>
				<td><b>Start Date:</b>${detail.startdate}</td>
				<td><b>End Date:</b>${detail.endDate}</td>
				<td><b>Sessions Per Week:</b>${detail.sessionsPerWeek}</td>
			</tr>
		</table>
		</k:forEach>
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
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
<div align="left">
<form method="post" action="">
	
<h2> Welcome Administrator</h2>
<ul>
  <li><a class="active" href="viewOfferedPrograms.jsp">Program Offered</a></li>
  <li><a href="viewScheduledPrograms.jsp">Program Scheduled</a></li>
  <li><a href="adminListofParticipants.jsp">List Of Participant</a></li>
  <li><a href="accepted.jsp">Accepted</a></li>
  <li><a href="rejected.jsp">Rejected</a></li>
  <li><a href="confirmed.jsp">Confirmed</a></li>
   <li><a href="settingRollNo.jsp">Setting RollNumber</a></li>
  <li><a href="fromTo.jsp">List Of Program To Be Commenced</a></li>

</ul>

  

</form>

<style >


li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

	ul {
  list-style-type: none;
  margin: 0;
  font-size:20px;
  padding: 0;
  width: 300px;
  background-color: #f1f1f1;
}
h2{color:brown;
text-align:center;
font-size:60px;
}

li a.active {
  background-color: #4CAF50;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
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
  text-align:top;
}

.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
</style>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.Servlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	${status}
	<body>
<div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>
<h2><center> </center></h2>
<div align="center">
	<form method="post" action="accept">

		<table align="center" >
			<tr>
				<td>Application_id</td>
				<td>full_name</td>
				<td>Scheduled_program_id</td>
				<td>date_of_birth</td>
				<td>highest_qualification</td>
				<td>marks_obtained</td>
				<td>email_id</td>
				<td>status</td>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/parallel";
					String username = "root";
					String password = "8688889375";
					String query = "select * from application where status='pending'";
					//Application application1 = new Application();
					Connection conn = DriverManager.getConnection(url, username, password);
					//PreparedStatement preparedStatement = conn.prepareStatement(query);
					//preparedStatement.setString(1,id);
					Statement statement = conn.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("applicationID")%></td>
				<td><%=rs.getString("fullName")%></td>
				<td><%=rs.getString("scheduledProgramID")%></td>
				<td><%=rs.getString("dateOfBirth")%></td>
				<td><%=rs.getString("highestQualification")%></td>
				<td><%=rs.getString("marksObtained")%></td>
				<td><%=rs.getString("emailID")%></td>
				<td><%=rs.getString("status")%></td>
				<%
					}
				%>

				<%
					rs.close();
						statement.close();
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			
		</table>
	</form>
	</div>
	<ul>
	
	<li><a href="comittee.jsp" class="active"> <i class="fa fa-fw fa-home"></i>Comitee Homepage</a></li>
	<li><a href="dummy1.jsp">reject</a></li>
	<li><a href="dummy.jsp">accept</a></li>
	</ul>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	<style>
body {font-family: Arial, sans-serif;
background-color:;
color:blue;}
* {box-sizing: border-box;
   }
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
  width: 200px;
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
   table{border-collapse:collapse;
  width:50%;} 
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="javax.persistence.TypedQuery" %>
<%@ page import="java.util.List" %>
<%@ page import="org.jsp.app.model.Application" %>

<div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>
<h2><center> </center></h2>
<div align="center">
	<form action="viewScheduledPrograms">
		<table >
			<tr>
				<td>Application ID</td>
				<td>Full Name</td>
				<td>Date Of Birth</td>
				<td>Email ID</td>
				<td>Highest Qualification</td>
				<td>Marks Obtained</td>
				<td>Goal</td>
				<td>Scheduled Program ID</td>
				<td>Status</td>
				<td>Date Of Interview</td>
			</tr>	
			<%
			EntityManagerFactory factory=Persistence.createEntityManagerFactory("University");
			EntityManager manager=factory.createEntityManager();
			manager.getTransaction().begin();
			TypedQuery<Application> query=manager.createQuery("select app from Application app where app.status='Accepted'", Application.class);
			List <Application>scheduled=query.getResultList();
			Application program;
			for(int index=0;index<scheduled.size();index++)
			{
				program=scheduled.get(index);
			%>
			<tr>
				<td><%= program.getApplicationID() %></td>
				<td><%= program.getFullName() %></td>
				<td><%= program.getDateOfBirth() %></td>
				<td><%= program.getEmailID() %></td>
				<td><%= program.getHighestQualification() %></td>
				<td><%= program.getMarksObtained() %></td>
				<td><%= program.getGoal() %></td>
				<td><%= program.getScheduledProgramID() %></td>
				<td><%= program.getStatus() %></td>
				<td><%= program.getDateOfInterview() %></td>
			</tr>
			<%
			}
			manager.getTransaction().commit();
			manager.close();
			%>
		</table>	
	</form>
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
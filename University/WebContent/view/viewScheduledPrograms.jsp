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
<%@ page import="org.jsp.app.model.ProgramsScheduled" %>

<div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>
<h2><center> </center></h2>
<div align="center">
	<form action="viewScheduledPrograms">
		<table >
			<tr>
				<td>Schedule ID</td>
				<td>Program Name</td>
				<td>Location</td>
				<td>Start Date</td>
				<td>End Date</td>
				<td>Sessions Per Week</td>
			</tr>	
			<%
			EntityManagerFactory factory=Persistence.createEntityManagerFactory("University");
			EntityManager manager=factory.createEntityManager();
			manager.getTransaction().begin();
			TypedQuery<ProgramsScheduled> query=manager.createQuery("select ref from ProgramsScheduled ref where ref.startdate !='N/A' ", ProgramsScheduled.class);
			List <ProgramsScheduled>scheduled=query.getResultList();
			ProgramsScheduled program;
			for(int index=0;index<scheduled.size();index++)
			{
				program=scheduled.get(index);
			%>
			<tr>
				<td><%= program.getScheduledProgramID() %></td>
				<td><%= program.getProgramName() %></td>
				<td><%= program.getLocation() %></td>
				<td><%= program.getStartdate() %></td>
				<td><%= program.getEndDate() %></td>
				<td><%= program.getSessionsPerWeek() %></td>
			</tr>
			<%
			}
			manager.getTransaction().commit();
			manager.close();
			 %>
		</table>	
	</form>
		<a href="scheduleProgram.jsp"><button>Schedule a Program</button></a>
	<a href="deleteScheduledProgram.jsp"><button>Delete Program</button></a>
	</div>
	<style>
body {font-family: Arial, sans-serif;
background-color:;
color:blue;}
* {box-sizing: border-box;
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
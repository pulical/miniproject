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
<%@ page import="org.jsp.app.model.ProgramsOffered" %>

<div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>
<h2><center> </center></h2>
<div align="center">
	<form action="viewOfferedPrograms">
		<table >
			<tr>
				<td>Program Name</td>
				<td>Description</td>
				<td>Eligibility</td>
				<td>Duration</td>
				<td>Degree Offered</td>
			</tr>	
			<%
			EntityManagerFactory factory=Persistence.createEntityManagerFactory("University");
			EntityManager manager=factory.createEntityManager();
			manager.getTransaction().begin();
			TypedQuery<ProgramsOffered> query=manager.createQuery("select offered from ProgramsOffered offered", ProgramsOffered.class);
			List <ProgramsOffered>offered=query.getResultList();
			ProgramsOffered program;
			for(int index=0;index<offered.size();index++)
			{
				program=offered.get(index);
			%>
			<tr>
				<td><%= program.getProgramName() %></td>
				<td><%=program.getDescription() %></td>
				<td><%= program.getApplicantEligibility() %></td>
				<td><%= program.getDuration() %></td>
				<td><%= program.getDegreeCertificateOffered() %></td>
			</tr>
			<%
			}
			manager.getTransaction().commit();
			manager.close();
			 %>
		</table>	
	</form>
	<a href="addProgram.jsp"><button>Add Program</button></a>
	<a href="deleteProgram.jsp"><button>Delete Program</button></a>
	<a href="updateEligibility.jsp"><button>Update Eligibility</button></a>
		<a href="updateDescription.jsp"><button>Update Description</button></a>
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
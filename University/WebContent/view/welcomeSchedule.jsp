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

	<form action="viewScheduledPrograms">
		<table border=1>
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
	<a href="ApplyOnlineForm.jsp"><input type="submit" value="register"></a>
</body>
</html>
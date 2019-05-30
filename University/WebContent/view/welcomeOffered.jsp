<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<form action="viewOfferedPrograms">
		<table border=1>
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
</body>
</html>
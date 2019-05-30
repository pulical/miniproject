<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.jsp.app.model.MethodsClass"%>
<%@page import="javax.servlet.Servlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	${status}
	<form method="post" action="accept">

		<table align="center" border="2">
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
					String query = "select * from application where status='Accepted'";
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
				<td><%=rs.getString("marksObtained")%></td>
				<td><%=rs.getString("emailID")%></td>
				<td><%=rs.getString("highestQualification")%></td>
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
	<a href="confirmOrReject.jsp"><button>Confirm OR reject</button></a>
	<br>
		<br>
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
out.println("Connection Failed");
            Statement stm=conn.createStatement();
			PreparedStatement ps=conn.prepareStatement("delete from profile");
			ps.executeUpdate();

%>
<%
		response.sendRedirect("login.html");
%>
</body>
</html>
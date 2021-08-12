<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Paitient Login</title>
</head>
<body>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
	if(conn==null)
	out.println("Connection Failed");
				String sql2="insert into profile values(?,?)";	
                String sql="select count(p_id) from patient where username=? and password=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1,username);
				ps.setString(2,password);
				ResultSet rset=ps.executeQuery();
                if(rset.next())
				{
					if(rset.getInt(1) > 0)
					{ 
						PreparedStatement ps2=conn.prepareStatement(sql2);
						ps2.setString(1,username);
						ps2.setString(2,password);
						ps2.executeUpdate();
						response.sendRedirect("patienthomepage.html");
						
					}
					else
					{ %>
						<div>
						<h1><%out.println("Invalid Login");%></h1>
						<a href="plogin.html">TRY AGAIN</a>
						</div>
					<%}
				}
				
%>
</body>
</html>
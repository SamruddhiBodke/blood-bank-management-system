<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FEEDBCK</title>
</head>
<style>
.btn {
  width: 150px;
  background-color: #102549; /*button color*/
  border: none;
  outline: none;
  height: 49px;
  border-radius: 49px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  margin: 10px 0;
  cursor: pointer;
  transition: 0.5s;
}
</style>

<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String feedback=request.getParameter("feedback");

int count=0;
String profile="donor";
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
PreparedStatement ps= null;
String sql = "insert into feedback(?,?,?)";
ps=conn.prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,feedback);
ps.executeUpdate();
%>
<h1>
<% out.println("YOUR FEEDBACK IS SENT SUCCESFULLY !!");%></h1>
<%
Stm.close();
conn.close();
%>

</body>
</html>
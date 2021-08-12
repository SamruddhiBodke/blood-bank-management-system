<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.*,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Blood Requirement</title>
</head>
<style>
body {
   font-family: "Lato", sans-serif;
  transition: background-color .5s;
  
 
  background-size: 1950px;
  background-position:center;
}
div {
	text-align: center;
	padding: 250px 350px;
}
</style>
<body>
<div>
<%
int id=Integer.parseInt(request.getParameter("id"));
String bgrp=request.getParameter("bgrp");
int age=Integer.parseInt(request.getParameter("age"));
int quantity=Integer.parseInt(request.getParameter("quantity"));

int count=0;
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
PreparedStatement ps= null;
ResultSet rset=Stm.executeQuery("select * from brequirement");
while(rset.next())
{
    count++;
}
int b_id=500+count;
String sql="insert into brequirement values(?,?,?,?,?)";
ps=conn.prepareStatement(sql);
ps.setInt(1,b_id);
ps.setInt(2,id);        
ps.setString(3,bgrp);
ps.setInt(4,age);
ps.setInt(5,quantity);
ps.executeUpdate();%>
<h1><%out.println(" YOUR REQUEST IS SENT");	%></h1>

</body>
</html>
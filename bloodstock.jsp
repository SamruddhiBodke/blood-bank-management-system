 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
try {
Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
 height:100vh;
 background-size:100% 100%;
 background:url('b12.jpg');
 background-position: center;

  background-size: cover;
 background-repeat:no-repeat;

 
}
 
h1{position:absolute;left:420px;top:50px;}

table{
 width:700px;
 box-shadow:-1px 12px 12px -6px rgba(0,0,0,0.5);
 text-align:center;
 position:absolute;left:80px;top:100px;margin:50px;
 border-top:none;border-left:none;border-right:none;
 border-bottom: 2px solid blue;
}

td{
padding:10px;border:none;
border-bottom: 1px solid #dddddd;
border:none;

}
th{
padding:10px;border:none;
border-bottom: 1px solid #dddddd;
border-radius:5px 5px 0 0;}

td{font-size:18px;}

th
{
 background-color:dodgerblue;
 
}

tr:nth-child(odd){
 background-color:dodgerblue;
 }



tr:hover{transform:scale(1.1);
 transition:transform 300ms ease-in;background-color:dodgerblue;}
</style>
</head>
<body bgcolor="aqua";>

<h1>STOCK DETAILS</h1>
<table border="3">
<tr>
<td>Blood Group</td>
<td>Stocks</td>
<td>Status</td>
</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
statement=connection.createStatement();
String sql ="select * from stocks";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("bgrp") %></td>
<td><%=resultSet.getInt("stock") %></td>
<td><%=resultSet.getString("status") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
    
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
 transition:transform 300ms ease-in;background-color:magenta;}
</style>
</head>
<body bgcolor="#E8FDFF">

<h1>PATIENT DETAILS</h1>
<table>
<tr>
<td>Patient Id</td>
<td>Name</td>
<td>Address</td>
<td>City</td>
<td>Pincode</td>
<td>Email</td>
<td>Phone No</td>
<td>Age</td>
<td>Gender</td>
<td>Username</td>
<td>Password</td>
</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
statement=connection.createStatement();
String sql ="select * from patient";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("p_id") %></td>
<td><%=resultSet.getString("pname") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("pincode") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getInt("age") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
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
    
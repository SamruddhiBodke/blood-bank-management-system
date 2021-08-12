  <%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<title>Blood Donar</title>
<head>
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
<body bgcolor="#1E90FF">
<div>
<%
int id=Integer.parseInt(request.getParameter("id"));
String bgrp=request.getParameter("bgrp");

int weight=Integer.parseInt(request.getParameter("weight"));
float hbcount=Float.parseFloat(request.getParameter("hbcount"));
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");

if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
if((weight > 50 && hbcount > 12))
{

String sql="insert into donation values(?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1,id);        
ps.setString(2,bgrp);
ps.setInt(3,weight);
ps.setFloat(4,hbcount);
ps.executeUpdate();%>
<h1><%out.println(" YOU are Eligible for Donation <br>contact any blood bank near you");	%></h1>
<table border="table table-bordered table-sttriped table-condensed " align="center" width="800" height="600"cell spacing="0">
<tr>
<th><h2>Sr.No.</h2></th>
<th><h2>Blood Bank</h2> </th>
<th><h2>Area</h2></th>
<th><h2>Contact</h2></th>
</tr>
<tr>
<th>1</th>
<th>Red Blood Bank</th>
<th>Sinhgad Road </th>
<th>9898982222</th>
<tr>
<th>2</th>
<th>Shivneri Blood Bank</th>
<th>Swargate</th>
<th>7654876234</th>
</tr>
<tr>
<th>3</th>
<th>Adhar Blood Bank</th>
<th>Katraj</th>
<th>9876543212</th>
</tr>
<tr>
<th>4</th>
<th>Noble Blood Bank</th>
<th>Camp</th>
<th>9812345678</th>
</tr>
<tr>
<th>5</th>
<th>Sahyadri Hospital Blood Bank</th>
<th>Kothrud</th>
<th>9812387678</th>
</tr>
<tr>
<th>6</th>
<th>Om Blood Bank</th>
<th>Koregaon Park</th>
<th>9812345678</th>
</tr>
</table>
<br>
<a href="donation.html"><input type="submit" value="All THE BEST FOR YOUR DONATION" class="btn" /></a>
<%}
else{%>
<h1><%out.println("Sorry YOU are NOT Eligible for Donation");	%></h1>
		<h1><%out.println("Your Record is Not Inserted!");	%></h1>		
	<%			
}			
%>
</div>
</body>
</html>
    
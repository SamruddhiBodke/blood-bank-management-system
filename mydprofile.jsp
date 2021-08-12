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
<style>
body {
  font-family: "Lato", sans-serif;
  transition: background-color .5s;
  background-color:lightskyblue;
  background-image: url("1234.jpg");
  background-size: 1530px;
  background-position:center;
}

div {
	text-align: center;
	padding: 295px 290px;
	border: 1px solid;
	width: 500px;
	
}

div.container{
 background-color: white;
  padding: 36px;
  background-position:center;
   margin-left:27%;
    transform: translate(10%, 10%) ;
  
}
h1{
	color: black;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: lightblue;
  align : center;
  border: none;
  
  padding: 16px 32px;
  text-decoration: none
  margin: 4px 2px;
  cursor: pointer;
}

input[type=text] {
  width: 100%;
  padding: 15px 10px;
  margin: 18px 15px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
 
   
}

input[type=text]:focus {
  background-color: lightblue;
  
   
}

input[type=submit]:hover {
  background-color: #fff;
}

label{
color: white;
}
</style>
<body>
<div class="container">
<h1>Your Account Details</h1>
<%
String password=request.getParameter("password");
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
                String sql="select d_id,donor.dname,donor.address,city,pincode,email,phone,age,gender,donor.username,donor.password from donor,profile where donor.password=profile.password";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rset=ps.executeQuery();%>
				<table border="2">
                <% while(rset.next())
                {%>
                    <tr><td>ID</td><td><%=rset.getInt(1)%></tr></td>
                    <tr><td>Name</td><td><%=rset.getString(2)%></td></tr>
					<tr><td>Address</td><td><%=rset.getString(3)%></td></tr>
					<tr><td>City</td><td><%=rset.getString(4)%></td></tr>
					<tr><td>Pincode</td><td><%=rset.getString(5)%></td></tr>
					<tr><td>Email</td><td><%=rset.getString(6)%></td></tr>
					<tr><td>Phone</td><td><%=rset.getString(7)%></td></tr>
					<tr><td>Age</td><td><%=rset.getInt(8)%></tr></td>
					<tr><td>Gender</td><td><%=rset.getString(9)%></td></tr>
					<tr><td>Username</td><td><%=rset.getString(10)%></td></tr>
					<tr><td>Password</td><td><%=rset.getString(11)%></td></tr>
                <%} %>
				</table>

<a href="donorhomepage.html">Home</a>

<p>Caution : Don't share your Login Details to Anyone to Prevent Frauds!!</p>
</div>
</body>
</html>


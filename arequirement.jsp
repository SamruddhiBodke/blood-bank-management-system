<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<title>Records By ID</title>
<head>
<style>
body {
  font-family: "Lato", sans-serif;
  transition: background-color .5s;
  background-color:white;
  
  
}
div {
	text-align: center;
	padding: 250px 350px;
}
h1{
	
}



input[type=text], select {
  width: 40%;
  padding: 20px 10px;
  margin: 8px 0px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

}
input[type=submit]:hover {
  background-color: #45a049;
}
table{
	 border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: center;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}



.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
    background-color: #4d84e2;
    color: #ffffff;
    text-align: left;
	font-family: "Poppins", sans-serif;
	font-size: 20px;

}

.styled-table th,
.styled-table td {
    padding: 12px 15px;
	
	

}

.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
	font-size: 17px;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #4d84e2;
}
.btn {
  width: 160px;
  background-color: #4d84e2; /*button color*/
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

.btn:hover {
  background-color: #4d84e2;
}
input[type=submit], input[type=reset] {
  background-color: lightblue;
  align : center;
  border: none;
  
  padding: 16px 32px;
  text-decoration: none
  margin: 4px 2px;
  cursor: pointer;
} 
</style>
<body>
<div>
<h1>Patient Requirements</h1><br><br>
<%
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
                ResultSet rset=Stm.executeQuery("select breq_id,p_id,bgrp,quantity from brequirement");
                if (rset.next() == false) { %><h2><%out.println("No records Are pending!");%></h2><% }


    
				%>
				<table  class="styled-table">
				
				<thead><tr><th>Requirement Number</th><th>Patient ID</th><th>Blood Group</th><th>Quantity</th><th>Send Notification</th></tr></thead>
				<%
				
				while(rset.next())
                {%>
                    
					<form action="sendnotification.jsp">
					<tr><td><%=rset.getInt(1)%></td><input type="hidden" name="breq_id" value="<%=rset.getInt(1)%>">
					<td><%=rset.getInt(2)%></td><input type="hidden" name="p_id" value="<%=rset.getInt(2)%>">
					<td><%=rset.getString(3)%></td><input type="hidden" name="bgrp" value="<%=rset.getString(3)%>">
					<td><%=rset.getInt(4)%></td><input type="hidden" name="quantity" value="<%=rset.getInt(4)%>">
					<td><input type="submit" value="YES" /></td>
					</tr>
					</form>
                <%}%>
				</table>
<a href="adminhomepage.html"><input type="button" value="Back" class="btn solid"></a>		<a href="adminhomepage.html"><input type="button" value="Home" class="btn solid"></a>
</div>
</body>
</html>
    
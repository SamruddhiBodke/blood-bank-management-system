 <%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Notifications</title>
<style>
body {
  font-family: "Lato", sans-serif;
  transition: background-color .5s;
  background-color:white;
  
  
}
div {
	text-align: center;
	padding: 50px 200px;
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
  width: 150px;
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
</style>
</head>
<body>
<%
int count=0;
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();

ResultSet rset=Stm.executeQuery("select notification.p_id,message,notification.breq_id from notification,profile,patient where profile.username=patient.username and profile.password=patient.password and notification.p_id=patient.p_id;");%>
<div>

				
					
						<table class="styled-table">
						<h2>Your Notifications</h2>
						<thead><th>Your ID</th><th>Notification</th><th>Requirement Number</th><TH>payment</TH></thead>
<%               		 while(rset.next())
							{%>
								<form action="generatebill.jsp">
								<tbody>
								
								<td><%=rset.getInt(1)%></td><input type="hidden" name="p_id" value="<%=rset.getInt(1)%>">
							<td><%=rset.getString(2)%></td>
							<td><%=rset.getInt(3)%></td><input type="hidden" name="breq_id" value="<%=rset.getInt(3)%>">
							<td><input type="submit" value="Genrate bill" /></td>
								</tbody>
								<%
						  }
								
								%>
						</table>
						
					
				
			
				<a href="Customer1.jsp"><input type="button" value="Home" class="btn solid"></a>
</div>
</body>
</html>

    
    
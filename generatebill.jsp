            <%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,javax.swing.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Generate Bill</title>
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
int p_id=Integer.parseInt(request.getParameter("p_id"));
int breq_id=Integer.parseInt(request.getParameter("breq_id"));
int count=0;
int quantity=0;
float amount=0;
String status="unpaid";
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
PreparedStatement ps= null;
ResultSet rset2=Stm.executeQuery("select quantity from brequirement where breq_id="+breq_id);
	while(rset2.next())
{
    quantity=rset2.getInt(1);
}
ResultSet rset=Stm.executeQuery("select * from bill");
                while(rset.next())
                {
                    count++;
                }
int b_no=501+count;
amount=quantity*2000;
String sql = "insert into bill values(?,?,?,?)";
ps=conn.prepareStatement(sql);
ps.setInt(1,b_no);
ps.setInt(2,p_id);
ps.setInt(3,breq_id);
ps.setFloat(4,amount);
ps.executeUpdate();

ResultSet rset3=Stm.executeQuery("select b_no,p_id,breq_id,amount from bill where b_no="+b_no);
while(rset3.next())
{%>
   <table  class="styled-table">
<h1>Your Bill is Generated</h1>
<thead><tr><th>Bill Number</th><th>Patient Id</th><th>Requirement Id </th><th>Quantity</th><th>Amount</th><th>Pay Bill</th></th></tr></thead>
<form action="paid.jsp">
  <tbody> <tr><td><%=rset3.getInt(1)%></td>
   <td><%=rset3.getInt(2)%></td>
		<td><%=rset3.getInt(3)%></td>
		<td><%=quantity%></td>
		<td>Rs. <%=rset3.getDouble(4)%></td>
		<td><input type="submit" value="PAY BILL" /></td>
		</tr></tbody>
   </table>				   
<% }

%><div>

<div>

</div>
</body>
</html>
  
    
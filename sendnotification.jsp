<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Send Message</title>
<style>
div {
	text-align: center;
	padding: 50px 200px;
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
<body><div>
<%
int p_id=201;
String message="Your Requirement Is Available";
int breq_id=Integer.parseInt(request.getParameter("breq_id"));

Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
ResultSet rset=Stm.executeQuery("select brequirement.p_id from brequirement where breq_id="+breq_id);
while(rset.next())
                {
                   p_id=rset.getInt(1);
                }
String sql="insert into notification values(?,?,?)";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1,p_id);				
ps.setInt(2,breq_id);
ps.setString(3,message);
ps.execute();%>
<h1><%out.println("Notification Sent for Request no :"+breq_id);%></h1>
<%

conn.close();
%>
<a href="adminhomepage.html"><input type="button" value="HOME" class="btn solid"></a>
</div>
</body>
</html>


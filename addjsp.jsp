<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
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
String username=request.getParameter("username");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String gender=request.getParameter("gender");
int age=Integer.parseInt(request.getParameter("age"));
String location=request.getParameter("location");
String documents=request.getparameter("documents");

Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
PreparedStatement ps= null;
ResultSet rset=Stm.executeQuery("select * from users");
               
String sql = "insert into users values(?,?,?,?,?,?,?)";

ps=conn.prepareStatement(sql);
ps.setString(1,username);
ps.setString(2,firstname);
ps.setString(3,lastname);
ps.setString(4,gender);
ps.setInt(5,age);
ps.setString(6,location);
ps.setString(7,documents);

%>
<h1>
<% out.println("Your Registration Is Completed Successfully !!");%></h1>
<a href="add.html"> <input type="submit" value="sign up now" class="btn" /></a>
<%
Stm.close();
conn.close();
%>

</body>
</html>
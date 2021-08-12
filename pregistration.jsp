<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Registration</title>
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
String name=request.getParameter("fullname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String city=request.getParameter("city");
int age=Integer.parseInt(request.getParameter("age"));
String password=request.getParameter("password");
String username=request.getParameter("username");
String gender=request.getParameter("gender");
String pincode=request.getParameter("pincode");

int count=0;
String profile="patient";
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/project","postgres","samruddhi");
if(conn==null)
	out.println("Connection Failed");
Statement Stm=conn.createStatement();
PreparedStatement ps= null;
ResultSet rset=Stm.executeQuery("select * from patient");
                while(rset.next())
                {
                    count++;
                }
int id=2500+count;
String loginquery="insert into login values(?,?,?)";
String sql = "insert into patient values(?,?,?,?,?,?,?,?,?,?,?)";
ps=conn.prepareStatement(loginquery);
ps.setString(1,username);
ps.setString(2,password);
ps.setString(3,profile);
ps.executeUpdate();

ps=conn.prepareStatement(sql);
ps.setInt(1,id);
ps.setString(2,name);
ps.setString(3,address);
ps.setString(4,city);
ps.setString(5,pincode);
ps.setString(6,email);
ps.setString(7,phone);
ps.setInt(8,age);
ps.setString(9,gender);
ps.setString(10,username);
ps.setString(11,password);
ps.executeUpdate();
%>
<h1>
<% out.println("Your Registration Is Completed Successfully !!");%></h1>
<a href="plogin.html"> <input type="submit" value="sign up now" class="btn" /></a>
<%
Stm.close();
conn.close();
%>

</body>
</html>
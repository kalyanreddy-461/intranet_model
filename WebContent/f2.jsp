<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

#customers1 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 55%;
}

#customers1 td, #customers1 th {
  border: 1px solid #ddd;
  padding: 4px;
}

#customers1 tr:nth-child(even){background-color: #f2f2f2;}

#customers1 tr:hover {background-color: #ddd;}

#customers1 th {
  padding-top: 18px;
  padding-bottom: 18px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
String userid=request.getParameter("userid");
String password=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection(url,un,pw);
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
String sal=request.getParameter("sal");
ResultSet rs=st.executeQuery("select *from user where salary>='"+sal+"'");

%>
 </br>
<h1><center>Employee particulars who have a salary greater than...</center></h1></br>
<table id=customers1 align="center">
<col width="160">
	  <col width="330">

<tr>
<th>Userid</th>
<th>Name</th>
<th>Salary</th>
</tr>
</table>
<% while(rs.next()){%>
	<table id=customers1 align="center">
	<col width="160">
	  <col width="330">

	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(4) %></td>
	
	</tr>
	</table>
<% 
}}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*"%>
      <%@ page import="java.sql.Timestamp"%>
    <%@ page import="java.util.*"%>
    <%@ page import="java.text.SimpleDateFormat"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#customers1 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
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
</head>
<body>
<% 
try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null; 
conn=DriverManager.getConnection(url,un,pw);

ServletContext context=getServletContext(); 

Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
String userid=request.getParameter("userid");
ResultSet rs=st1.executeQuery("select * from Assign where userid='"+userid+"'");



%>
<% if(rs.next())%>
<h1><center>Status of the Assignment of userid <%=userid %></center></h1>
<table id=customers1 align="center">
<col width="auto">
  <col width="auto">
  <col width="auto">
  <col width="auto">
  <col width="auto">
  <col width="auto">
	<tr>
<th>Name of the Assignment</th>
<th>Status</th>
<th>Explaination</th>
<th>Given Date</th>
<th>Updated date</th>
<th>Due date</th>
</tr>

<%  
rs.beforeFirst();
while(rs.next())
{
	%>
	<tr>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td>
	
	</tr>
	<%} %>
	</table>
	<%
}
catch(Exception e)
{
	out.println("no assignments available");
}
%>

</body>
</html>
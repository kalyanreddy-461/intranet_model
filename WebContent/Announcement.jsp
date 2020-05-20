<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#customers1 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 70%;
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
int userid = (int)context.getAttribute("userid");

PreparedStatement ps2 = conn.prepareStatement("update Notify set announce=0 where userid ="+userid);
int y=ps2.executeUpdate();
Statement st1=conn.createStatement();
ResultSet rs=st1.executeQuery("select * from announcement where userid='"+userid+"'");
%>
<% if(rs.next())%>
<h1><center>Anouncements</center></h1>
<table id=customers1 align="center">
<col width="420">
  <col width="280">

<tr>
<th>Announcement</th>
<th>Venue</th>
<th>Date</th>
</tr>
</table>
<%  
rs.beforeFirst();
while(rs.next())
{
	%>
	<table id=customers1 align="center">
	<col width="420">
  <col width="280">
	<tr>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	
	</tr>
	</table>
	<%
}}
catch(Exception e)
{
	out.println("no schedules available");
}
%>

</body>
</html>
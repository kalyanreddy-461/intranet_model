<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.*"%>
      <%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
#status {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

#status td, #status th {
  border: 1px solid #ddd;
  padding: 4px;
}

#status tr:nth-child(even){background-color: #f2f2f2;}

#status tr:hover {background-color: #ddd;}

#status th {
  padding-top: 18px;
  padding-bottom: 18px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>

<body>
<form action="assign2.jsp" method="post">
<h1>Your Assignments Status</h1>
<%
try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver"); 
connection=DriverManager.getConnection(url,un,pw);
Statement st=connection.createStatement();
Statement st2=connection.createStatement();
ServletContext context=getServletContext(); 
int userid=(int)context.getAttribute("userid");
int p=0;

PreparedStatement ps1 = connection.prepareStatement("update  Notify set assign="+p+" where userid="+userid+"");
	int z=ps1.executeUpdate();
int k=1;
ResultSet rs=st.executeQuery("select * from Assign where userid="+userid);
%>
<table id="status">

<tr>
<th>Assignment no</th>
<th>Assignment Name</th>
<th>Assigned on</th>
<th>Due Date</th>
<th>Assignment Status(Present)</th>
<th>Explanation</th>  
<th>Recently Updated Date</th>  
 </tr>
<% 
while(rs.next())
{
%>
<tr>
<td><% out.println(k+"."); %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(6) %></td>
  </tr>
  <tr><%out.println("\n"); %><br></tr>
  <%
k++;
}
%>
</table>
<% 
}
catch(Exception e)
{
	out.println(e);
}
%>
 
</body>
  
 </form>
</html>
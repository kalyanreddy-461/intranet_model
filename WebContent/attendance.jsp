<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
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
<%try{
	String url="jdbc:mysql://localhost:3306/xyz";
	String un="root";
	String pw="groot";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null; 
	conn=DriverManager.getConnection(url,un,pw);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	Statement st2=conn.createStatement();

	ServletContext context=getServletContext(); 
	int userid = (int)context.getAttribute("userid");
	

String sDate=request.getParameter("date2");
String sDate1=request.getParameter("date1");
java.sql.Date Date = java.sql.Date.valueOf( sDate ); 
java.sql.Date Date1 = java.sql.Date.valueOf( sDate1 );  
ResultSet rs=st.executeQuery("select * from dates where fulldate between '"+Date+ "' and '"+Date1+"' ");


ResultSet rs1=st1.executeQuery("select * from calend where userid="+userid+" order by date asc");
ResultSet rs2=st2.executeQuery("select * from calend where userid="+userid+" order by date");
%>
<h1><center>Your Attendance Details</center></h1>
<table id=customers1 align="center">
<col width="155.5">
  <col width="80">

<tr>
<th>Date</th>
<th>Attendance</th>
</tr>
</table>
<% 
if(rs1.next())
{

while(rs.next())
{
if(rs.getDate(2).equals(rs1.getDate(2)))
{	

	if(rs1.getInt(3)==1)
	{	%>
	<table id=customers1 align="center">
	<col width="130">
  <col width="80">
	<tr>
	<td><%=rs1.getDate(2)%></td>
	<td>&#10004;</td>
	</tr>
	</table>
	<%} 

	if(rs1.getInt(3)==0){
		%>
	<table id=customers1 align="center">
	<col width="130">
  <col width="80">
	
	<tr>
	<td><%=  rs1.getDate(2)%></td>
	<td>&#10006;
	</td>
	</tr>
	
	</table>
	<%
	}
	rs1.next();


	}

		else
		{
			%>
			<table id=customers1 align="center">
			<col width="130">
  <col width="80">
			
			<tr>
			<td><%=rs.getDate(2)%></td>
			<td>&#10006;
			</td>
			</tr>
			
			</table>
		<% 		


		}


}
		
	}
}
 


catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>
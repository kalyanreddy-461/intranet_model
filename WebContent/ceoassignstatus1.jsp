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
</head>
<body>
<form action="ceoassignstatus.jsp">
<%
try{
	String url="jdbc:mysql://localhost:3306/xyz";
	String un="root";
	String pw="groot";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null; 
	conn=DriverManager.getConnection(url,un,pw);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	ServletContext context=getServletContext(); 
	
	ResultSet rs=st.executeQuery("select *from x1");
	%>
	<h3>Select the userid for whom you want to check the status of the assignment</h3>
	<label for="userid">Choose the employee id:</label>
  <select id="userid" name="userid">
  <%while(rs.next())
	{ %>
    <option value="<%=rs.getString(3)%>"><%out.println(rs.getString(3));%></option>
  <%} %>
  </select>
  <input type="submit">
  <%
  }
catch(Exception e)
{
out.println(e);
} %>
</body>
</html>
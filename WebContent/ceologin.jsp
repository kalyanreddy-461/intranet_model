<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid=request.getParameter("ceoid");
String password=request.getParameter("pass");
String userid1="100";
String password1="deloitte";
if(userid1.equals(userid) && password1.equals(password))
	{
	response.sendRedirect("ceoprofile.jsp");
	}
else 
	{
	response.sendRedirect("ceologin1.html");
	}

%>
</body>
</html>
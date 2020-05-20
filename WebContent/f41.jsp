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
<form action="f4.jsp" method="post">
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
ResultSet rs=st.executeQuery("select distinct(address) from Profile");
%>
<label for="address">choose the locality</label>
  <select id="add" name="add">
  <%while(rs.next())
	{ %>
    <option value="<%=rs.getString(1)%>"><%out.println(rs.getString(1));}%></option>
  
 
  </select>
  <input type="submit">
  <%
  }
catch(Exception e)
{
	out.println(e);
} %>
  
  
  </form>
</body>
</html>
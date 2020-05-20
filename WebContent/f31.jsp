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
<form action="f3.jsp" method="post">
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
ResultSet rs=st.executeQuery("select distinct(position) from user");
%>
<label for="position">choose the position</label>
  <select id="pos" name="pos">
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
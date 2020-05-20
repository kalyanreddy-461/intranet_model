<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
<form action="ceoannounce.jsp" method="post">
<center><h1>Scheduling meetings to the Employees </h1></center>
 <div>
    <label for="announce"><h4>Announcement</h4></label>
    <input type="text" id="announce" name="annou" placeholder="announcement..">
    <label for="Venue"><h4>Venue</h4></label>
    <input type="text" id="Venue" name="Venue" placeholder="Venue..">
    <label for="date"><h4>Date</h4></label>
    <input type="text" id="date" name="date" placeholder="date..">
  <%
  try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver"); 
connection=DriverManager.getConnection(url,un,pw);
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("select userid,name from x1");%>
<h4><%out.println("Select the employees whom do u want to send this announcement");%></h4>
<%
while(rs.next())
{%>  
   <label class="container">
   <input type="checkbox" name="checkbox" value="<%=rs.getString(2)%>" >
    <span class="checkmark"></span>
   <%out.println(rs.getString(2) + " , " +rs.getString(1));%>
   </label>
  <br/>
<% }
}
catch(Exception e)
{
	out.println(e);
}
%>
 <input type="submit" value="Submit">
   <br>
  </div>
  
  </form>
</body>
</html>
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
width:400px;
border-radius:15px;
border-style: outset;

  }
  input[type=submit]{
  background-color: #4CAF50;
  border-radius: 10px;
  
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
body {
  background-image: url('images/assign.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;

}

</style>
<body>
<h1>Update Assignment Status</h1>
<form action="assign.jsp" method="post">
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

ResultSet rs=st.executeQuery("select * from Assign where userid="+userid);
while(rs.next())
{
	%>
	<label class="container"><%out.println(rs.getString(2) + " , " +rs.getString(3));
	   %>
  <input type="radio" name="radio" value="<%=rs.getString(2)%>">
  <span class="checkmark"></span>
</label>
	</br>
	
	 <%} %> 
 <input type="submit" value="Submit">
 </br>
 
	<%
}
catch(Exception e)
{
	out.println(e);
}
	%>
	</form>
</body>
</html>
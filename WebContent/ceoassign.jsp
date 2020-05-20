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

.container {
  display: block;
  position: relative;
  padding-left:25px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 18px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 15px;
  width: 15px;
  background-color: #45a049;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
position:center;
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 4px;
  top: 0px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
<form action="ceoassign1.jsp" method="post">
<center><h1>Assigning work to the employees </h1></center>
 <div>
    <label for="assign"><h3>Assignment</h3></label>
    <input type="text" id="assign" name="assign" placeholder="write name of the assignment here.... ">
    
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
ResultSet rs=st.executeQuery("select userid,name from x1");
Calendar calendar = Calendar.getInstance();
Timestamp currentTimestamp = new Timestamp(calendar.getTime().getTime());
String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(currentTimestamp);

String date="";
date=s.substring(0,10);
ResultSet rs1=st2.executeQuery("select *from dates where fulldate>='"+date+"' limit 50" );

%>
<h3>Select the employees whom do u want to give this assignment</h3>
<%
while(rs.next())
{%>  
   <label class="container">
   <input type="checkbox" name="checkbox" value="<%=rs.getInt(1)%>" >
    <span class="checkmark"></span>
   <%out.println(rs.getString(2) + " , " +rs.getString(1));%>
   </label>
  <br/>
  
<% 
}

%>
 <label for="date">Choose a due date:</label>
  <select id="date" name="date">
  <%while(rs1.next())
	{ %>
    <option value="<%=rs1.getString(2)%>"><%out.println(rs1.getString(2));%></option>
  <%} %>
  </select>
  
<% }
catch(Exception e)
{
	out.println(e);
}
%>
 <input type="submit" value="Submit">
   </label><br>
  </div>
  
  </form>
</body>
</html>
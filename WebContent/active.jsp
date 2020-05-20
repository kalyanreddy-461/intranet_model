<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.*"%>
    <%@ page import="java.io.*"%>
    <%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
    <%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body {
  margin: 40px;
}

.grid-container {
  display: grid;
  grid-template-columns:  auto auto auto;
  grid-auto-rows:auto;  
  grid-gap: 10px;
  background-color: #fff;

}
.img
{
width: 100px; 
height: 100px; 
border: 5px dashed #f7a239;
}

.box-a {
  background-color: #4CAF50;
  color: #fff;
  border-radius: 5px;
  padding: 20px;
  height:400px;
  font-size: 20px;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<h1>Active Users Online</h1>
<%
  try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver"); 
connection=DriverManager.getConnection(url,un,pw);
Statement st=connection.createStatement();
Calendar calendar = Calendar.getInstance();
Timestamp currentTimestamp = new Timestamp(calendar.getTime().getTime());
String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(currentTimestamp);
//out.println(s);

String date="";
date=s.substring(0,10);
//out.println(date);

ResultSet rs=st.executeQuery("select * from (Profile natural join attend)natural join attend1 where login_time>='"+date+"'");
%>
<%
int i=1;

while(rs.next())
{
	if(rs.getString(7).compareTo(rs.getString(6))<0){
	String iname=new String();
	iname=rs.getString(1);
%>
<div class="grid-container">
  <div class="box-a">
  <table><tr>
  <th> 
  
  <img src="retrieve.jsp?userid=<%=rs.getString(1)%>" width="250px" height="200px">
  </th>
 </tr>
 
  <tr>
  <th> <% out.println(rs.getString(1));%>
  </th>
 </tr>
  <tr>
  <th> <% out.println (rs.getString(2));%>
  </th>
 </tr>
  <tr>
  <th> <%  out.println(rs.getString(3));%>
  </th>
 </tr>
  <tr>
  <th> <%  out.println(rs.getString(4));%>
  </th>
 </tr>
 </div>
 </div>
 </table>
  </div>
 
 <% 
	}
 i++;
}
}
catch(Exception e)
{
	out.println(e);
}
%>
 

</body>
</html>

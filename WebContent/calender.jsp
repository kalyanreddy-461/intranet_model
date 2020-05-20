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
	<form action="attendance.jsp">
 

<%try{
	String url="jdbc:mysql://localhost:3306/xyz";
	String un="root";
	String pw="groot";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null; 
	conn=DriverManager.getConnection(url,un,pw);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	ServletContext context=getServletContext(); 
	int userid = (int)context.getAttribute("userid");

	ResultSet rs3=st.executeQuery("select *from attend where userid="+userid+"");
	if(rs3.next()){
	String date="";
	date=(rs3.getString(2)).substring(0,10);
	

	
	ResultSet rs=st.executeQuery("select *from dates where fulldate<='"+date+"'");
	ResultSet rs1=st1.executeQuery("select *from calend where userid="+userid);
	
	
	%>
	 <label for="cars">Choose a start date:</label>
  <select id="date2" name="date2">
  <%while(rs.next())
	{ %>
    <option value="<%=rs.getString(2)%>"><%out.println(rs.getString(2));%></option>
  <%} %>
  </select>
  
  </br>
  <label for="cars">Choose a end date:</label>
  <select id="date1" name="date1">
    <%
    rs.beforeFirst();
    while(rs.next())
	{
      	
      	 %>
    <option value="<%=rs.getString(2)%>"><%out.println(rs.getString(2));%></option>
  <%}
	 %>
  </select>
  
  <input type="submit">

<%
	}
}
catch(Exception e)
{
out.println(e);
}
%>
  </form>
</body>

</html>
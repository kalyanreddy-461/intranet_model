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

#h1
{
color:#FFFF00;
}
</style>
<body>
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
String radio=(String)context.getAttribute("radio"); 
String checkbox=request.getParameter("checkbox");
    		  String msg=request.getParameter("msg");
    		
    		    	
    		  PreparedStatement ps = connection.prepareStatement("update Assign set assign='"+checkbox+"' where userid="+userid+" and assign_name='"+radio+"'");
    		  int x=ps.executeUpdate();
    		  Calendar calendar = Calendar.getInstance();
    		  Timestamp currentTimestamp = new Timestamp(calendar.getTime().getTime());
    		  String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(currentTimestamp);

    		  PreparedStatement ps1 = connection.prepareStatement("update Assign set updated_time='"+s+"' where userid="+userid+" and assign_name='"+radio+"'");
    		  int y=ps1.executeUpdate();
    		  PreparedStatement ps2 = connection.prepareStatement("update Assign set msg='"+msg+"' where userid="+userid+" and assign_name='"+radio+"'");
    		  int z=ps2.executeUpdate();

    		  if(x>0&&y>0&&z>0)
    		  {%>
    			  <h1>Updated Succesfully</h1>
    		  <% }
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>
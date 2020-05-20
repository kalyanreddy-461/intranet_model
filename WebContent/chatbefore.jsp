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
try
					{
						String url="jdbc:mysql://localhost:3306/xyz";
						String un="root";
						String pw="groot";
						Connection connection = null; 
						Class.forName("com.mysql.jdbc.Driver"); 
						connection=DriverManager.getConnection(url,un,pw);
						ServletContext context=getServletContext(); 
						int userid=(int)context.getAttribute("userid");
						int t=2;
						%>
						<div class="column1">
						<div class="row1">
					    <div class="card1">
						<a href="chat.jsp?t=0">

					      <h3>View Messages</h3>
						</a>
					      </div>
					  </div>
					  
					  <div class="row1">
					    <div class="card1">
						<a href="chat.jsp?t=1">

					      <h3>Send</h3>
						</a>
					      </div>
					  </div>
					  </div>	
					<%}
					catch(Exception e){
						out.println(e);
					}
					%>
						
</form>	
</body>
</html>
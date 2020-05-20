<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String userid=request.getParameter("userid");
String password=request.getParameter("pass");
String pass1=request.getParameter("repeat-pass");
int count=1;
if(pass1.equals(password))
{
	
}
else
{
	count=0;
}
try
{
	String url="jdbc:mysql://localhost:3306/xyz";
	String un="root";
	String pw="groot";
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection=DriverManager.getConnection(url,un,pw);
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery("select * from x1 where userid='"+userid+"'");
	
	while(rs.next())
	{
	count++;
	}

	if(count>1)
	{
		response.sendRedirect("register2.html");
		
	}
	else if(count<=0)
	{
		response.sendRedirect("register1.html");
	}
	else
	{
	PreparedStatement ps = connection.prepareStatement("insert into x1(name,email,userid,password) values(?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,userid);
	ps.setString(4,password);
	
	int x=ps.executeUpdate();
	if(x>0)
	{
ServletContext context=getServletContext(); 
		
		context.setAttribute("userid",userid);

		response.sendRedirect("Profile.html");
	}
	else 
	{
	out.println("registration failed....");
	}
}}
	catch(Exception e)
	{
	out.println(e);
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp"%>
    <%@ page import="java.util.*"%>
    <%@ page import="java.text.SimpleDateFormat"%>
    
    <%@ page import="java.sql.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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

ResultSet rs=st.executeQuery("select name,password,userid from x1 where userid='"+userid+"'");
if(rs.next())
{
if(rs.getString(2).equals(password))
	{
		out.println("welcome");
		out.println(rs.getString(1));
		ServletContext context=getServletContext(); 
		String username;
		context.setAttribute("username",rs.getString(1));
		context.setAttribute("userid",rs.getInt(3));
	
	Calendar calendar = Calendar.getInstance();
	Timestamp currentTimestamp = new Timestamp(calendar.getTime().getTime());
	String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(currentTimestamp);
	out.println(s);

	String date="";
	date=s.substring(0,10);
	out.println(date);
	ResultSet rs2=st2.executeQuery("select * from calend where userid='"+userid+"' order by date desc");	
	
	
	if(rs2.next())
	{

		if(rs2.getString(2).equals(date))
		{
				}
	
	else{
	PreparedStatement ps2 = conn.prepareStatement("insert into calend (userid,date) values (?,?)");				
	ps2.setString(1,userid);
	ps2.setString(2,date);
	int y=ps2.executeUpdate();
	PreparedStatement ps3 = conn.prepareStatement("update attend1 set active=0 where userid='"+userid+"'");
	int g=ps3.executeUpdate();

	}
	}
	else{
	PreparedStatement ps2 = conn.prepareStatement("insert into calend (userid,date) values (?,?)");				
	ps2.setString(1,userid);
	ps2.setString(2,date);
	int y=ps2.executeUpdate();
	}

	ResultSet rs1=st1.executeQuery("select * from attend where userid='"+userid+"'");	
	
	if(rs1.next()){
		PreparedStatement ps = conn.prepareStatement("update attend set login_time='"+s+"'"+" where userid='"+userid+"'");
		int x=ps.executeUpdate();
	
	}
	else{
	PreparedStatement ps = conn.prepareStatement("insert into attend (userid) values(?)");
	ps.setInt(1,rs.getInt(3));
	int l=ps.executeUpdate();
	}
	response.sendRedirect("userprofile.jsp");
	}
else 
	{
	response.sendRedirect("login1.html");
	}
}
else 
{
response.sendRedirect("login1.html");
}

}
catch(Exception e){out.println(e);}
%>
</body>
</html>
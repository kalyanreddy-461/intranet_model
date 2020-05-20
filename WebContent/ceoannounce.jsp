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
String username=" ";
String annou=request.getParameter("annou");
String Venue=request.getParameter("Venue");
String date=request.getParameter("date");
String name[]=request.getParameterValues("checkbox");

for(int i=0 ; i<name.length ; i++)
{
	username=name[i];
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/xyz", "root", "groot");
	
		PreparedStatement ps = connection.prepareStatement("insert into announcement(name,annou,Venue,date) values(?,?,?,?)");
		
		ps.setString(1,username);
		
		ps.setString(2,annou);
		ps.setString(3,Venue);
		ps.setString(4,date);
		
		int x=ps.executeUpdate();
		if(x>0)
		{
	    PreparedStatement ps1 = connection.prepareStatement("update announcement set userid =(select distinct userid from x1 where name='"+username+"')where name='"+username+"'");
		ps1.executeUpdate();
	    
		}
		int j=0;
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery("select * from Notify where userid=(select distinct userid from x1 where name='"+username+"')");
		
		while(rs.next())
		{
		j=rs.getInt(2);
	
		PreparedStatement ps2 = connection.prepareStatement("update Notify set announce="+(++j)+" where userid ="+rs.getString(1));
		int y=ps2.executeUpdate();
		}
	
		%>
		<h1>Announcement Sent Successfully to <%= username %> ...</h1>
		<% 
	}
		catch(Exception e){
	out.println(e);
		}
}
		%>
</body>
</html>
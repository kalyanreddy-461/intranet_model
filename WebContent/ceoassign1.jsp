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
String id="";
String assign=request.getParameter("assign");
String userid[]=request.getParameterValues("checkbox");
String due_date=request.getParameter("date");
for(int i=0 ; i<userid.length ; i++)
{
	id=userid[i];
	out.println(id);
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/xyz", "root", "groot");
		Statement st=connection.createStatement();	
		PreparedStatement ps = connection.prepareStatement("insert into Assign (userid,assign_name,due_date)values(?,?,?)");
		
		ps.setString(1,id);
		ps.setString(2,assign);
		ps.setString(3,due_date);
		
		int x=ps.executeUpdate();
	int l=0;
	ResultSet rs=st.executeQuery("select * from Notify where userid="+id);
	if(rs.next())
	{
	l=rs.getInt(4);
		PreparedStatement ps1 = connection.prepareStatement("update notify set assign="+(++l)+" where userid="+id);
		int y=ps1.executeUpdate();
	}
	}
		catch(Exception e){
	out.println(e);
		}
}
		%>
</body>
</html>
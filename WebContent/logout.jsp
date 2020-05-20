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

<%
try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
int i=0;
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection(url,un,pw);
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
Statement st4=conn.createStatement();

ServletContext context=getServletContext(); 
int userid=(int)context.getAttribute("userid");

ResultSet rs4=st4.executeQuery("select * from attend1 where userid="+userid+"");	
if(rs4.next()){
	Calendar calendar = Calendar.getInstance();
	Timestamp currentTimestamp = new Timestamp(calendar.getTime().getTime());
	String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(currentTimestamp);
	out.println(s);
	
	PreparedStatement ps3 = conn.prepareStatement("update attend1 set logout_time='"+s+"'"+" where userid="+userid);
	int x=ps3.executeUpdate();
}
else{
		PreparedStatement ps = conn.prepareStatement("insert into attend1 (userid) values(?)");
		ps.setInt(1,userid);
		int l=ps.executeUpdate();
}
Calendar calendar = Calendar.getInstance();
Timestamp currentTimestamp = new Timestamp(calendar.getTime().getTime());
String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(currentTimestamp);
out.println(s);

String date="";
date=s.substring(0,10);
out.println(date);

		ResultSet rs=st.executeQuery("select login_time from attend where userid="+userid);
		ResultSet rs1=st1.executeQuery("select logout_time from attend1 where userid="+userid);
		if(rs.next()){
			if(rs1.next()){
		
				out.println(rs1.getString(1));
				out.println(rs.getString(1));
				ResultSet rs2=st2.executeQuery("select TIMESTAMPDIFF(MINUTE,'"+rs.getString(1)+"','"+rs1.getString(1)+"')");
				if(rs2.next()){
						out.println(rs.getString(1).substring(0,10));
						out.println((rs1.getString(1)).substring(0,10));
							
							ResultSet rs3=st3.executeQuery("select * from attend1 where userid="+userid);
								int active=0;
								if(rs3.next())
								{	
									active=rs3.getInt(3)+rs2.getInt(1);
								out.println(rs2.getString(1));
								PreparedStatement ps1 = conn.prepareStatement("update attend1 set active="+active+" where userid="+userid+"");
								int x=ps1.executeUpdate();
								if(((rs.getString(1)).substring(0,10)).equals((rs1.getString(1)).substring(0,10)))
								{
								if(active>=2){
									PreparedStatement ps2 = conn.prepareStatement("update calend set value="+1+" where (userid="+userid+" and date='"+date+"')");
									int y=ps2.executeUpdate();
								}
								else if(active>=0&&active<2)
								{
									PreparedStatement ps3 = conn.prepareStatement("update calend set value="+0+" where (userid="+userid+" and date='"+date+"')");
									int y=ps3.executeUpdate();
								
								}
								
								}
								}
							
						}
					}
				}
			
i=1;
	

if(i==1)
{
	response.sendRedirect("index.html");
}
}
catch(Exception e){out.println(e);}
%>
</body>
</html>
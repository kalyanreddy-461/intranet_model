<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page import="java.sql.*"%>
      <%@ page import="java.io.*"%>
    
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

FileInputStream fis=null;

PreparedStatement pstmt = null;
ResultSet rs=null;
	Statement st=connection.createStatement();
	ServletContext context=getServletContext(); 
	String userid = (String)context.getAttribute("userid");


String name=request.getParameter("name");
String phno=request.getParameter("phno");
String address=request.getParameter("address"); 
String myloc=request.getParameter("image");
out.println("myloc="+myloc);
File image=new File("C:/Users/abhis/workspace/intranet/WebContent/images/"+myloc);
pstmt = connection.prepareStatement("insert into Profile(userid,name,phno,address,pic) values(?,?,?,?,?)");
pstmt.setString(1, userid);
pstmt.setString(2, name);
pstmt.setString(3, phno);
pstmt.setString(4, address);
fis=new FileInputStream(image);
pstmt.setBinaryStream(5, (InputStream) fis, (int) (image.length()));
int count = pstmt.executeUpdate();
if(count>0)
{
out.println("insert successfully");
response.sendRedirect("login.html");
}
else
{
out.println("not successfully");
}
}
catch(Exception e)
{
	out.println(e);
}	


%>

</body>
</html>
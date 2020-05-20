<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
    <%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>

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
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null; 
	conn=DriverManager.getConnection(url,un,pw);
	Statement st=conn.createStatement();
	
    String fileName="";
    fileName=(String)request.getParameter("file");
    out.println(fileName);
    String contenttype = "";

    switch (fileName)
    {

    case ".doc":

    contenttype = "application/msword";

    break;

    case ".docx":

    contenttype = "application/msword";

    break;

    case ".txt":

    contenttype = "text/plain";

    break;

    case ".pdf":

    contenttype = "application/pdf";

    break;

    case ".rtf":

    contenttype = "application/rtf";

    break;
    case ".pptx":

    contenttype = "application/ppt";

    break;




    }

  
    	FileInputStream fis = null;
    	PreparedStatement pstmt = null;
      conn.setAutoCommit(false);
      File file = new File("C:/Users/abhis/Desktop/"+fileName);
      fis = new FileInputStream(file);
      pstmt = conn.prepareStatement("insert into Filetbl( fileName, fileBody) values ( ?, ?)");
      pstmt.setString(1, fileName);
      pstmt.setAsciiStream(2, fis, (int) file.length());
      pstmt.executeUpdate();
      conn.commit();
    } catch (Exception e) {
      System.err.println("Error: " + e.getMessage());
      e.printStackTrace();
    } %>
</body>
</html>
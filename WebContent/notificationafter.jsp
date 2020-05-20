<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.alert {
	  padding: 20px;
  border:1px solid;
  background-color: #00FF00;
  width:200px;
  
  color: white;
}
#h1
{
color:#FFFF00;
}
#bg {
 
  padding: 78px;
  background: url(images/notify.jpg);
  background-repeat: repeat;
  background-size: 1300px 800px;
}

</style>
<body>
<div id="bg">
<% 
try
					{
						String url="jdbc:mysql://localhost:3306/xyz";
						String un="root";
						String pw="groot";
						Connection connection = null; 
						Class.forName("com.mysql.jdbc.Driver"); 
						connection=DriverManager.getConnection(url,un,pw);
						Statement st=connection.createStatement();
						Statement st1=connection.createStatement();
						Statement st2=connection.createStatement();
						Statement st3=connection.createStatement();
						ServletContext context=getServletContext(); 
						String username = (String)context.getAttribute("username");
						int userid=(int)context.getAttribute("userid"); 
	
						ResultSet rs=st.executeQuery("select * from Notify where userid="+userid);
						if(rs.next())
						{
							if(rs.getInt(2)+rs.getInt(3)+rs.getInt(4)>=0)
							{
								%>
								<div id="h1">
								<h1>You Have <%=rs.getInt(2) %> new Announcements	</h1>
							
								<h1>You Have <%=rs.getInt(3) %> new Chat Notifications	</h1>
								
								<h1>You Have <%=rs.getInt(4) %> new Assignments Assigned	</h1>
							</div>
							<% 
							}
						}
						int i=0;
						i=rs.getInt(2);
						while(i>0)
						{	
							%>

							<div class="alert">
		 		  <strong>1 New Announcement</strong> 
		 		   <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
				
		</div>			
					<% i--;	}
						int j=0;
						j=rs.getInt(3);
						while(j>0)
						{	
							%>

							<div class="alert">
		 		  <strong>1 New Chat Notification</strong> 
		 		   <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
				
		</div>			
					<% j--;	}

						
						
						
						
						
						
						
						
						int k=0;
						k=rs.getInt(4);
						while(k>0)
						{	
							%>

							<div class="alert">
		 		  <strong>1 New  Assignment Assigned</strong> 
		 		   <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
				
		</div>			
					<% k--;	}

					}
catch(Exception e)
{
	out.println(e);
}

						
						%>
</div>
</body>
</html>
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
<form action="chat.jsp" method="post">
<style>
body {
  margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
}

.container {
  border: 2px solid #dedede;
  background-color: #16283c;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  color:#81F7F3;
  background-color:#B40486;
}

.lighter {
  border-color: #ccc;
  color:#FFEE58;
  background-color:  #333300;
  }

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color:#81F7F3;
}

.time-left {
  float: right;
  color:cmyk(63%, 33%, 0%, 76%);
}
div.fixed {
  position: fixed;
  width: 700px;
  border: 3px solid #73AD21;
  background-color:#73AD21;
  bottom:15px;
}

#bg {
 
  padding: 78px;
  background: url(images/chat2.jpg);
background-image:repeat;
  }


</style>

<div id="bg">
<h2 style="color:#FFEB3B">Chat Messages</h2>
 	<div class="fixed">
<div class="container">
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
						
										%>
  <img src="retrieve.jsp?userid=<%=userid %>" alt="avatar" style="width:100%;">
 	
 	<div class="wrap-input100 validate-input" data-validate="Username is required">
						<span class="label-input100" style="color:#FFEB3B">Message</span>
						<input class="input100" type="text" name="message" placeholder="Type a message ...">
						<span class="focus-input100"></span>
					</div>
								<div class="container-login100-form-btn" >
						<button class="login100-form-btn">
							Send
						</button>
					</div>
			</div>
 
  <span class="time-right"></span>
</div>

  <%
 	String msg=request.getParameter("message");
	PreparedStatement ps = connection.prepareStatement("insert into chat(name,msg)values(?,?)");
	ps.setString(1,username);
	ps.setString(2,msg);
	int x=ps.executeUpdate();
	
  ResultSet rs=st.executeQuery("select * from chat order by time desc");
%>
<% if(rs.next())
	{
	
	//Notify Section
	if(rs.getString(1).equals(username)){
		ResultSet rs1=st1.executeQuery("select * from Notify where userid not in(select userid from x1 where name='"+username+"')");
		while(rs1.next())
		{
			int k=0;
		k=rs1.getInt(3);
		PreparedStatement ps2 = connection.prepareStatement("update Notify set chatno="+(++k)+" where userid ="+rs1.getInt(1));
		int y=ps2.executeUpdate();
		}
	}%>
	  
	 
	<% if(!(rs.getString(1).equals(username)))
			{
	}
	}
	%>
	

<%
//Chat Display Section
ResultSet rs1=st2.executeQuery("select * from chat order by time desc");

while(rs1.next())
	{
	if(rs1.getString(1).equals(username)){%>
	<div class="container darker">
	<h3>	<% out.println(rs1.getString(1));%></h3>
		<% out.println(rs1.getString(3));%>
		
	  <span class="time-right"><% out.println(rs1.getString(2));%></span>
 </div>
	  
	
	<%}
	else{%>
	
	<div class="container lighter">
	<h3>	<% out.println(rs1.getString(1));%></h3>
		<% out.println(rs1.getString(3));
		%>
		
	  <span class="time-left"><% out.println(rs1.getString(2));%></span>
 </div>
<% 	
	}
	}
	
		}
	catch(Exception e)
	{}

  %>
	  
</div>
</body>
</html>
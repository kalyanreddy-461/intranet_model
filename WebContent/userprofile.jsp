<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<html>
<head>
<style>
.notification {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background-color: red;
  color: white;
}
.column1 {
color:#333;
left:20px;
background: #d2ff4d;
  float: left;
  width: 50%;
  padding: 0 10px;
}
/* Style the counter cards */
.card1 {
  background: 	  #ff9980;
  border: 2px solid #fff;
  border-radius:20px;
  box-shadow: none;
  padding: 13px 20px;
  font-size: 15px;
  font-weight: bold;
 width: 280px;
  height: 45px;
  text-align:"center";
}
a:link {
  text-decoration: none;
  color:#33ffff ;
}

a:visited {
  text-decoration: none;
  color:#33ffff ;
}

a:hover {

  text-decoration: none;
  color: #33ffff;
}

</style></head>
<body background="images/home-bg1.jpg" width="100%">
<link rel="stylesheet" href="css/card.css">
<div id="profile">
<div id="home1">
<div class="navbar1 navbar-default1 navbar-static-top1" role="navigation">
			<div class="collapse navbar-collapse1">
		
			<div class='wrap'>
		<div class="logo">
			<img src="images\logo.png" class="img-responsive" alt="logo">
		</div>
		<div class="logout">
			<li><a href="logout.jsp"><h2>Logout</h2></a></li>

		</div>
			</div>
			</ul>
		</div>
</div>
</div>
<% 
try{
String url="jdbc:mysql://localhost:3306/xyz";
String un="root";
String pw="groot";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null; 
conn=DriverManager.getConnection(url,un,pw);
Statement st=conn.createStatement();
Statement st8=conn.createStatement();

ServletContext context=getServletContext(); 

String username = (String)context.getAttribute("username");
int userid=(int)context.getAttribute("userid");
ResultSet rs=st.executeQuery("select userid from Profile where userid='"+userid+"'");

if(rs.next())
%>
<div class="column1">
<img src="retrieve.jsp?userid=<%=rs.getString(1)%>" width="100%" height="200px">
<%
Statement st1=conn.createStatement();
ResultSet rs7=st1.executeQuery("select * from announcement where userid='"+userid+"'"+"order by date");
int i = 0;
ResultSet rs6=st1.executeQuery("select * from Notify where userid="+userid+"");
if(rs6.next())i=rs6.getInt(2);
int j=0;
ResultSet rs5=st1.executeQuery("select * from Notify where userid="+userid+"");
if(rs5.next())j=rs5.getInt(3);
ResultSet rs4=st.executeQuery("select * from Notify ");
int d=0;
while(rs4.next()){if(rs4.getInt(1)==userid)d++;}

if(d>0)
{
PreparedStatement ps = conn.prepareStatement("update  Notify set announce="+i+" where userid="+userid+"");
int x=ps.executeUpdate();
PreparedStatement ps1 = conn.prepareStatement("update  Notify set chatno="+j+" where userid="+userid+"");
int y=ps1.executeUpdate();
}
else
{

PreparedStatement ps = conn.prepareStatement("insert into Notify (userid,announce,chatno)values("+userid+","+i+","+j+")");
	int z=ps.executeUpdate();
}
ResultSet rs8=st8.executeQuery("select * from user where userid="+userid);
if(rs8.next()){
%>
<h1><% out.println(username);%></h1> 
 <h3><%= rs8.getString(5) %></h3>
  <h3><%= rs8.getString(3) %></h3>
  <%
}
ResultSet rs3=st.executeQuery("select * from Notify where userid="+userid+"");
  int h=0,k=0,l=0;
  if(rs3.next()){ k=rs3.getInt(2); h=rs3.getInt(3);l=rs3.getInt(4);
}
  %>
  
  
  <a href="notificationafter.jsp" class="notification">
  <span>Notifications</span>
  <span class="badge"><%out.println(h+k+l);
  %></span>
</a>
  
  
  
  
  <div class="row1">
    <div class="card1">
	<a href="contact.jsp">

      <h3>Put a Request</h3>
	</a>
      </div>
  </div>
<div class="row1">
    <div class="card1">
	<a href="viewAssign.jsp">

      <h3>View your Assignments</h3>
	</a>
      </div>
  </div>

<div class="row1">
    <div class="card1">
	<a href="Assign1.jsp">

      <h3>Update Assignment Status</h3>
	</a>
      </div>
  </div>

  <div class="row1">
    <div class="card1">
	<a href="Announcement.jsp">
      <h3>Anouncements</h3>
	  </a>
    </div>
  </div>


  <div class="row1">
    <div class="card1">
	<a href="#">

      <h3>Download Documents</h3>
	</a>
      </div>
  </div>

  <div class="row1">
    <div class="card1">
	<a href="calender.jsp">
      <h3>Attendance</h3>
	  </a>
    </div>
  </div>
  
  <div class="row1">
    <div class="card1">
	<a href="chat1.jsp">
      <h3>Discuss</h3>
    </a>
	</div>
  </div>
  
  <div class="row1">
    <div class="card1">
    <a href="File.html">
		<h3>Blog</h3>
    </a>
	</div>
  </div>
  </div>
</div>
</div>
</div>
<%
}

catch(Exception e)
{
	out.println(e);
}




 %>

</body>
</html>

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

  padding: 0 10px;
  text-align:center;

}
/* Style the counter cards */
.card1 {
  background: 	  yellow;
  border: 4px solid #fff;
  border-radius:28px;
  box-shadow: none;
  padding: 15px 65px;
  font-size: 15px;
  font-weight: bold;
 width: 280px;
  height: 45px;
  text-align:center;
}
a:link {
  text-decoration: none;
  color:black;
}

a:visited {
  text-decoration: none;
  color:black ;
  text-align:center;
}

a:hover {

  text-decoration: none;
  color: blue;
}
#bg {
 
  padding: 20px;
  background: url(images/ceo.jpg);
  background-repeat: no-repeat;
  background-size: 1300px 1200px;
}


</style></head>
<body>
<link rel="stylesheet" href="css/card.css">
<div id="bg">
<div id="profile">
<div id="home1">
<div class="navbar1 navbar-default1 navbar-static-top1" role="navigation">
			<div class="collapse navbar-collapse1">
		
			<div class='wrap'>
		<div class="logo">
			<img src="images\logo.png" class="img-responsive" alt="logo">
		</div>
		<div class="logout">
			<li><a href="index.html"><h2>Logout</h2></a></li>

		</div>
			</div>
			</ul>
		</div>
</div>
</div>
</div>

  
  
  
  
<center><h1>Welcome to the Admin Login</h1></center>
</br>


  <div class="card2">

  <img src="images/ceo4.webp" alt="" style="width:25%">
  </div>
  
  <div class="row1">
    <div class="card1">
	 <h3><a href="ceoassign.jsp">Give a new Assignment</a></h3>
           </div>
  </div>
<div class="row1">
    <div class="card1">
	  <h3><a href="ceoassignstatus1.jsp">Assignment Status of Employees</a></h3>
    
	      </div>
  </div>

<div class="row1">
    <div class="card1">
	<h3><a href="">Granting Permission</a></h3>
      
	      </div>
  </div>

  <div class="row1">
    <div class="card1">
	   <h3><a href="grid.jsp">View Employee Details</a></h3>
   </div>
  </div>


  <div class="row1">
    <div class="card1">
	  <h3><a href="ceoannounce1.jsp">Announcements To Employees</a></h3>
    
	      </div>
  </div>

  <div class="row1">
    <div class="card1">
	 <h3><a href="faq.jsp">Frequently asked Querie's</a></h3>
     </div>
  </div>
  
  <div class="row1">
    <div class="card1">
      <h3><a href="active.jsp">Active Users Online</a></h3>
    </div>
  </div>
  </div>
  </div>
</div>
</body>
</html>

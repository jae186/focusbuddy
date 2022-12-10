<!DOCTYPE html>
<html>
<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href ="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">   
	<link href ="https://cdn.jsdelivr.net/npm/boxicon@latest/css/boxicon.min.css" rel="stylesheet">         
	<title>FocusBuddy Main Page</title>
</head>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>
<body>
	<script type ="text/javascript" src = "css/script.js"></script>
	<header>
		<a href = "index.jsp" class = "logo"><i class = "ri-home-heart-fill"></i><span>FocusBuddy</span></a>
		
				<u1 class="navbar">
					<li><a href="aboutUs.html">About Us</a></li>
					<li><a href="listprod.jsp">Begin Shopping</a></li>
					<li><a href="logout.jsp">Logout</a></li>
					<li><a href = "userinfo.jsp"><%out.print(userName);%></a></li>
				</u1>

		<div class = "main">
			<a href="showcart.jsp" class="user"><i class="ri-shopping-cart-fill"></i>Shopping Cart</a>
			<a href ="login.jsp" class ="user"><i class ="ri-user-fill"></i>Sign In</a>
			<a href ="signup.jsp" class ="user">Register</a>
			
		</div>
	</header>
	<br/>		

<center><img  src = 'https://imageio.forbes.com/specials-images/imageserve/5e020def4e2917000783d582/0x0.jpg?format=jpg&width=1200'></center>
<div class = "text-box">
	<hr><h2 >Find your FocusBuddy Today!</h2>
	<p >Are you struggling to find a study partner that will keep you accountable?<br></br> Find a perfect study parner for all your study sessions!</p>
	<a href="listprod.jsp" class="hero-btn">Begin Shopping!</a>
</div>

<br/>	<br/>
<div class = "users-guide">
	<hr><h2>User's Menu</h2>

	<h3 align="center"><a href="login.jsp">Login</a></h3>
	<br/>	
	<h3 align="center"><a href="signup.jsp">New User! Sign up here</a></h3>
	<br/>	
	<h3 align="center"><a href="userinfo.jsp">User's Information</a></h3>
	<br/>	
	<h3 align="center"><a href="listuserorder.jsp">User's Orders</a></h3>
	<br/>	
	<h3 align="center"><a href="edit.jsp">Edit User Information</a></h3>
	<br/>
	<h3 align="center"><a href="logout.jsp">Log out</a></h3>
	<br/>		




</div>

<div class = "admin-guide">
	<hr><h2>Admin Menu</h2>	
	<h3 align="center"><a href="listorder.jsp">List All Orders</a></h3>
	<br/>	
	<h3 align="center"><a href="admin.jsp">Administrators</a></h3>
	<br/>	




</div>

<%

	if (userName != null)
		out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>");
%>
</body>
</head>



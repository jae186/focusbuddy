<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>
<html lang="en">
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href ="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">   
	<link href ="https://cdn.jsdelivr.net/npm/boxicon@latest/css/boxicon.min.css" rel="stylesheet">  
<title>Sign Up Page</title>
</head>
<center>
<body>	
	<header>
        <%
	String userName = (String) session.getAttribute("authenticatedUser");
	%>
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


<div style="margin:0 auto;text-align:center;display:inline"></div>

    <div class="create-account">
      <h1>Create New Account</h1><hr> <br>
        <form method="get" action="createUser.jsp" class="login-form">
            <%
            String invalid = request.getParameter("invalid");
            if (invalid != null)
                out.println("<h3>Invalid login information: " + request.getParameter("invalid") + "</h3>");
            %>
            <input type="text" name="userid" placeholder="Username" required /><br/><br>
            <input type="password" name="pass" placeholder="Password" required /><br/><br>
            <input type="text" name="firstName" placeholder="First Name" required /><br/><br>
            <input type="text" name="lastName" placeholder="Last Name" required /><br/><br>
            <input type="text" name="email" placeholder="Email" required /><br/><br>
            <input type="text" name="phone" placeholder="Phone Number" required /><br/><br>
            <input type="text" name="address" placeholder="Address" required /><br/><br>
            <input type="text" name="city" placeholder="City" required /><br/><br>
            <input type="text" name="state" placeholder="State" required /><br/><br>
            <input type="text" name="postalCode" placeholder="Postal Code" required /><br/><br>
            <input type="text" name="country" placeholder="Country" required /><br/><br>
            <br/>
            <button type="submit" class="login-button">Create Account</button>
        </form>
    </div>
</center>
    </body>
</html>
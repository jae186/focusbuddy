<%@ page import="java.sql.*" %>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<html lang="en">
<head>
<title>Sign Up Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href ="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">   
<link href ="https://cdn.jsdelivr.net/npm/boxicon@latest/css/boxicon.min.css" rel="stylesheet">  
</head>
<body>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>
	
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

<center>
<div style="margin:0 auto;text-align:center;display:inline"></div>

    <div class="edit-account">
      <h1>Editing Existing Account</h1><hr><br>
        <form method="get" action="editUser.jsp" class="login-form">
            <%
            String invalid = request.getParameter("invalid");
            if (invalid != null)
                out.println("<h3>Invalid login information: " + request.getParameter("invalid") + "</h3>");
            %>
            <input type="text" name="username" placeholder="Username" required /><br><br/>
            <input type="password" name="pass" placeholder="Password" required /><br><br/>
            <input type="text" name="address" placeholder="Address" required /><br><br/>
            <br/>
            <button type="submit" class="sub-button">Edit Account</button>
        </form>
    </div>
</center>
    </body>
</html>
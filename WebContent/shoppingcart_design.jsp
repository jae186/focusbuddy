<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href ="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">   
	<link href ="https://cdn.jsdelivr.net/npm/boxicon@latest/css/boxicon.min.css" rel="stylesheet"> 
<title>Your Shopping Cart</title>
</head>
<body>
	<header>
		<a href = "index.jsp" class = "logo"><i class = "ri-home-heart-fill"></i><span>FocusBuddy</span></a>
		
				<u1 class="navbar">
					<li><a href="userinfo.jsp">User's Information</a></li>
					<li><a href="listprod.jsp">Begin Shopping</a></li>
					<li><a href="logout.jsp">Logout</a></li>
					<li><a href = "userinfo.jsp">USERNAME</a></li>
				</u1>

		<div class = "main">
			<a href="showcart.jsp" class="user"><i class="ri-shopping-cart-fill"></i>Shopping Cart</a>
			<a href ="login.jsp" class ="user"><i class ="ri-user-fill"></i>Sign In</a>
			<a href ="signup.jsp" class ="user">Register</a>
			
		</div>
	</header>

    <%@ include file="header.jsp" %>
    <section id ="cart-container" class="container my-5">
        <table width ="100%">
            <thead>
                <tr>
                    <td>Remove</td>
                    <td>Image</td>
                    <td>Product Name</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Total</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href = "#"><i class="ri-delete-bin-line"></i></a></td>
                    <td><img src =""></td>
                    <td>product name</td>
                    <td>price</td>
                    <td><input class = "w-25 pl-1" value ="1" type="number"></td>

                </tr>
               
            </tbody>
        </table>
    </section>
    <h2><a href="listprod.jsp">Continue Shopping</a></h2>
</body>
</html> 
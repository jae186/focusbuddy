<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>Product Information</title>
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
					<li><a href="userinfo.jsp">User's Information</a></li>
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

<%@ include file="header.jsp" %>
<section id = "prod-container" class="container my-5">
<%
// Get product name to search for
String productId = request.getParameter("id");

String sql = "SELECT productId, productName, productPrice, productImageURL, productImage, productDesc FROM Product P  WHERE productId = ?";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{
	getConnection();
	Statement stmt = con.createStatement(); 			
	stmt.execute("USE orders");
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(productId));			
	
	ResultSet rst = pstmt.executeQuery();
			
	if (!rst.next())
	{
		out.println("Invalid product");
	}
	else
	{		
		out.println("<h2 align=\"center\">"+rst.getString(2)+"</h2>");
		
		int prodId = rst.getInt(1);
		out.println("<table><tr>");
		out.println("<th>Id</th><td>" + prodId + "</td></tr>"				
				+ "<tr><th>Price</th><td>" + currFormat.format(rst.getDouble(3)) + "</td></tr>");
		
		//  Retrieve any image with a URL
		String imageLoc = rst.getString(4);
		if (imageLoc != null)
			out.println("<img src=\""+imageLoc+"\" class =\"center\">");
		
		// Retrieve any image stored directly in database
		String imageBinary = rst.getString(5);
		if (imageBinary != null)
			out.println("<img src=\"displayImage.jsp?id="+prodId+"\">");	
		out.println("</table>");
		
		out.println("<br><h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Description: </h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" + rst.getString(6)+"<br><br>");
		

		
	}
} 
catch (SQLException ex) {
	out.println(ex);
}
finally
{
	closeConnection();
}
%>
</section>
<section id ="prod-button">
	<div class ="center">
	<button><a href="addcart.jsp">Add To Cart</a></button>
	<button><a href="listprod.jsp">Continue Shopping</a></button>
	</div>
</section>

</body>
</html>


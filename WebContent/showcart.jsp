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



<section id ="cart-container" class="container my-5">
<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null)
{	
	out.println("<H1>Your shopping cart is empty!</H1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);

	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<table width =\"100%\"><thead><tr><td>Remove</td><td>Product Name</td><td>Image</td><td>Quantity</td>");
	out.println("<td>Price</td><td>Subtotal</td></tr></thead>");

	double total =0;
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		if (product.size() < 4)
		{
			out.println("Expected product with four entries. Got: "+product);
			continue;
		}
		out.print("<tbody><tr><td><a href = \"#\"><i class=\"ri-delete-bin-line\"></i></a></td>");
		out.print("<td>"+product.get(1)+"</td>");
		
		

	
		Object price = product.get(2);
		Object itemqty = product.get(3);
		double pr = 0;
		int qty = 0;

		
		try
		{
			pr = Double.parseDouble(price.toString());
		}
		catch (Exception e)
		{
			out.println("Invalid price for product: "+product.get(0)+" price: "+price);
		}
		try
		{
			qty = Integer.parseInt(itemqty.toString());
		}
		catch (Exception e)
		{
			out.println("Invalid quantity for product: "+product.get(0)+" quantity: "+qty);
		}
		
		Object productID = product.get(0);
		int prodId =0;
		try{
			prodId = Integer.parseInt(productID.toString());
		}
		catch(Exception e)
		{
			out.println("Invalid prodId");
		}

		String imageLoca ="";

		if (prodId ==1){
			imageLoca = "https://i.imgur.com/MggPGfZ.png";
		} else if (prodId ==2){
			imageLoca = "https://i.imgur.com/JogVikn.png" ;
		} else if(prodId ==3){
			imageLoca = "https://i.imgur.com/K2n5GyM.png";
		} else if(prodId ==4){
			imageLoca = "https://i.imgur.com/r9wKRck.png";
		} else if(prodId ==5){
			imageLoca = "https://i.imgur.com/v7meXDd.png";
		} else if(prodId ==6){
			imageLoca = "https://i.imgur.com/VwZolbY.png";
		} else {
			imageLoca = "https://i.imgur.com/VrMvMuk.png";
		}




		out.println("<td><img src=\""+imageLoca+"\"></td>");
		out.print("<td>"+product.get(3)+"</td>");

		out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td></tr>");
		out.println("</tr></tbody>");
		total = total +pr*qty;
	}
	double totalWtaxes = total*1.07;

	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</tbody></table>");

	
}
%>
</section>
<section id ="cart-button">

			<button class="m1-auto"><a href="checkout.jsp">Proceed To Check Out</a></button>
			<button class="m1-auto"><a href="listprod.jsp">Continue Shopping</a></button>


</section>
<h2></h2>
</body>
</html> 


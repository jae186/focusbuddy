<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>

<% 

try{
    String sql = "UPDATE product SET productPrice = ?, productDesc = ? WHERE productName = ?;";
    String name = "", price = "", desc = "";    

    name = request.getParameter("name");
    price = request.getParameter("price");
    desc = request.getParameter("desc");

    getConnection();
    con.createStatement().execute("use orders;");
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, price);
    ps.setString(2, desc);
    ps.setString(3, name);
    ps.executeUpdate();
    response.sendRedirect(request.getParameter("redirect") != null ? request.getParameter("redirect") : "listprod.jsp");
}
catch (SQLException ex) 
{ 	
    out.println(ex); 
}
finally
{	
	closeConnection();	
}
%> 

%>
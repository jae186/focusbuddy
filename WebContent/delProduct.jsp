<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>

<% 

try{
    String sql = "DELETE FROM product WHERE productName = ?;";
    String name = "";    

    name = request.getParameter("name");

    getConnection();
    con.createStatement().execute("use orders;");
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, name);
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
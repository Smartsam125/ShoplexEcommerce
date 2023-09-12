

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%--<%@page import="com.connection.Conn"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Likes</title>
    </head>
    <body>
        

        <%@include file="connection.jsp" %>
        
        <%
            int productId = Integer.parseInt(request.getParameter("productID"));
        Statement st=connection.createStatement();
       
        
        ResultSet rs = st.executeQuery("SELECT likes FROM products WHERE productID = "+productId);
        rs.next();
        int NewLikes = rs.getInt(1)+1;
        
        st.executeUpdate("UPDATE products SET likes = "+NewLikes+" WHERE productID = "+productId);
        response.sendRedirect("/ShoplexEcommerce/index.jsp");
        %>
        
        
    </body>
</html>

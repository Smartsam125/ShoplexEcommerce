<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %>
<%@include file="connection.jsp" %>
<%@include file="navbar.jsp" %>
   <%String search = request.getParameter("searchitems");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Search-Items</title>
    </head>
    <body>
         
       
        
        
         <%
           
       
            
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(productID) FROM PRODUCTS WHERE pdt_name REGEXP '"+search+"'");
    rs.next();
    
            
            if(rs.getInt("COUNT(productID)")>0){
            Statement stNew = connection.createStatement();         
            ResultSet rsNew = st.executeQuery("SELECT * FROM PRODUCTS WHERE pdt_name REGEXP '"+search+"'");%>
             <div class="container">
                                <div class="card-header my-3 h1">Search Results</div>
                                <div class="row">
            
         <%
            
            
            while(rsNew.next()){
                    %>
                  
                            <div class="col-md-3 my-3">
                                        <div class="card w-100" style="width:18rem;">
                                            <img class="card-img-top" src="/ShoplexEcommerce/images/<%=rsNew.getString("image_source")%>" alt="Car">
                                            <div class="card-body">
                                                <h5 class="card-title"><%=rsNew.getString("pdt_name")%></h5>
                                                <h6 price="price">Price:UGX <%=rsNew.getString("unitPrice")%></h6>
                                                <div class="mt-3 d-flex justify-content-between">
                                                    <% if(username!=null){%>
                                                     <a href="/ShoplexEcommerce/AddToCartServlet?id=<%=rsNew.getInt("productID")%>" class="btn btn-primary">AddToCart</a>
                                                     <a href="likes.jsp?productId=<%out.println(rsNew.getInt("productID"));%>" ><i class="bi bi-hand-thumbs-up">Like</i> </a>
                                                    <%} else{%>
                                                    <a href="/ShoplexEcommerce/AddToCartServlet?id=<%=rsNew.getInt("productID")%>" class="btn btn-primary">AddToCart</a>
                                                   
                                                     <a href="likes.jsp?productId=<%out.println(rsNew.getInt("productID"));%> "id="disable"><i class="bi bi-hand-thumbs-up">Like</i></a><%
//                                                     session.setAttribute("productId",p.getId());
                                                   %>
                                                   <%}%>
                                                </div>
                                               
                                              
                                                
                                            </div>
                                            <!-- comment -->
                                        </div>
                                    </div>
                                               
                                        
                               
                              
                               

                   
                <%
                    }
               
         }
else{
    %>
      </div>
                                
                            </div>
                                     
    <center>
        <img src="noResultsFound.jpg" width="200px" height="200px" alt="alt"/>
        <h4 style="color: red"> Opps No Results found for the search "<%=search%>"</h4>
    </center>    
<%
}
%>

             
            
    </body>
</html>


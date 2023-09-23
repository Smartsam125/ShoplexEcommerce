<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.connection.Conn"%>
<%@page import="com.connectionObect.QuerryProducts"%>
<%@page import="user.product"%>
<%@page import="java.util.*"%>
<%@page import="user.*" %>


<%   
    
QuerryProducts pdts =new QuerryProducts(Conn.getConnection());
List<product>  products = pdts.getAllProducts();
 ArrayList<Cart> cart_list =(ArrayList<Cart>)session.getAttribute("cart-list");
   
  
     if(cart_list !=null){
      
       request.setAttribute("cart_list",cart_list);
    }
%>
<!DOCTYPE html>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="navbar.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
           
   @media (min-width: 768px) and (max-width: 991px) {
    /* Add tablet-specific styles here */
}


@media (max-width: 767px) {
   
    body {
        font-size: 16px;
        line-height: 1.5;
        padding: 10px;
    }
    .container {
        text-align: center;
    }
    .col-md-4 {
        flex: 0 0 100%; /* Full width on mobile */
        margin-bottom: 20px;
    }
}

@media (min-width: 992px) {
}

     .product-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        border: 1px solid #ddd;
        margin-bottom: 10px;
        background-color: #f9f9f9;
    }

    .like-button {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        display: flex;
        align-items: center;
    }

    .bi-hand-thumbs-up {
        margin-right: 5px;
    }

    .likes-count {
        background-color: #007bff;
        color: #fff;
        padding: 5px 10px;
        border-radius: 20px;
    }
</style>
        <link rel="stylesheet" type="text/css" href="jsps/styles.css">


        <title>products</title>
    </head>
    <body>    
                               <div class="container bg-muted">
                                <div class="card-header my-3 ">CURRENT PRODUCTS </div>
                                <div class="row">
                                    <% if(!products.isEmpty()){
                                    for(product p:products){
                                        %>
                                   <div class="col-md-4 my-3">
    <div class="card border-0 shadow-sm">
        <img class="card-img-top" src="/ShoplexEcommerce/images/<%=p.getImagesource()%>" height="400px" width="200px" alt="<%=p.getProductName()%>">
        <div class="card-body">
            <h5 class="card-title"><%=p.getProductName()%></h5>
            <p class="card-text"><%=p.getDescription()%></p>
            <h6 class="card-price">Price: UGX <%=p.getUnitprice()%></h6>
        </div>
        <div class="card-footer d-flex justify-content-between">
            <% if(username != null) { %>
                <a href="/ShoplexEcommerce/AddToCartServlet?id=<%=p.getId()%>" class="btn btn-primary">Add to Cart</a>
                <a href="likes.jsp?productID=<%=p.getId()%>" class="btn btn-secondary">
                    <i class="bi bi-hand-thumbs-up"></i> Like
                </a>
                    
            <% } else { %>
                <div class="product-item">
    <a href="/ShoplexEcommerce/AddToCartServlet?id=<%=p.getId()%>" class="btn btn-primary">Add to Cart</a>
    <a href="likes.jsp?productID=<%=p.getId()%>" class="like-button">
        <i class="bi bi-hand-thumbs-up"></i> Like
    </a>
    <div class="likes-count">
        <span><%= p.getLikes() %></span>
    </div>
</div>
            <% } %>
        </div>
    </div>
</div>

                                        <%}}%>
                               
                                </div>
                                
                            </div>
                                        <footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h4>Contact Us</h4>
                <p>Email: samsonmujabi125@gmail.com</p>
                <p>Phone: +256778663084</p>
            </div>
            <div class="col-md-6">
                <h4>Follow Us</h4>
                <ul class="social-icons">
                    <li><a href="#"><i class="bi bi-facebook"></i></a></li>
                    <li><a href="#"><i class="bi bi-twitter"></i></a></li>
                    <li><a href="#"><i class="bi bi-linkedin"></i></a></li>
                 
                </ul>
            </div>
        </div>
    </div>
</footer>

                                        <script>
                                            var button=document.getElementById("disable");
                                            button.addEventListener("click",Dis,false);
                                            function Dis(){
                                                button.disabled=true;
                                            }
                                            
                                        </script>
      
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
    </body>
</html>
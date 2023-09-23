<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.connection.Conn" %>
<%@page import="com.connectionObect.*" %>
<%@page import="user.Cart,user.product,user.AddToCartServlet" %>
<%@page import="java.util.*" %>

<% 
     ArrayList<Cart> cart_list =(ArrayList<Cart>)session.getAttribute("cart-list");
     List<Cart> cartProduct =null;
  
     if(cart_list !=null){
     QuerryProducts Items =new QuerryProducts(Conn.getConnection());
       cartProduct = Items.getCartProducts(cart_list);
       double total =Items.getTotalPrice(cart_list);
       request.setAttribute("cart_list",cart_list);
       request.setAttribute("total",total);
     
     }
%>
<%@include file="../navbar.jsp"%>

<!DOCTYPE html> 
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style type="text/css">
        .table tbody td{
            vertical-align: middle;
        }
        .btn-decre .btn-decre{
            box-shadow: none;
            font-size: 25px;
        }
        /* Updated styles for the cart page */
        .cart-container {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            background-color: #fff;
        }
        .cart-header {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .cart-item img {
            max-width: 100px;
            max-height: 100px;
        }
        .cart-item-details {
            flex: 1;
            margin-left: 20px;
        }
        .cart-item-details h4 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .cart-item-details p {
            font-size: 14px;
            color: #555;
        }
        .cart-item-details .quantity {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .cart-item-details .quantity input {
            width: 40px;
            text-align: center;
        }
        .cart-item-total {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }
        .cart-action-buttons {
            display: flex;
            align-items: center;
        }
        .cart-action-buttons button {
            margin-right: 10px;
        }
    </style>
    <title>Cart</title>
</head>
<body>
    <div class="container cart-container">
        <h2 class="cart-header">Shopping Cart</h2>
        <% if(cart_list!=null && !cart_list.isEmpty()) { 
            for(Cart c:cartProduct) { %>
                <div class="cart-item">
                    <img src="/ShoplexEcommerce/images/<%=c.getImagesource()%>" alt="<%=c.getProductName()%>">
                    <div class="cart-item-details">
                        <h4><%=c.getProductName()%></h4>
                        <p><%=c.getDescription()%></p>
                        <div class="quantity">
                            <input type="number" name="quantity" value="<%=c.getQuantity()%>" class="form-control">
                        </div>
                        <p class="cart-item-total">UGX </p>
                    </div>
                    <div class="cart-action-buttons">
                        <button class="btn btn-primary"><i class="fas fa-pencil-alt"></i> Update</button>
                        <a href="/ShoplexEcommerce/RemoveFromCart?id=<%=c.getId()%>" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Remove</a>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <p>Your cart is empty.</p>
        <% } %>
        <div class="d-flex justify-content-between align-items-center">
            <h4>Total Price: UGX${(total>0)?total:0} </h4>
            <a href="/ShoplexEcommerce/CheckOut" class="btn btn-warning">Complete Purchase</a>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/js/all.min.js" integrity="sha512-8pHNiqTlsrRjVD4A/3va++W1sMbUHwWxxRPWNyVlql3T+Hgfd81Qc6FC5WMXDC+tSauxxzp1tgiAvSKFu1qIlA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>

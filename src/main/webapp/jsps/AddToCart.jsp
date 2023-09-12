

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.*"%>
<%@include file="../navbar.jsp"%>
<%
     ArrayList<Cart> cartList =new ArrayList<>();
    int id= Integer.parseInt(request.getParameter("id"));
            Cart cart =new Cart();
            cart.setId(id);
            //set quantity to default
            cart.setQuantity(1);
            session = request.getSession();
            session.getAttribute("cart-list");
            //access cartlist products from a session
            
            
            ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
            if(cart_list==null){
                cartList.add(cart);
                session.setAttribute(("cart-list"), cartList);%>
<%
                out.println("Product Added to the Cart");
                 response.sendRedirect("/ShoplexEcommerce/index.jsp");
                
            }else{
                //out.println("cartlist exists");
                cartList =cart_list;
                boolean exist=false;
                
               for(Cart c:cart_list){
                    if(c.getId()==id){
                        exist=true;
                         out.println("<h3 style='color:magenta;text-align:center;'>Item Already Exists<a href='/ShoplexEcommerce/index.jsp'>BackToHomePage</a></h3>");
                    }
              }
               if(!exist){
                        cartList.add(cart);
                        response.sendRedirect("/ShoplexEcommerce/index.jsp");
                    }
            }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add products to cart</title>
    </head>
    <body>
        
    </body>
</html>

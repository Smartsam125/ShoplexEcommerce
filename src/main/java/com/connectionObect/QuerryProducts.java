package com.connectionObect;
import java.sql.*;
import  java.util.*;
import user.*;
import  user.product;
public class QuerryProducts {
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;
    private String query;
    public QuerryProducts(Connection con){
        this.con=con;
    }
    public List<product> getAllProducts(){
        List<product> products = new ArrayList<product>();
        
        try{
            query="select productID,pdt_name,unitPrice,image_source,Description,likes from products";
            st=this.con.prepareStatement(query);
           rs= st.executeQuery();
           
           while(rs.next()){
               product row = new product();
               row.setId(rs.getInt("productID"));
               row.setProductName(rs.getString("pdt_name"));
               row.setUnitprice(rs.getDouble("unitPrice"));
               row.setImagesource((rs.getString("image_source")));
              row.setDescription(rs.getString("Description"));
              row.setLikes(rs.getInt("likes"));
               
              
               products.add(row);
           }

 
 
            
            
        }catch(SQLException e){
            
        e.printStackTrace();}
        return products;
        
    }
   public List<Cart> getCartProducts(ArrayList<Cart> cartList){
       ArrayList<Cart> products  =new ArrayList<Cart>();
        try{
            if(cartList.size()>0){
            for(Cart item:cartList){
                query="select*from products where productID=?";
                st=this.con.prepareStatement(query);
                st.setInt(1, item.getId());
                rs=st.executeQuery();
                while(rs.next()){
                    Cart row=new Cart();
                    row.setId(rs.getInt("productID"));
                    row.setProductName(rs.getString("pdt_name"));
                    row.setImagesource(rs.getString("image_source"));
                    row.setUnitprice(rs.getDouble("unitPrice")*item.getQuantity());
                    row.setQuantity(item.getQuantity());
                    
                    products.add(row);
                }
                
                
            }}
        }catch(Exception e){
            e.getMessage();
        }
   return  products; }
   public double getTotalPrice(ArrayList<Cart> cartList){
       double sum =0;
       try{
           if(cartList.size()>0){
               for(Cart item:cartList){
           query=("select unitPrice from products where  productID=?");
           st=this.con.prepareStatement(query);
           st.setInt(1,item.getId());
           rs=st.executeQuery();
           while(rs.next()){
               sum=sum+(rs.getDouble("unitPrice")*item.getQuantity());
               
           }
           
           
           }}
            
       }
       catch(Exception e){
       e.printStackTrace();}
       return sum;
   }
        
}


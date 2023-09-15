
package com.connection;

import static com.connection.Conn.connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LogInDao {
    public static  boolean validate(String email,String password){
        boolean status = false;
        try{
      Class.forName("com.mysql.cj.jdbc.Driver");
     connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","Samsonmuj3@");
       
         var pst = connection.prepareStatement("Select*from customer where email=? and Password=?");
         pst.setString(1, email);
         pst.setString(2, password);
            ResultSet rs =  pst.executeQuery();
            status=rs.next();
         
         
            
            
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getCause());
        }
        return status;
        
    }
    
}


package com.connection;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Connection;

public class Conn {
   
    public static Connection connection =null;
    public static Connection getConnection() throws ClassNotFoundException,SQLException{
        if(connection ==null){
            System.out.println("Connecting");
            Class.forName("com.mysql.cj.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","Samsonmuj3@");
            System.out.println("connection successful");
        }
        return connection;
        
    }

}

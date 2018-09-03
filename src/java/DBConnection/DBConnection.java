/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Esraa
 */
public class DBConnection {
     public Connection connection ;
    public PreparedStatement statement ;
    public void DBconnection()
    {
        
    }
    public  void connection()
    {
        try 
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Connection is done . ");
			
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
    }
    public  void Connectiontomysql(String DBn)
    {
                connection();
		
		String DBName = DBn;
		String password = "";
		String username="root";
		String host="jdbc:mysql://localhost/"+DBName;
		 
		 try 
		 { 
			connection = (Connection) DriverManager.getConnection(host,username,password);
			System.out.println("Connection to database is done . ");
		 }
		catch (SQLException e)
		{	 
			e.printStackTrace();
		}
    }
    
}

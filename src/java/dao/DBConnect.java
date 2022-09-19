package dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class DBConnect {
        
        
        private static final String url="jdbc:mysql://localhost:3306/gocheeta" ;
        private static final String user="root";
        private static final String pass="nadun1459@"; 
        private static Connection con;
                
        public static Connection getConnection(){
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection(url, user, pass);
                
            }catch(Exception e){
                System.out.println("Database Connection not SUCCESS");
            }
            return con;
            
        }
        
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class CustomerDao implements CustomerInterface {
    ResultSet rset= null;
    Connection con= null;

    
    @Override
    public boolean insertCustomer(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO customer(customerName, customerTel, customerPassword, timeDate , email) VALUES(?,?,?,?,?)");
            insert.setString(1, (String)args.get(0));
            insert.setString(2, (String)args.get(1));
            insert.setString(3, (String)args.get(2));
            insert.setString(4, (String)dtf.format(now));
            insert.setString(5, (String)args.get(3));
            
            int res = insert.executeUpdate();
            if(res>0){
               insertSucsses = true;
               
            }
            else{
               insertSucsses = false;
            }
        }catch(Exception e){
            e.printStackTrace();  
            insertSucsses = false;
        }
        return insertSucsses;   
    }

    @Override
    public boolean addUser(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
     
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO user(email, password) VALUES(?,?)");
            insert.setString(1, (String)args.get(1));
            insert.setString(2, (String)args.get(0));
            
            int res = insert.executeUpdate();
            if(res>0){
               insertSucsses = true;
            }else{
               insertSucsses = false;
            }
        }catch(Exception e){
            e.printStackTrace();  
            insertSucsses = false;
        }
        return insertSucsses;   
    }
    
    public String selectAllCustomer() {

            String customer = "";
            try (Connection connection = DBConnect.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement("select * from customer");) {


                    ResultSet rs = preparedStatement.executeQuery();

                    while (rs.next()) {
                            int idcustomer = rs.getInt("idcustomer");
                            String customerName = rs.getString("customerName");
                            String customerTel = rs.getString("customerTel");
                            String customerPassword = rs.getString("customerPassword");
                            String timeDate = rs.getString("timeDate");
                            String email = rs.getString("email");

                            if("".equals(customer)){
                                customer = String.valueOf(idcustomer)+",,"+customerName+",,"+customerTel+",,"+customerPassword+",,"+timeDate+",,"+email;
                            }else{
                                customer = customer+"!!!!"+String.valueOf(idcustomer)+",,"+customerName+",,"+customerTel+",,"+customerPassword+",,"+timeDate+",,"+email;
                            }

                    }
            } catch (SQLException e) {
                    e.printStackTrace();  
            }
            return customer;
    }
        
        
    public boolean deleteCustomer(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean deleteSucsses=false;

        try{
            PreparedStatement insert = dbconn.prepareStatement("delete from customer where idcustomer = ?");
            insert.setString(1, (String)args.get(0));
            int res = insert.executeUpdate();
            if(res>0){
               deleteSucsses = true;
            }
            else{
               deleteSucsses = false;
            }
        }catch(Exception e){
            e.printStackTrace();  
            deleteSucsses = false;
        }
        return deleteSucsses; 
    }
    
    public String cusSearchDriver(ArrayList<Object> args) {

            String driverList = "";
            try (Connection connection = DBConnect.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement("select d.iddriver as 'Driver_Id' , d.idVehicle as 'Vehicle_id' , d.name as 'driverName' , v.brandwithmodel as 'brandwithmodel'  , v.vehicleNumber as 'vehicleNumber'\n" +
                                                                                   "from driver d, vehicle v\n" +
                                                                                   "where d.idVehicle = v.idvehicle and v.type = ? and d.availability = '1'");) {
                 preparedStatement.setString(1, (String)args.get(0));

                 ResultSet rs = preparedStatement.executeQuery();

                 while (rs.next()) {
                        int Driver_Id = rs.getInt("Driver_Id");
                        String Vehicle_id = rs.getString("Vehicle_id");
                        String driverName = rs.getString("driverName");
                        String brandwithmodel = rs.getString("brandwithmodel");
                        String vehicleNumber = rs.getString("vehicleNumber");
                        
                        if("".equals(driverList)){
                            driverList = String.valueOf(Driver_Id)+",,"+String.valueOf(Vehicle_id)+",,"+driverName+",,"+brandwithmodel+",,"+vehicleNumber;
                        }else{
                            driverList = driverList+"!!!!"+String.valueOf(Driver_Id)+",,"+String.valueOf(Vehicle_id)+",,"+driverName+",,"+brandwithmodel+",,"+vehicleNumber;
                        }
                 }
            } catch (SQLException e) {
                    e.printStackTrace();  
            }
            return driverList;
    }
}


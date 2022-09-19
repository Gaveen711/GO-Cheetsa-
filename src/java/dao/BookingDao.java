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
public class BookingDao implements BookingInterface{
    ResultSet rset= null;
    Connection con= null;

    
    @Override
    public boolean insertBooking(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO booking(driver , vehicle , customer, startLocation, endLocation, BookedTime,  status, price,vehicleType,branch) VALUES(?,?, ?,?,?,?,?,?,?,?)");
            insert.setString(1, (String)args.get(0));
            insert.setString(2, (String)args.get(1));
            insert.setString(3, (String)args.get(2));
            insert.setString(4, (String)args.get(3));
            insert.setString(5, (String)args.get(4));
            insert.setString(6, (String)dtf.format(now));
            insert.setString(7, "Booked");
            insert.setString(8, "220");
            insert.setString(9, (String)args.get(5));
            insert.setString(10, (String)args.get(6));
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
    
        public boolean updateBooking(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
        try{
            PreparedStatement insert = dbconn.prepareStatement("UPDATE booking set status = ?  where idbook = ?");
            insert.setString(1, (String)args.get(1));
            insert.setString(2, (String)args.get(0));
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
    
    public String selectBookingUerWise(ArrayList<Object> args) {
        String booking = "";
        try (Connection connection = DBConnect.getConnection();

                PreparedStatement preparedStatement = connection.prepareStatement("select * from booking where customer = ?");) {
                preparedStatement.setString(1,  (String)args.get(0));
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                    
                   
                        int idbook = rs.getInt("idbook");
                        String driver = rs.getString("driver");
                        String vehicle = rs.getString("vehicle");
                        String customer = rs.getString("customer");
                        String startLocation = rs.getString("startLocation");
                        String endLocation = rs.getString("endLocation");
                        String BookedTime = rs.getString("BookedTime");
                        String PickUpTime = rs.getString("PickUpTime");
                        String status = rs.getString("status");
                        String price = rs.getString("price");
                        String vehicleType = rs.getString("vehicleType");
                        String branch = rs.getString("branch");
                                
                        if("".equals(booking)){
                            booking = String.valueOf(idbook)+",,"+driver+",,"+vehicle+",,"+customer+",,"+startLocation+",,"+endLocation+",,"+BookedTime+",,"+PickUpTime+",,"+status+",,"+price+",,"+vehicleType+",,"+branch;
                        }else{
                            booking = booking+"!!!!"+String.valueOf(idbook)+",,"+driver+",,"+vehicle+",,"+customer+",,"+startLocation+",,"+endLocation+",,"+BookedTime+",,"+PickUpTime+",,"+status+",,"+price+",,"+vehicleType+",,"+branch;
                        }

                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return booking;
    }

    public String selectBookingForBranch(ArrayList<Object> args) {
        String booking = "";
        String driver_id = (String)args.get(0);
        String branch_of_driver = getDriverBranch(driver_id);
        
        String driverID = "";
        try (Connection connection = DBConnect.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("select * from driver where email = ?");) {
                preparedStatement.setString(1,  driver_id);    
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                     driverID = rs.getString("iddriver");
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        
        try (Connection connection = DBConnect.getConnection();

                PreparedStatement preparedStatement = connection.prepareStatement("SELECT b.idbook as idbook , b.driver as driver , b.vehicle as vehicle , b.customer as customer , b.startLocation as startLocation , b.endLocation as endLocation , b.BookedTime as bookedTime , b.PickUpTime as pickupTime , b.status as status , b.price as price , b.vehicleType as vehicleType , b.branch as branch FROM booking b where driver = '"+driverID+"'\n");) {
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                    
                   
                        int idbook = rs.getInt("idbook");
                        String driver = rs.getString("driver");
                        String vehicle = rs.getString("vehicle");
                        String customer = rs.getString("customer");
                        String startLocation = rs.getString("startLocation");
                        String endLocation = rs.getString("endLocation");
                        String BookedTime = rs.getString("BookedTime");
                        String PickUpTime = rs.getString("PickUpTime");
                        String status = rs.getString("status");
                        String price = rs.getString("price");
                        String vehicleType = rs.getString("vehicleType");
                        String branch = rs.getString("branch");
                                
                        if("".equals(booking)){
                            booking = String.valueOf(idbook)+",,"+driver+",,"+vehicle+",,"+customer+",,"+startLocation+",,"+endLocation+",,"+BookedTime+",,"+PickUpTime+",,"+status+",,"+price+",,"+vehicleType+",,"+branch;
                        }else{
                            booking = booking+"!!!!"+String.valueOf(idbook)+",,"+driver+",,"+vehicle+",,"+customer+",,"+startLocation+",,"+endLocation+",,"+BookedTime+",,"+PickUpTime+",,"+status+",,"+price+",,"+vehicleType+",,"+branch;
                        }

                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return booking;
    }
    
    
    public String getAllBookings() {
        String booking = "";
        
        try (Connection connection = DBConnect.getConnection();

                PreparedStatement preparedStatement = connection.prepareStatement("SELECT b.idbook as idbook , b.driver as driver , b.vehicle as vehicle , b.customer as customer , b.startLocation as startLocation , b.endLocation as endLocation , b.BookedTime as bookedTime , b.PickUpTime as pickupTime , b.status as status , b.price as price , b.vehicleType as vehicleType , b.branch as branch FROM booking b");) {
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                    
                   
                        int idbook = rs.getInt("idbook");
                        String driver = rs.getString("driver");
                        String vehicle = rs.getString("vehicle");
                        String customer = rs.getString("customer");
                        String startLocation = rs.getString("startLocation");
                        String endLocation = rs.getString("endLocation");
                        String BookedTime = rs.getString("BookedTime");
                        String PickUpTime = rs.getString("PickUpTime");
                        String status = rs.getString("status");
                        String price = rs.getString("price");
                        String vehicleType = rs.getString("vehicleType");
                        String branch = rs.getString("branch");
                                
                        if("".equals(booking)){
                            booking = String.valueOf(idbook)+",,"+driver+",,"+vehicle+",,"+customer+",,"+startLocation+",,"+endLocation+",,"+BookedTime+",,"+PickUpTime+",,"+status+",,"+price+",,"+vehicleType+",,"+branch;
                        }else{
                            booking = booking+"!!!!"+String.valueOf(idbook)+",,"+driver+",,"+vehicle+",,"+customer+",,"+startLocation+",,"+endLocation+",,"+BookedTime+",,"+PickUpTime+",,"+status+",,"+price+",,"+vehicleType+",,"+branch;
                        }

                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return booking;
    }
        
    public String getDriverBranch(String driver) {
        String branch = "";
        try (Connection connection = DBConnect.getConnection();

                PreparedStatement preparedStatement = connection.prepareStatement("select * from driver where email = ?");) {
                preparedStatement.setString(1,  driver);
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {     
                        branch = rs.getString("branch");

                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return branch;
    }
}

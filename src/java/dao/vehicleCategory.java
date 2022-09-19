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
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class vehicleCategory implements vehicleCategoryInterface{
    ResultSet rset= null;
    Connection con= null;

    @Override
    public boolean insertVehicleCategory(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO vehicle_category(vehicle_Category_name, vehicle_Category_url, initial_payment, basic_pay_km, extra_pay_for_each_km) VALUES(?,?,?,?,?)");
            insert.setString(1, (String)args.get(0));
            insert.setString(2, (String)args.get(1));
            insert.setString(3, (String)args.get(2));
            insert.setString(4, (String)args.get(3));
            insert.setString(5, (String)args.get(4));
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
    public boolean deleteVehicleCategory(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
            boolean deleteSucsses=false;
        
            try{
                PreparedStatement insert = dbconn.prepareStatement("delete from vehicle_category where idvehicle_Category = ?");
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
    
    public String selectAllVehicleCategory() {

        String vehicleCategory = "";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from vehicle_category");) {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                        int idvehicle_Category = rs.getInt("idvehicle_Category");
                        String vehicle_Category_name = rs.getString("vehicle_Category_name");
                        String vehicle_Category_url = rs.getString("vehicle_Category_url");
                        String initial_payment = rs.getString("initial_payment");
                        String basic_pay_km = rs.getString("basic_pay_km");
                        String extra_pay_for_each_km = rs.getString("extra_pay_for_each_km");
                        if("".equals(vehicleCategory)){
                            vehicleCategory = String.valueOf(idvehicle_Category)+",,"+vehicle_Category_name+",,"+vehicle_Category_url+",,"+initial_payment+",,"+basic_pay_km+",,"+extra_pay_for_each_km;
                        }else{
                            vehicleCategory = vehicleCategory+"!!!!"+String.valueOf(idvehicle_Category)+",,"+vehicle_Category_name+",,"+vehicle_Category_url+",,"+initial_payment+",,"+basic_pay_km+",,"+extra_pay_for_each_km;
                        }
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return vehicleCategory;
    }
    
    public String selectAllVehicleCategoryOne(ArrayList<Object> args) {

        String vehicleCategory = "";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from vehicle_category where idvehicle_Category  = ?");) {
             preparedStatement.setString(1, (String)args.get(0));
             ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                        int idvehicle_Category = rs.getInt("idvehicle_Category");
                        String vehicle_Category_name = rs.getString("vehicle_Category_name");
                        String vehicle_Category_url = rs.getString("vehicle_Category_url");
                        String initial_payment = rs.getString("initial_payment");
                        String basic_pay_km = rs.getString("basic_pay_km");
                        String extra_pay_for_each_km = rs.getString("extra_pay_for_each_km");
                        if("".equals(vehicleCategory)){
                            vehicleCategory = String.valueOf(idvehicle_Category)+",,"+vehicle_Category_name+",,"+vehicle_Category_url+",,"+initial_payment+",,"+basic_pay_km+",,"+extra_pay_for_each_km;
                        }else{
                            vehicleCategory = vehicleCategory+"!!!!"+String.valueOf(idvehicle_Category)+",,"+vehicle_Category_name+",,"+vehicle_Category_url+",,"+initial_payment+",,"+basic_pay_km+",,"+extra_pay_for_each_km;
                        }
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return vehicleCategory;
    }
    
    public boolean updateVehicleCategory(ArrayList<Object> args){
       boolean updateSucsses=false;
       try{
           Connection dbconn = DBConnect.getConnection();
           
           String sql="UPDATE vehicle_category SET  vehicle_Category_name='"+(String)args.get(0)+"' ,vehicle_Category_url='"+(String)args.get(1)+"' , initial_payment ='"+(String)args.get(2)+"' , basic_pay_km ='"+(String)args.get(3)+"' , extra_pay_for_each_km ='"+(String)args.get(4)+"' WHERE idvehicle_Category='"+(String)args.get(5)+"'";
           PreparedStatement update = dbconn.prepareStatement(sql);
           int rs= update.executeUpdate(sql);
           
           if(rs>0){
               updateSucsses = true;
           }
           else{
                updateSucsses = false;
           }
       }catch(Exception e){
           e.printStackTrace();
           
       }
        return updateSucsses;   
    }
}

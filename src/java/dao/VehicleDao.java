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
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class VehicleDao implements VehicleInterface{
    ResultSet rset= null;
    Connection con= null;

    
    @Override
    public boolean insertVehicle(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        
        
        
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO vehicle(idvehicle , type, brandwithmodel, vehicleNumber, chasiNumber, insuranceNumber, ownerName, ownerTel,branch) VALUES(?,?,?,?,?,?,?,?,?)");
            insert.setInt(1, (int) args.get(0));
            insert.setString(2, (String)args.get(1));
            insert.setString(3, (String)args.get(2));
            insert.setString(4, (String)args.get(3));
            insert.setString(5, (String)args.get(4));
            insert.setString(6, (String)args.get(5));
            insert.setString(7, (String)args.get(6));
            insert.setString(8, (String)args.get(7));
            insert.setString(9, (String)args.get(8));
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

   
    	public String selectAllVehicle() {

		String vehicle = "";
		try (Connection connection = DBConnect.getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement("select * from vehicle");) {
			
		
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int idvehicle = rs.getInt("idvehicle");
				String type = rs.getString("type");
				String brandwithmodel = rs.getString("brandwithmodel");
				String vehicleNumber = rs.getString("vehicleNumber");
                                String chasiNumber = rs.getString("chasiNumber");
				String insuranceNumber = rs.getString("insuranceNumber");
				String ownerName = rs.getString("ownerName");
                                String ownerTel = rs.getString("ownerTel");
                                String branch = rs.getString("branch");
                                if("".equals(vehicle)){
                                    vehicle = String.valueOf(idvehicle)+",,"+type+",,"+brandwithmodel+",,"+vehicleNumber+",,"+chasiNumber+",,"+insuranceNumber+",,"+ownerName+",,"+ownerTel+",,"+branch;
                                }else{
                                    vehicle = vehicle+"!!!!"+String.valueOf(idvehicle)+",,"+type+",,"+brandwithmodel+",,"+vehicleNumber+",,"+chasiNumber+",,"+insuranceNumber+",,"+ownerName+",,"+ownerTel+",,"+branch;
                                }
				
			}
		} catch (SQLException e) {
			e.printStackTrace();  
		}
		return vehicle;
	}
        
        public boolean deleteVehicle(ArrayList<Object> args) {
            Connection dbconn = DBConnect.getConnection();
            boolean deleteSucsses=false;
        
            try{
                PreparedStatement insert = dbconn.prepareStatement("delete from vehicle where idvehicle = ?");
                insert.setString(1, (String)args.get(0));
                int res = insert.executeUpdate();
                if(res>0){
                   deleteSucsses = true;
                }else{
                   deleteSucsses = false;
                }
            }catch(Exception e){
                e.printStackTrace();  
                deleteSucsses = false;
            }
            return deleteSucsses; 
        }
}


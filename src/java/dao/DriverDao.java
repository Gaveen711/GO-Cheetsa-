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
public class DriverDao implements DriverInterface{
    ResultSet rset= null;
    Connection con= null;

    
    @Override
    public boolean insertDriver(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO driver(idVehicle, name, address, tel, email, birthday, age, licenceNumber, insuranceNumber, bloodType, licenceType, description,branch,availability) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            insert.setString(1, (String)args.get(0));
            insert.setString(2, (String)args.get(1));
            insert.setString(3, (String)args.get(2));
            insert.setString(4, (String)args.get(3));
            insert.setString(5, (String)args.get(4));
            insert.setString(6, (String)args.get(5));
            insert.setString(7, (String)args.get(6));
            insert.setString(8, (String)args.get(7));
            insert.setString(9, (String)args.get(8));
            insert.setString(10, (String)args.get(9));
            insert.setString(11, (String)args.get(10));
            insert.setString(12, (String)args.get(11));
            insert.setString(13, (String)args.get(12));
            insert.setString(14, "1");
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

   
    public String selectAllDriver() {

		String vehicle = "";
		try (Connection connection = DBConnect.getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement("select * from driver");) {
			
		
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int iddriver = rs.getInt("iddriver");
				String idVehicle = rs.getString("idVehicle");
				String name = rs.getString("name");
				String address = rs.getString("address");
                                String tel = rs.getString("tel");
				String email = rs.getString("email");
				String birthday = rs.getString("birthday");
                                String age = rs.getString("age");
                                String licenceNumber = rs.getString("licenceNumber");
                                String insuranceNumber = rs.getString("insuranceNumber");
                                String bloodType = rs.getString("bloodType");
                                String licenceType = rs.getString("licenceType");
                                String description = rs.getString("description");
                                String branch = rs.getString("branch");
                                if("".equals(vehicle)){
                                    vehicle = String.valueOf(iddriver)+",,"+idVehicle+",,"+name+",,"+address+",,"+tel+",,"+email+",,"+birthday+",,"+age+",,"+licenceNumber+",,"+insuranceNumber+",,"+bloodType+",,"+licenceType+",,"+description+",,"+branch;
                                }else{
                                    vehicle = vehicle+"!!!!"+String.valueOf(iddriver)+",,"+idVehicle+",,"+name+",,"+address+",,"+tel+",,"+email+",,"+birthday+",,"+age+",,"+licenceNumber+",,"+insuranceNumber+",,"+bloodType+",,"+licenceType+",,"+description+",,"+branch;
                                }
				
			}
		} catch (SQLException e) {
			e.printStackTrace();  
		}
		return vehicle;
	}
        
        public String selectOneDriver(ArrayList<Object> args) {

		String vehicle = "";
		try (Connection connection = DBConnect.getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement("select * from driver where idVehicle  = ?");) {
		     preparedStatement.setString(1, (String)args.get(0));
		     ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int iddriver = rs.getInt("iddriver");
				String idVehicle = rs.getString("idVehicle");
				String name = rs.getString("name");
				String address = rs.getString("address");
                                String tel = rs.getString("tel");
				String email = rs.getString("email");
				String birthday = rs.getString("birthday");
                                String age = rs.getString("age");
                                String licenceNumber = rs.getString("licenceNumber");
                                String insuranceNumber = rs.getString("insuranceNumber");
                                String bloodType = rs.getString("bloodType");
                                String licenceType = rs.getString("licenceType");
                                String description = rs.getString("description");
                                String branch = rs.getString("branch");
                                if("".equals(vehicle)){
                                    vehicle = String.valueOf(iddriver)+",,"+idVehicle+",,"+name+",,"+address+",,"+tel+",,"+email+",,"+birthday+",,"+age+",,"+licenceNumber+",,"+insuranceNumber+",,"+bloodType+",,"+licenceType+",,"+description+",,"+branch;
                                }else{
                                    vehicle = vehicle+"!!!!"+String.valueOf(iddriver)+",,"+idVehicle+",,"+name+",,"+address+",,"+tel+",,"+email+",,"+birthday+",,"+age+",,"+licenceNumber+",,"+insuranceNumber+",,"+bloodType+",,"+licenceType+",,"+description+",,"+branch;
                                }
				
			}
		} catch (SQLException e) {
			e.printStackTrace();  
		}
		return vehicle;
	}
        
        public boolean deleteDriver(ArrayList<Object> args) {
            Connection dbconn = DBConnect.getConnection();
            boolean deleteSucsses=false;
        
            try{
                PreparedStatement insert = dbconn.prepareStatement("delete from driver where idVehicle = ?");
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
        
        public boolean driverBooked(ArrayList<Object> args){
            boolean updateSucsses=false;
            try{
                Connection dbconn = DBConnect.getConnection();

                String sql="UPDATE driver SET  availability='2'  WHERE iddriver='"+(String)args.get(0)+"'";
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
        
        public boolean driverAvailable(ArrayList<Object> args){
            boolean updateSucsses=false;
            try{
                Connection dbconn = DBConnect.getConnection();

                String sql="UPDATE driver SET  availability='1'  WHERE iddriver='"+(String)args.get(0)+"'";
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


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
public class UserDao implements UserDaoInterface{
    ResultSet rset= null;
    Connection con= null;

    
    @Override
    public boolean insertCustomer(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO user(fullName, email, password, tel) VALUES(?,?,?,?)");
            insert.setString(1, (String)args.get(0));
            insert.setString(2, (String)args.get(1));
            insert.setString(3, (String)args.get(2));
            insert.setString(4, (String)args.get(3));
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
    public Object retrieve(ArrayList<Object> args) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean loginUser(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        
        try{
            PreparedStatement st = dbconn.prepareStatement("select * from user where email=? and password=?");
            st.setString(1, (String)args.get(0));
            st.setString(2, (String)args.get(1));
            ResultSet res = st.executeQuery();
           if(res.next()){
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
    
    
    	public String selectAllUser() {

		String users = "";
		try (Connection connection = DBConnect.getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement("select * from user");) {
			
		
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int iduser = rs.getInt("iduser");
				String fullName = rs.getString("fullName");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
                                
                                if(users == ""){
                                    users = String.valueOf(iduser)+",,"+fullName+",,"+email+",,"+tel;
                                }else{
                                    users = users+"!!!!"+String.valueOf(iduser)+",,"+fullName+",,"+email+",,"+tel;
                                }
				
			}
		} catch (SQLException e) {
			e.printStackTrace();  
		}
		return users;
	}
        
        public boolean deleteUser(ArrayList<Object> args) {
            Connection dbconn = DBConnect.getConnection();
            boolean deleteSucsses=false;
        
            try{
                PreparedStatement insert = dbconn.prepareStatement("delete from user where iduser = ?");
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
}


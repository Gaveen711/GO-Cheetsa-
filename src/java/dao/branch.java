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
public class branch implements banchInterface{
    ResultSet rset= null;
    Connection con= null;

    @Override
    public boolean insertBranch(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
        boolean insertSucsses=false;
        
        try{
            PreparedStatement insert = dbconn.prepareStatement("INSERT INTO branch( branch_name, branch_img_url, address, telephoneNumber, email) VALUES(?,?,?,?,?)");
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
    public boolean deleteBranch(ArrayList<Object> args) {
        Connection dbconn = DBConnect.getConnection();
            boolean deleteSucsses=false;
        
            try{
                PreparedStatement insert = dbconn.prepareStatement("delete from branch where idbranch = ?");
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
    
    public String selectAllBranch() {

        String branchList = "";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from branch");) {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                        int idbranch = rs.getInt("idbranch");
                        String branch_name = rs.getString("branch_name");
                        String branch_img_url = rs.getString("branch_img_url");
                        String address = rs.getString("address");
                        String telephoneNumber = rs.getString("telephoneNumber");
                        String email = rs.getString("email");
                        if("".equals(branchList)){
                            branchList = String.valueOf(idbranch)+",,"+branch_name+",,"+branch_img_url+",,"+address+",,"+telephoneNumber+",,"+email;
                        }else{
                            branchList = branchList+"!!!!"+String.valueOf(idbranch)+",,"+branch_name+",,"+branch_img_url+",,"+address+",,"+telephoneNumber+",,"+email;
                        }
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return branchList;
    }
    
    public String selectOneBranch(ArrayList<Object> args) {

        String branchList = "";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from branch where idbranch  = ?");) {
             preparedStatement.setString(1, (String)args.get(0));
             ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                         int idbranch = rs.getInt("idbranch");
                        String branch_name = rs.getString("branch_name");
                        String branch_img_url = rs.getString("branch_img_url");
                        String address = rs.getString("address");
                        String telephoneNumber = rs.getString("telephoneNumber");
                        String email = rs.getString("email");
                        if("".equals(branchList)){
                            branchList = String.valueOf(idbranch)+",,"+branch_name+",,"+branch_img_url+",,"+address+",,"+telephoneNumber+",,"+email;
                        }else{
                            branchList = branchList+"!!!!"+String.valueOf(idbranch)+",,"+branch_name+",,"+branch_img_url+",,"+address+",,"+telephoneNumber+",,"+email;
                        }
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        return branchList;
    }
    
    public boolean updateBranch(ArrayList<Object> args){
       boolean updateSucsses=false;
       try{
           Connection dbconn = DBConnect.getConnection();
           
           String sql="UPDATE branch SET  branch_img_url='"+(String)args.get(0)+"' , address='"+(String)args.get(1)+"'  ,telephoneNumber='"+(String)args.get(2)+"'  ,email='"+(String)args.get(3)+"'  WHERE idbranch='"+(String)args.get(4)+"'";
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

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dashboard_analisis {
    
    ResultSet rset= null;
    Connection con= null;
    
    public int getAllDrivers() {

            int driverCount = 0;
            try (Connection connection = DBConnect.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("select * from driver");) {
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                    driverCount++;
                }
            } catch (SQLException e) {
                    e.printStackTrace();  
            }
            return driverCount;
    }
}

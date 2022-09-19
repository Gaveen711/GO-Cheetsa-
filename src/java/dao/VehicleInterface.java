/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;

/**
 *
 * @author User
 */
public interface VehicleInterface {
    public boolean insertVehicle(ArrayList<Object> args);
    public boolean deleteVehicle(ArrayList<Object> args);
}

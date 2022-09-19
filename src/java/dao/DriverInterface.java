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
public interface DriverInterface {
    public boolean insertDriver(ArrayList<Object> args);
    public boolean deleteDriver(ArrayList<Object> args);
    public String selectOneDriver(ArrayList<Object> args);
}

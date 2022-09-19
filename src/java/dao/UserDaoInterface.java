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
public interface UserDaoInterface {
    public boolean insertCustomer(ArrayList<Object> args);
    public boolean loginUser(ArrayList<Object> args);
    public Object retrieve(ArrayList<Object> args);
    public boolean deleteUser(ArrayList<Object> args);
}

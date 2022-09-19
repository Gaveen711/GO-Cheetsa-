/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import dao.CustomerDao;
import dao.DriverDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "add_driver", urlPatterns = {"/add_driver"})
public class add_driver extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             String vehicleID =  request.getParameter("vehicleID");
             String driverName =  request.getParameter("driverName");
             String address =  request.getParameter("address");
             String telephoneNumber =  request.getParameter("telephoneNumber");
             String email =  request.getParameter("email");
             String birthDay =  request.getParameter("birthDay");
             String age =  request.getParameter("age");
             String licenceNumber =  request.getParameter("licenceNumber");
             String licenceType =  request.getParameter("licenceType");
             String insuranceNumber =  request.getParameter("insuranceNumber");
             String bloodType =  request.getParameter("bloodType");
             String Description =  request.getParameter("Description");
             String Branch =  request.getParameter("branch");
             String password =  request.getParameter("password");
             
             if(addDriver(vehicleID,driverName,address,telephoneNumber,email,birthDay,age,licenceNumber,licenceType,insuranceNumber,bloodType,Description,Branch) && addUser(password,email)){
                out.println("<script type='text/javascript'>");
	        out.println("alert('Driver Adding Success');");
	        out.println("location='./admin/vehicle.jsp'");
		out.println("</script>");
        
             }else{
                out.println("<script type='text/javascript'>");
	        out.println("alert('Driver Adding Not Success');");
	        out.println("location='./admin/vehicle.jsp'");
		out.println("</script>"); 
             }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean addDriver(String vehicleID, String driverName, String address, String telephoneNumber, String email, String birthDay, String age, String licenceNumber, String licenceType, String insuranceNumber, String bloodType,String Description, String Branch) {
         ArrayList<Object> list=new ArrayList<>();
         list.add(vehicleID);
         list.add(driverName);
         list.add(address);
         list.add(telephoneNumber);
         list.add(email);
         list.add(birthDay);
         list.add(age);
         list.add(licenceNumber);
         list.add(insuranceNumber);
         list.add(bloodType);
         list.add(licenceType);
         list.add(Description);
         list.add(Branch);
         boolean isAdded = new DriverDao().insertDriver(list);
         return isAdded;
    }

    private boolean addUser(String password, String email) {
         ArrayList<Object> list=new ArrayList<>();
         list.add(password);
         list.add(email);
         boolean isAdded = new CustomerDao().addUser(list);
         return isAdded;
    }

}

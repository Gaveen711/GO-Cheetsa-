/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import dao.VehicleDao;
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
@WebServlet(name = "add_vehicle", urlPatterns = {"/add_vehicle"})
public class add_vehicle extends HttpServlet {

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
             String vehicleType =  request.getParameter("vehicleType");
             String Model =  request.getParameter("Model");
             String VehicleNumber =  request.getParameter("VehicleNumber");
             String InsuranceNumber =  request.getParameter("InsuranceNumber");
             String ChassisNumber =  request.getParameter("ChassisNumber");
             String BookOwner =  request.getParameter("BookOwner");
             String BookOwnerTel =  request.getParameter("BookOwnerTel");
             String Branch =  request.getParameter("branch");
             int driver_int = (int)Math.floor(Math.random()*(9999-1000+1)+1000);
             
             if(addVehicle(driver_int,vehicleType,Model,VehicleNumber,InsuranceNumber,ChassisNumber,BookOwner,BookOwnerTel,Branch)){
                out.println("<script type='text/javascript'>");
	        out.println("alert('Vehicle Adding Success');");
	        out.println("location='./admin/add_driver.jsp?vId="+driver_int+"'");
		out.println("</script>");
        
             }else{
                out.println("<script type='text/javascript'>");
	        out.println("alert('Vehicle Adding Not Success');");
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

    private boolean addVehicle(int driver_int, String vehicleType, String Model, String VehicleNumber, String InsuranceNumber, String ChassisNumber, String BookOwner, String BookOwnerTel, String Branch) {
         ArrayList<Object> list=new ArrayList<>();
         list.add(driver_int);
         list.add(vehicleType);
         list.add(Model);
         list.add(VehicleNumber);
         list.add(InsuranceNumber);
         list.add(ChassisNumber);
         list.add(BookOwner);
         list.add(BookOwnerTel);
         list.add(Branch);
         boolean isAdded = new VehicleDao().insertVehicle(list);
         return isAdded;
    }

}

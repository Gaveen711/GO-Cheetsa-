/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import dao.BookingDao;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "add_booking", urlPatterns = {"/add_booking"})
public class add_booking extends HttpServlet {

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
           String branch =  request.getParameter("branch");
           String vehicleType =  request.getParameter("vehicleTypeTXT");
           String endLocation =  request.getParameter("endLocation");
           String startLocation =  request.getParameter("startLocation");
           String driverTXt =  request.getParameter("driverTXt");
           String vehicleNumTXT =  request.getParameter("vehicleNumTXT");
           
           HttpSession session = request.getSession();
           String customer = (String) session.getAttribute("email");
           
           if((addBooking(customer, startLocation, endLocation,vehicleType,branch,driverTXt,vehicleNumTXT)) && (driverBooked(driverTXt))){
                out.println("<script type='text/javascript'>");
	        out.println("alert('Booking Adding Success');");
	        out.println("location='./user/customer_dashboard.jsp?id="+vehicleType+"'");
		out.println("</script>");
        
             }else{
                out.println("<script type='text/javascript'>");
	        out.println("alert('Booking Adding Not Success');");
	        out.println("location='./user/customer_dashboard.jsp?id="+vehicleType+"'");
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

    private boolean addBooking(String customer, String startLocation, String endLocation, String vehicleType, String branch,String driverTXt,String vehicleNumTXT) {
         ArrayList<Object> list=new ArrayList<>();
         list.add(driverTXt);
         list.add(vehicleNumTXT);
         list.add(customer);
         list.add(startLocation);
         list.add(endLocation);
         list.add(vehicleType);
         list.add(branch);
         boolean isAdded = new BookingDao().insertBooking(list);
         return isAdded;
    }

    private boolean driverBooked(String driverTXt) {
        ArrayList<Object> list=new ArrayList<>();
        list.add(driverTXt);
        boolean isAdded = new DriverDao().driverBooked(list);
        return isAdded;
    }

}

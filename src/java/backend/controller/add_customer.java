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
@WebServlet(name = "add_customer", urlPatterns = {"/add_customer"})
public class add_customer extends HttpServlet {

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
             String telephoneNumber =  request.getParameter("telephoneNumber");
             String email =  request.getParameter("email");
             String address =  request.getParameter("address");
             String password =  request.getParameter("password");
             String name =  request.getParameter("name");
             
             if(addCustomer(name,telephoneNumber,password,email) && addUser(password,email)){
                out.println("<script type='text/javascript'>");
	        out.println("alert('Account Creating Success');");
	        out.println("location='./user/login.jsp'");
		out.println("</script>");
        
             }else{
                out.println("<script type='text/javascript'>");
	        out.println("alert('Account Creating Not Success');");
	        out.println("location='./user/index.jsp'");
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

    private boolean addCustomer(String name, String telephoneNumber, String password, String email) {
         ArrayList<Object> list=new ArrayList<>();
         list.add(name);
         list.add(telephoneNumber);
         list.add(password);
         list.add(telephoneNumber);
         list.add(email);
         boolean isAdded = new CustomerDao().insertCustomer(list);
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

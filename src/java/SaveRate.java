/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Esraa
 */
@WebServlet(urlPatterns = {"/SaveRate"})
public class SaveRate extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String rate=request.getParameter("rating");

            ServletContext context=request.getServletContext();
            
            int id=Integer.parseInt(context.getAttribute("getid").toString());
            int oldRate=Integer.parseInt(context.getAttribute("getrate").toString());
            
            int checkRate=0;
            if(rate.equals("star-1"))
            {
                checkRate=1;
            }
            else if(rate.equals("star-2"))
            {
                checkRate=2;
            }
            else if(rate.equals("star-3"))
            {
                checkRate=3;
                out.print(checkRate);
            }
            else if(rate.equals("star-4"))
            {
                checkRate=4;
            }
            else if(rate.equals("star-5"))
            {
                checkRate=5;
            }
             
            //out.print("id = "+id +"<br>"+"oldRate = "+oldRate+"<br>+"+"CheckRate = "+checkRate +"ratttttt : "+rate);
           int newRate=oldRate+checkRate;
            DBConnection conn = new DBConnection();
            conn.Connectiontomysql("ia_project");
            conn.statement = conn.connection.prepareStatement("UPDATE `advertise` SET `rate`='"+newRate+"' WHERE `id`='"+id+"' ");
            conn.statement.executeUpdate();
            conn.statement.close();
            conn.connection.close();
            response.sendRedirect("HomePageServlet");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveRate.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveRate.class.getName()).log(Level.SEVERE, null, ex);
        }
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

}

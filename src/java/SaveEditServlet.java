/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Esraa
 */
@WebServlet(urlPatterns = {"/SaveEditServlet"})
public class SaveEditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session=request.getSession();
            String new_name ,old_mail , new_phone , new_pass , new_mail  ;
            
            old_mail=(String) session.getAttribute("Email");
            
            new_name=(String) request.getParameter("name")    ;
            new_phone=(String) request.getParameter("phone")  ;
            new_pass=(String) request.getParameter("password") ;
            new_mail=(String) request.getParameter("email") ;
            DBConnection conn = new DBConnection();
            conn.Connectiontomysql("ia_project");
            
            
            if(!(new_name.equals("")))
            {
               conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE user SET UserName ='"+new_name+"'where email='"+old_mail+"'");
               conn.statement.executeUpdate();
            }
            if(!(new_phone.equals("")))
            {
              conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE user SET phone ='"+new_phone+"'where email='"+old_mail+"'");
              conn.statement.executeUpdate();  
            }
            if(!(new_pass.equals("")))
            {
              conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE user SET password ='"+new_pass+"'where email='"+old_mail+"'");
              conn.statement.executeUpdate();  
            }
            if(!(new_mail.equals("")))
            {
              conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE user SET email ='"+new_mail+"'where email='"+old_mail+"'");
              conn.statement.executeUpdate();  
               session.removeAttribute("Email");
              session.setAttribute("Email", new_mail);
            }
//            conn.statement.close();
            conn.connection.close();
            
            response.sendRedirect("GetProfileServlet");
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
            Logger.getLogger(SaveEditServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SaveEditServlet.class.getName()).log(Level.SEVERE, null, ex);
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

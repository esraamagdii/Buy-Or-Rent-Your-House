/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.DBConnection;
import DBConnection.SendEmail;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.xml.security.exceptions.Base64DecodingException;
import org.apache.xml.security.utils.Base64;

/**
 *
 * @author Esraa
 */
@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws org.apache.xml.security.exceptions.Base64DecodingException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Base64DecodingException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name, password, phone, date, email, item;
            name = request.getParameter("name");
            password = request.getParameter("password");
            phone = request.getParameter("phone");
            email = request.getParameter("email");
            date = request.getParameter("birth");
            item = request.getParameter("item");

            SendEmail mail=new SendEmail();
            mail.confirm(email);
            DBConnection conn = new DBConnection();
            conn.Connectiontomysql("ia_project");
            conn.statement = conn.connection.prepareStatement("SELECT userName FROM user WHERE userName=?");
            conn.statement.setString(1, name);
            ResultSet RS = conn.statement.executeQuery();

            if (RS.next()) {
                //out.print("<br>"+"UserName exists");
                out.print("UserName exists!");
                conn.statement.close();
                conn.connection.close();
                //response.sendRedirect("Register.jsp");
            } 
            else {
                HttpSession session = request.getSession(true);
                session.setAttribute("UserName", name);
                session.setAttribute("Password", password);
                session.setAttribute("Email", email);
                session.setMaxInactiveInterval(60*60*60);
                byte[] data = null;
                String dirName = "C:\\Users\\Esraa\\Documents\\NetBeansProjects\\Final_IA_Project\\Final_IA_Project\\IA_Project\\web\\";
                ByteArrayOutputStream baos = new ByteArrayOutputStream(1000);
                BufferedImage img = ImageIO.read(new File(dirName, "default1.jpg"));
                ImageIO.write(img, "jpg", baos);
                byte[] bytearray = baos.toByteArray();
                
                conn = new DBConnection();
                conn.Connectiontomysql("ia_project");
                conn.statement = conn.connection.prepareStatement("insert into user(userName,password,email,phone,birth,gender,userPicture) VALUES (?,?,?,?,?,?,?)");
                conn.statement.setString(1, name);
                conn.statement.setString(2, password);
                conn.statement.setString(3, email);
                conn.statement.setString(4, phone);
                conn.statement.setString(5, date);
                conn.statement.setString(6, item);
                conn.statement.setBytes(7, bytearray);
                conn.statement.executeUpdate();
                conn.statement.close();
                conn.connection.close();
                response.sendRedirect("HomePageServlet");
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
        try {
            try {
                processRequest(request, response);
            } catch (Base64DecodingException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (Base64DecodingException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.Advertise;
import DBConnection.DBConnection;
import DBConnection.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
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
@WebServlet(urlPatterns = {"/GetProfileServlet"})
public class GetProfileServlet extends HttpServlet {

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
           //session.removeAttribute("mydata");
           String email =(String) session.getAttribute("Email");
            out.print(email);
            User user =new User();
            
            DBConnection conn=new DBConnection();
            conn.Connectiontomysql("ia_project");
            //out.println("hi before connecting ");
            conn.statement=(PreparedStatement)conn.connection.prepareStatement("select UserName, userPicture,checkAdmin,phone,password from user where email='"+email+"'");
            ResultSet result =conn.statement.executeQuery();
            if(result.next())
            {
                user.setEmail(email);
                user.setName(result.getString("UserName"));
                user.ProfilePic=result.getBytes("userPicture");
                user.setCheckAdmin(result.getBoolean("checkAdmin"));
                user.setPassword(result.getString("password"));
                user.setPhone(result.getString("phone"));
            }
            
            
            ///////////////////////////////////////////// select advertisments 
                
                user.my_Advertisements=new ArrayList<>();
                Advertise a ;
                conn.statement = conn.connection.prepareStatement("SELECT * FROM `advertise` where userEmail ='"+email+"'");
                
                ResultSet res1=conn.statement.executeQuery();
                
                while(res1.next())
                {
                    a=new Advertise();
                    a.setDescription(res1.getString("description"));
                    a.setSize(res1.getDouble("size"));
                    a.setFloor(Integer.parseInt(res1.getString("floor")));
                    a.setStatus(res1.getString("status"));
                    a.setType(res1.getString("type"));
                    a.setContact(res1.getString("contact"));
                    a.setLocation(res1.getString("location"));
                    a.setId(res1.getInt("id"));
                    //out.println(a.getFloor());
                    //out.println("hi");
                    System.out.println("id = "+a.getId());
                    out.print(a.getId());
                    conn.statement = conn.connection.prepareStatement("SELECT * FROM `pic` WHERE id=?");
                    conn.statement.setInt(1, a.getId());
                    ResultSet res2=conn.statement.executeQuery();
                    a.AdvertisePics=new ArrayList<>();
                    while(res2.next())
                    {
                       a.AdvertisePics.add(res2.getBytes("img"));
                    }
                    user.my_Advertisements.add(a);
                } 
            conn.statement.close(); 
            conn.connection.close();
            session.setAttribute("mydata", user);
            //out.println(user.my_Advertisements.size());

           response.sendRedirect("Profile.jsp");
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
            Logger.getLogger(GetProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GetProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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

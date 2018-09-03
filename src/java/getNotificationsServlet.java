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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(urlPatterns = {"/getNotificationsServlet"})
public class getNotificationsServlet extends HttpServlet {

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
            User u =(User) session.getAttribute("mydata");
            String mail =u.getEmail();
            String type ;
            String to_found;
            
            DBConnection conn=new DBConnection();
            conn.Connectiontomysql("ia_project");
            
            conn.statement = conn.connection.prepareStatement("SELECT * FROM to_notify WHERE user_mail=?");
            conn.statement.setString(1,mail );
            ResultSet result=conn.statement.executeQuery();
            
            
            u.notification=new ArrayList();
            
            Advertise a;
            while(result.next())
            {
                type=result.getString("wanted_type")  ;
                to_found=result.getString("value");
                if(type.equals("size"))
                {
                    conn.statement = conn.connection.prepareStatement("SELECT * FROM advertise WHERE "+type+"="+Float.parseFloat(to_found));
                    ResultSet result2=conn.statement.executeQuery();
                    while(result2.next())
                  {
                    a=new Advertise();
                    a.setDescription(result2.getString("description"));
                    a.setSize(result2.getDouble("size"));
                    a.setFloor(Integer.parseInt(result2.getString("floor")));
                    a.setStatus(result2.getString("status"));
                    a.setType(result2.getString("type"));
                    a.setContact(result2.getString("contact"));
                    a.setLocation(result2.getString("location"));
                    a.setId(result2.getInt("id"));
                    conn.statement = conn.connection.prepareStatement("SELECT * FROM `pic` WHERE id=?");
                    conn.statement.setInt(1, a.getId());
                    ResultSet res3=conn.statement.executeQuery();
                    a.AdvertisePics=new ArrayList<>();
                    while(res3.next())
                    {
                       a.AdvertisePics.add(res3.getBytes("img"));
                    }
                    u.notification.add(a);
                  }
                }
                else
                {
                    conn.statement = conn.connection.prepareStatement("SELECT * FROM advertise WHERE "+type+"='"+to_found+"'");
                    ResultSet result2=conn.statement.executeQuery();
                              while(result2.next())
                   {
                    a=new Advertise();
                    a.setDescription(result2.getString("description"));
                    a.setSize(result2.getDouble("size"));
                    a.setFloor(Integer.parseInt(result2.getString("floor")));
                    a.setStatus(result2.getString("status"));
                    a.setType(result2.getString("type"));
                    a.setContact(result2.getString("contact"));
                    a.setLocation(result2.getString("location"));
                    a.setId(result2.getInt("id"));
                    conn.statement = conn.connection.prepareStatement("SELECT * FROM `pic` WHERE id=?");
                    conn.statement.setInt(1, a.getId());
                    ResultSet res3=conn.statement.executeQuery();
                    a.AdvertisePics=new ArrayList<>();
                    while(res3.next())
                    {
                       a.AdvertisePics.add(res3.getBytes("img"));
                    }
                    u.notification.add(a);
                  }
                }
    
            }
            
            conn.connection.close();
            conn.statement.close();
            session.removeAttribute("mydata");
            session.setAttribute("mydata", u);
            
            response.sendRedirect("DisplayNotifications.jsp");
            
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
            Logger.getLogger(getNotificationsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(getNotificationsServlet.class.getName()).log(Level.SEVERE, null, ex);
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

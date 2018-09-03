/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.Advertise;
import DBConnection.Comments;
import DBConnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet(urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

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

            String size = request.getParameter("size");
            String type = request.getParameter("type");
            String status = request.getParameter("status");
            String area = request.getParameter("area");
            String floor = request.getParameter("floor");
           
            
            ArrayList<Advertise> SearchAdvertises = new ArrayList<>();
            DBConnection conn = new DBConnection();
            conn.Connectiontomysql("ia_project");
            conn.statement = conn.connection.prepareStatement("SELECT * FROM `advertise` where size='"+size+"' || type='"+type+"' || status='"+status+"' || floor='"+floor+"'" );
            ResultSet RS = conn.statement.executeQuery();
            while (RS.next()){
                Advertise advertise = new Advertise();
                advertise.setDescription(RS.getString("description"));
                advertise.setSize(RS.getDouble("size"));
                advertise.setFloor(RS.getInt("floor"));
                advertise.setStatus(RS.getString("status"));
                advertise.setType(RS.getString("type"));
                advertise.setContact(RS.getString("contact"));
                advertise.setLocation(RS.getString("location"));
                advertise.setId(RS.getInt("id"));
                conn.statement = conn.connection.prepareStatement("SELECT * FROM `pic` WHERE `id`=?");
                conn.statement.setInt(1, advertise.getId());
                ResultSet rs1 = conn.statement.executeQuery();
                ArrayList<byte[]> pics=new ArrayList<>();
                while(rs1.next())
                {
                    pics.add(rs1.getBytes("img"));
                }
                advertise.setAdvertisePics(pics);
                conn.statement = conn.connection.prepareStatement("SELECT * FROM `Comments` WHERE `id`=?");
                conn.statement.setInt(1, advertise.getId());
                ResultSet rs2 = conn.statement.executeQuery();
                ArrayList<Comments> comm = new ArrayList<Comments>();
                
                while(rs2.next())
                {
                    Comments comment=new Comments();
                    comment.setComment(rs2.getString("comment"));
                    comment.setId(rs2.getInt("id"));
                    comm.add(comment);
                }
                
                advertise.setComments(comm);
                SearchAdvertises.add(advertise);
            }
            conn.connection.close();
            conn.statement.close();
            
            HttpSession session=request.getSession();
            session.setAttribute("SearchAdvertises",SearchAdvertises);
            response.sendRedirect("Search.jsp");
            
            
            
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
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.DBConnection;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Esraa
 */
@WebServlet(urlPatterns = {"/CreateAdvertiseServlet"})
@MultipartConfig
public class CreateAdvertiseServlet extends HttpServlet {

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

            /* TODO output your page here. You may use following sample code. */
            InputStream inputStream = null;
            String description, size, floor, status, type, userEmail, contact, location;
            description = request.getParameter("desc");
            size = request.getParameter("size");
            floor = request.getParameter("floor");
            status = request.getParameter("status");
            type = request.getParameter("type");
            contact = request.getParameter("contact");
            location = request.getParameter("location");

            ArrayList<byte[]> pictures = new ArrayList<>();
            // Part filePart= request.getPart("photos").getInputStream();
            Iterator<Part> partsIterator = request.getParts().iterator();
            byte buf[] = new byte[8192];

            while (partsIterator.hasNext()) {
                int qt;
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                Part part = partsIterator.next();
                InputStream my_pic = part.getInputStream();
                while ((qt = my_pic.read(buf)) != -1) {
                    baos.write(buf, 0, qt);
                }
                byte[] result = baos.toByteArray();
                pictures.add(result);
//                byte[] data = Base64.getEncoder().encode(result);
//                String image_str = new String(data);
//                String image_value = "data:image/jpg;base64," + image_str;
//                out.println("<img  src= " + image_value + ">" + "<br>");
//                out.print("<br>");
            }
            System.out.print("<br>" + "size of pic: " + pictures.size());

           // ServletContext context = request.getServletContext();
           HttpSession session=request.getSession();
            userEmail = session.getAttribute("Email").toString();
            out.print(userEmail);

            DBConnection conn = new DBConnection();
            conn.Connectiontomysql("ia_project");
            conn.statement = conn.connection.prepareStatement("insert into advertise(description,size,status,floor,type,contact,userEmail,location) VALUES (?,?,?,?,?,?,?,?)");
            conn.statement.setString(1, description);
            conn.statement.setString(2, size);
            conn.statement.setString(3, status);
            conn.statement.setString(4, floor);
            conn.statement.setString(5, type);
            conn.statement.setString(6, contact);
            conn.statement.setString(7, userEmail);
            conn.statement.setString(8, location);
            conn.statement.executeUpdate();
            conn.statement.close();
            conn.connection.close();

            DBConnection conn1 = new DBConnection();
            conn1.Connectiontomysql("ia_project");

            conn1.statement = conn1.connection.prepareStatement("SELECT id FROM advertise WHERE `userEmail` =?");
            conn1.statement.setString(1, userEmail);
            ResultSet RS = conn1.statement.executeQuery();
            int id = 0;
            while (RS.next()) {
                id = RS.getInt("id");

            }
            for (int i = 6; i < pictures.size(); i++) {
                byte[] result=pictures.get(i);
                byte[] data = Base64.getEncoder().encode(result);
                String image_str = new String(data);
                String image_value = "data:image/jpg;base64," + i,mage_str;
                out.println("<img  src= " + image_value + ">" + "<br>");
                out.print("<br>");
                conn1.statement = conn1.connection.prepareStatement("INSERT INTO pic(img,id) VALUES (?,?)");
                conn1.statement.setBytes(1, pictures.get(i));
                conn1.statement.setInt(2, id);
                conn1.statement.executeUpdate();
            }
            conn1.statement.close();
            conn1.connection.close();
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
            Logger.getLogger(CreateAdvertiseServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CreateAdvertiseServlet.class.getName()).log(Level.SEVERE, null, ex);
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

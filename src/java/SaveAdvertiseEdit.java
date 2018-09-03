/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnection.DBConnection;
import DBConnection.User;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/SaveAdvertiseEdit"})
@MultipartConfig
public class SaveAdvertiseEdit extends HttpServlet {

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
            
            User u; 
            HttpSession session=request.getSession();
            u=(User) session.getAttribute("mydata");
            
            
            
            String new_description, new_status , new_type , new_contact ;
            String new_size ;
            String new_floor;
            int id ;
            
            new_description=request.getParameter("desc");
            new_status = request.getParameter("status");
            new_type=request.getParameter("type");
            new_contact=request.getParameter("contact") ;
            new_size = request.getParameter("size") ;
            new_floor = request.getParameter("floor")  ;
            id=Integer.parseInt(request.getParameter("index"));
            
            DBConnection conn =new  DBConnection();
            conn.Connectiontomysql("ia_project");
            
            if(!(new_description.equals("")) )
            {
               conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE advertise SET description ='"+new_description+"'where id="+id);
               conn.statement.executeUpdate(); 
               u.my_Advertisements.get(id).setDescription(new_description);
            }
            if(!(new_type.equals("")))
            {
               conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE advertise SET  type='"+new_type+"'where id="+id);
               conn.statement.executeUpdate();
               u.my_Advertisements.get(id).setType(new_type);
            }
            if(!(new_status.equals("")))
            {
                conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE advertise SET  status='"+new_status+"'where id="+id);
                conn.statement.executeUpdate();
                u.my_Advertisements.get(id).setStatus(new_status);
            }
            if(!(new_contact.equals("")))
            {
                conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE advertise SET contact ='"+new_contact+"'where id="+id);
                conn.statement.executeUpdate();
                u.my_Advertisements.get(id).setContact(new_contact);
            }
            if(!(new_size.equals("")))
            {
                conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE advertise SET  size="+Float.parseFloat(new_size)+"where id="+id);
                conn.statement.executeUpdate();
                u.my_Advertisements.get(id).setSize(Integer.parseInt(new_size));
            }
            if(!(new_floor.equals("")))
            {
                conn.statement=(PreparedStatement) conn.connection.prepareStatement("UPDATE advertise SET  floor='"+new_floor+"'where id="+id);
                conn.statement.executeUpdate();
                u.my_Advertisements.get(id).setFloor(Integer.parseInt(new_floor));
            }
            
            ArrayList<byte[]> pictures = new ArrayList<>();
            // Part filePart= request.getPart("photos").getInputStream();
            Iterator<Part> partsIterator = request.getParts().iterator();
            byte buf[] = new byte[8192];

            while (partsIterator.hasNext()) 
            {
                int qt;
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                Part part = partsIterator.next();
                InputStream my_pic = part.getInputStream();
                while ((qt = my_pic.read(buf)) != -1) 
                {
                    baos.write(buf, 0, qt);
                }
                byte[] result = baos.toByteArray();
                pictures.add(result);
                //////////////////////////////////////////////////////////////////////////
                
            }
            
//            out.print("size = "+ pictures.size());
//            for(int i=6;i<pictures.size()-1;i++)
//            {
//                byte[] data = Base64.getEncoder().encode(pictures.get(i));
//                out.print(data);
//                String image_str = new String(data);
//                
//                String image_value = "data:image/jpg;base64," + image_str;
//                out.println("<img  src= " + image_value + ">" + "<br>");
//                
//            }
              out.println("id=   "+id);
              
              int siz=pictures.size() ;
              if(siz >= 8)
              {
                conn.statement=(PreparedStatement) conn.connection.prepareStatement("delete from  pic where  id="+id);
                conn.statement.executeUpdate();
                u.my_Advertisements.get(id).AdvertisePics=new ArrayList();
                for(int i=6 ; i<siz-1 ; i++ )
                {//INSERT INTO pic(img,id) VALUES (?,?)
                    conn.statement=(PreparedStatement) conn.connection.prepareStatement("INSERT INTO pic(img,id) VALUES (?,?)");
                    conn.statement.setBytes(1, pictures.get(i));
                    conn.statement.setInt(2, id);
                    conn.statement.executeUpdate();
                    u.my_Advertisements.get(id).AdvertisePics.add(pictures.get(i));
                }
              }
            conn.connection.close();
            conn.statement.close();
            session.removeAttribute("mydata");
            session.setAttribute("mydata", u);

            /* TODO output your page here. You may use following sample code. */
            
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
            Logger.getLogger(SaveAdvertiseEdit.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SaveAdvertiseEdit.class.getName()).log(Level.SEVERE, null, ex);
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

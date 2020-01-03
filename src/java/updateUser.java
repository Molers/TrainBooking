/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import controll.userData;
import controll.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/update"})
public class updateUser extends HttpServlet {

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
            String uname = request.getParameter("userName");
            String pass = request.getParameter("password");
            
            HttpSession session = request.getSession(false);

            Connection con = DB.getActiveConnection();
            Statement stmt = con.createStatement();
            
            userData data = (userData) session.getAttribute("user");
            String currentUname = data.getuserName();
            int i=0;
            
            if(uname.isEmpty() && !pass.isEmpty()){
                i = stmt.executeUpdate("update users set password='"+pass+"' where userName='"+currentUname+"'");
                data.setPass(pass);
            }
            if(pass.isEmpty() && !uname.isEmpty()){
                i = stmt.executeUpdate("update users set userName='" + uname + "'  where userName='"+currentUname+"'");
                data.setuserName(uname);
            }
            else if (!pass.isEmpty() && !uname.isEmpty()){
                i = stmt.executeUpdate("update users set userName='" + uname + "' , password='"+pass+"' where userName='"+currentUname+"'");
                data.setPass(pass);
                data.setuserName(uname);
            }
            
            if(i>0){
                out.print("Updated Successfully");
                request.getSession().setAttribute("user", data);
                request.getRequestDispatcher("profile.jsp").include(request, response); 
            }
            else{
                out.print("Error happened please try again");
                request.getRequestDispatcher("updateUser.jsp").include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
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
     * @throws java.sql.SQLException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updateUser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updateUser.class.getName()).log(Level.SEVERE, null, ex);
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

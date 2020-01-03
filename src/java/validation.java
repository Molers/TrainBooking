
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


@WebServlet(urlPatterns = {"/validation"})
public class validation extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        try (PrintWriter out = response.getWriter()) {

            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            
            Connection con = DB.getActiveConnection();
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            ResultSet rs = null;
            ResultSet rs2 = null;
            int count1 = 0;
            int count2 = 0;
            try {
                rs = stmt.executeQuery("select count(userID) AS 'counter' from users where userName = '"+userName+"'");
                rs2 = stmt2.executeQuery("select count(userID) AS 'counter' from users where email = '"+email+"'");
                rs.next();
                rs2.next();
                count1 = rs.getInt("counter");
                count2 = rs2.getInt("counter");
                
                 if (count1 > 0 ) {
                    out.println("username already exists");
                    out.close();
                 }
                    
                 else if (count1 ==0 ){
                     out.println("username is valid");
                     out.close();
                 }
                    
                if (count2 > 0) {
                    out.println("email already exists");
                    out.close();
                }
                    
                else if (count2 ==0){
                    out.println("email is valid");
                    out.close();
                }
                    
                
            } catch (SQLException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally{
                out.close();
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(validation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(validation.class.getName()).log(Level.SEVERE, null, ex);
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

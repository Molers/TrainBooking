


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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
            PrintWriter out = response.getWriter();
            System.out.println("yanggang................login");
            String userName = request.getParameter("userName");
        System.out.println(userName);
            String pass = request.getParameter("password");
        System.out.println(pass);
            userData data = new userData();
            Connection con = DB.getActiveConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            String type = (String)request.getParameter("type");
            System.out.println(type);

        Statement stmt1 = con.createStatement();
        ResultSet rs2 = null;
        try{
            rs2=stmt1.executeQuery("select * from users where userName = '" + userName + "' and password = '" + pass + "' ");
            if(rs2.next()){
                type=rs2.getString("type");

            }else{
                request.setAttribute("errorMessage", "用户名或密码错误");
                RequestDispatcher rd = request.getRequestDispatcher("newlogin.jsp");
                rd.forward(request, response);

            }
        }catch (SQLException ex){
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        }

        stmt1.close();
        rs2.close();


            if (type.equals("user")) {

                try {
                    rs = stmt.executeQuery("select * from users where userName = '" + userName + "' and password = '" + pass + "' and type = '"+type+"' ");
                    if (rs.next()) {
                        System.out.println("yanggang..............user..login");
                        HttpSession session = request.getSession(true);

                        data.setID(rs.getInt("userID"));
                        data.setName(rs.getString("name"));
                        data.setuserName(rs.getString("userName"));
                        data.setEmail(rs.getString("email"));
                        data.setPass(rs.getString("password"));

                        session.setAttribute("user", data);

//                        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");

                        RequestDispatcher rd = request.getRequestDispatcher("newprofile.jsp");
                        rd.include(request, response);
                    } else {
                        request.setAttribute("errorMessage", "用户名或密码错误");
                        RequestDispatcher rd = request.getRequestDispatcher("newlogin.jsp");
                        rd.forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else{
                try {
                    rs = stmt.executeQuery("select * from users where userName = '" + userName + "' and password = '" + pass + "' and type = '"+type+"' ");
                    if (rs.next()) {
                        HttpSession session = request.getSession(true);
                        System.out.println("yanggang..............notuser..login");
                        data.setID(rs.getInt("userID"));
                        data.setName(rs.getString("name"));
                        data.setuserName(rs.getString("userName"));
                        data.setEmail(rs.getString("email"));
                        data.setPass(rs.getString("password"));

                        session.setAttribute("user", data);

                        RequestDispatcher rd = request.getRequestDispatcher("tripsInfo.jsp");
                        rd.include(request, response);
                    } else {
                        request.setAttribute("errorMessage", "用户名或密码错误");
                        RequestDispatcher rd = request.getRequestDispatcher("alogin.jsp");
                        rd.forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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

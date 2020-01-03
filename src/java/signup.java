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

@WebServlet(urlPatterns = {"/signup"})
public class signup extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        String type = "user";
        System.out.println(type);
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String pass = request.getParameter("password");

        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        System.out.println("yanggang..................signup");
        if (type.equals("user")) {
            String sql = "insert into users (`name`,`email`, `userName`,`password`,`type`) "
                    + "VALUES  ('" + name + "', '" + email + "','" + userName + "', '" + pass + "', '"+type+"' )";

            int rows = 0;
            try {
                rows = stmt.executeUpdate(sql);
            } catch (SQLException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "用户已存在");
               RequestDispatcher view = request.getRequestDispatcher("newsignup2.jsp");
               view.forward(request, response);


//                out.flush();
//                out.println("<script>");
//                out.println("alert('此用户名已存在，请重新输入！');");
//                out.println("history.back();");
//                out.println("</script>");

            }
            if (rows > 0) {
                request.setAttribute("message", "注册成功");
                request.getRequestDispatcher("newlogin.jsp").forward(request, response);
            }
        }
        else {
            String Checkcode = request.getParameter("Checkcode");
            if (Checkcode.equals("admin")) {
                String sql = "insert into users (`name`,`email`, `userName`,`password`,`type`) "
                        + "VALUES  ('" + name + "', '" + email + "','" + userName + "', '" + pass + "', '" + type + "' )";

                int rows = 0;
                try {
                    rows = stmt.executeUpdate(sql);
                } catch (SQLException ex) {
                    request.setAttribute("message", "Admin already exists");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
                if (rows > 0) {
                    request.setAttribute("message", "Admin Registered");
                    request.getRequestDispatcher("alogin.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("CheckcodeMessage", "无效内部码");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);

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

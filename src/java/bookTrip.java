
import controll.AllTrips;
import controll.booking;
import controll.userData;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/bookTrip"})
public class bookTrip extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession(false);
            userData user = (userData)session.getAttribute("user");
            int userID = user.getID();
            String userName=user.getuserName();
            
          //  int tripNum = Integer.parseInt(request.getParameter("tripNum"));
            String tNum = request.getParameter("tripNum");

            
            String p = request.getParameter("price");
            double price = Double.parseDouble(p);
            
            int seats = Integer.parseInt(request.getParameter("seats"));
            
            double charge = price*seats;
            
            System.out.println(tNum+"    "+userName+"   "+price+"  "+charge);
            
            booking.book(tNum, userName, seats, charge);
            
            if(AllTrips.updateSeats(tNum, seats)){
                request.setAttribute("message", "购买成功");
                RequestDispatcher rd = request.getRequestDispatcher("allBookings.jsp");
                rd.forward(request, response);

            }else {
                request.setAttribute("message", "剩余座位数量不足");
                RequestDispatcher rd = request.getRequestDispatcher("allBookings.jsp");
                rd.forward(request, response);


            }
            

        } catch (ParseException e) {
            e.printStackTrace();
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
            Logger.getLogger(bookTrip.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(bookTrip.class.getName()).log(Level.SEVERE, null, ex);
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

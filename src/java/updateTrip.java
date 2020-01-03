import controll.AllTrips;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/updateTrip"})
public class updateTrip extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        try (PrintWriter out = response.getWriter()) {

            String tripNum = request.getParameter("id");
            String dep = request.getParameter("depTime");
            String arr = request.getParameter("arrTime");

            System.out.println("--------------------------------"+request.getParameter("date"));
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
            String date=sdf.format(date1);

            String seats=request.getParameter("seats");
            String pr = request.getParameter("price");
            String totaltime=request.getParameter("totaltime");
            double price = Double.parseDouble(pr);

            // System.out.println(tripNum+"  "+dep+"  "+arr+"  "+d+"  "+price);


            boolean result = AllTrips.updateTrip(tripNum, dep, arr, date, price,seats,totaltime);

            if (result){
                request.setAttribute("message", "导入成功");
                //request.setAttribute("onemessage","dddd");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("tripsInfo.jsp");
                requestDispatcher.forward(request, response);
            }
            else{
                request.setAttribute("message", "导入失败");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("tripsInfo.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("message", "导入失败");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("tripsInfo.jsp");
            requestDispatcher.forward(request, response);
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
            Logger.getLogger(updateTrip.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updateTrip.class.getName()).log(Level.SEVERE, null, ex);
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
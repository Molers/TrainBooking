
import controll.DB;
import controll.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/addTrip"})
public class addTrip extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
            request.setCharacterEncoding("gbk");
            response.setCharacterEncoding("gbk");

            PrintWriter out = response.getWriter();
            Connection con = DB.getActiveConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            
//            String num = request.getParameter("trainNum");
//            int trainNum = Integer.parseInt(num);
            
            String source = request.getParameter("source");
            String destination = request.getParameter("destination");
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
            String date=sdf.format(date1);
            //String date = request.getParameter("date");
            //

            String dep = request.getParameter("departureTime");
            //Time departureTime = Time.valueOf(dep);

            String arr = request.getParameter("arrivalTime");
            //Time arrivalTime = Time.valueOf(arr);
            String totaltime=request.getParameter("totaltime");
            
            int reservedSeats = Integer.parseInt(request.getParameter("seats"));
            
            String pr = request.getParameter("price");
            double price = Double.parseDouble(pr);

            String tripNum = request.getParameter("tripNum");
            //int tripNum = Integer.parseInt(trnum);

           String tripdistance = request.getParameter("distance");
          // int tripdistance = Integer.parseInt(distance);

          //  rs = stmt.executeQuery("select * from train where trainNumber = '"+trainNum+"'");
//
//            if(!rs.next()){
//                request.setAttribute("message", "车次不存在");
//                request.getRequestDispatcher("addTrip.jsp").forward(request, response);
//            }
//            else {
                System.out.println(destination+"........"+source);
                String sql = "insert into trips ( tripNum,source, destination, depTime, arrivTime, totaltime, seats, price,  data )values('" + tripNum + "', '" + source + "', '" + destination + "', '" + dep + "', "
                        + "'" + arr + "', '" + totaltime + "', '" +reservedSeats + "', '" +price  + "','"+date+"')";
                int rows = 0;
                try {
                    rows = stmt.executeUpdate(sql);

                } catch (Exception e) {
                    request.setAttribute("message", "旅程已经存在");
                    request.getRequestDispatcher("addTrip.jsp").forward(request, response);
                }
                if (rows > 0) {
                    request.setAttribute("message", "旅程添加成功");
                    request.getRequestDispatcher("addTrip.jsp").forward(request, response);

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
            Logger.getLogger(addTrip.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException e) {
            e.printStackTrace();
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
            Logger.getLogger(addTrip.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException e) {
            e.printStackTrace();
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

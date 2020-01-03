/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import controll.DB;
import controll.Train;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

/**
 *
 * @author Ahmed
 */
@WebServlet(urlPatterns = {"/updatesite"})
public class updatesite extends HttpServlet {

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
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        PrintWriter out = response.getWriter();

        String tripNum = request.getParameter("tripNum");
        int StationOder = Integer.parseInt(request.getParameter("StationOrder"));

        System.out.println("YGNB"+tripNum+StationOder+"ZWLGNB");

        String addivTime =request.getParameter("arrivTime");
        String dePime=request.getParameter("depTime");
        String date=request.getParameter("date");

        boolean result =myupdateTrain(tripNum, StationOder,addivTime,dePime,date);

        if (result){
            request.setAttribute("message", "修改成功");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/tripsInfo.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            request.setAttribute("message", "修改失败");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/tripsInfo.jsp");
            requestDispatcher.forward(request, response);
        }

    }

    public boolean myupdateTrain(String tripNum,int StationOder,String addivTime, String depTime,String date) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        System.out.println("yanggang......updateTrip");
        String query = "update site set arrivTime='"+addivTime+"', depTime='"+depTime+"', date='"+date+"' where trip = '"+tripNum+"' and StationOrder= '"+StationOder+"'";
        int i = stmt.executeUpdate(query);
        if(i>0)
            return true;
        return false;

    };


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
            Logger.getLogger(updateTrain.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updateTrain.class.getName()).log(Level.SEVERE, null, ex);
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

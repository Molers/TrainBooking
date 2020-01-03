import controll.DB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(urlPatterns = {"/addsite"})
public class addsite extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        String trip= request.getParameter("tripNum");
        String location= request.getParameter("location");
        int StationOrder=Integer.parseInt(request.getParameter("StationOrder"));

        System.out.println("==============================");
        System.out.println(StationOrder);

        String depTime= request.getParameter("depTime");
        String arrivTime= request.getParameter("arrivTime");
        String date=request.getParameter("date");


        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet  rs=null;
        rs=stmt.executeQuery("select * from site where trip='"+trip+"'");
        int s=0;
        while(rs.next()){
            s++;
        }
        Statement stmt3 = con.createStatement();
        ResultSet  rs3=null;
        rs3=stmt3.executeQuery("select * from trips where tripNum='"+trip+"'");
        int s3=0;
        while(rs3.next()){
            s3++;
        }


//        if(StationOrder!=(s+1)){
//            request.setAttribute("errorMessage", "Invalid user or password");
//            RequestDispatcher rd = request.getRequestDispatcher("#");
//            rd.forward(request, response);
//
//        }else{
if(StationOrder==(s+1)&&s3!=0){
        Statement stmt2 = con.createStatement();

        String query2= "insert into site (trip,StationOrder,arrivTime,depTime,location,date) values('" + trip + "', '" + StationOrder + "', '" + arrivTime + "', '" +depTime+ "', "
                + "'" +location +"','"+date+"')";
        try{
            int i=stmt2.executeUpdate(query2);
            if(i>0){

                request.setAttribute("message", "添加成功");
                RequestDispatcher rd = request.getRequestDispatcher("addStation.jsp");
                rd.forward(request, response);
            }else {
                request.setAttribute("message", "添加失败");
                RequestDispatcher rd = request.getRequestDispatcher("addStation.jsp");
                rd.forward(request, response);
            }


        }catch (SQLException e){
            request.setAttribute("message", "添加失败");
            RequestDispatcher rd = request.getRequestDispatcher("addStation.jsp");
            rd.forward(request, response);

        }
}else{
    if(s==0){
        request.setAttribute("message", "车次不存在");
        RequestDispatcher rd = request.getRequestDispatcher("addStation.jsp");
        rd.forward(request, response);
    }else{
        if(s3==0){
            request.setAttribute("message", "车次不存在");
            RequestDispatcher rd = request.getRequestDispatcher("addStation.jsp");
            rd.forward(request, response);

        }else{
            request.setAttribute("message", "站序错误");
            RequestDispatcher rd = request.getRequestDispatcher("addStation.jsp");
            rd.forward(request, response);
        }


    }


}






        //  stmt2.close();

        //}
        //



    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest( request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}

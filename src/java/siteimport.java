import controll.DB;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@MultipartConfig
@WebServlet(urlPatterns = {"/siteimport"})
public class siteimport extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");


        writeTo("yanggang2.xls", request.getPart("excel"));
        if(pushdate()){
            request.setAttribute("message", "导入成功");
            RequestDispatcher rd = request.getRequestDispatcher("tripsInfo.jsp");
            rd.include(request, response);

        }else {
            request.setAttribute("message", "导入失败");
            RequestDispatcher rd = request.getRequestDispatcher("tripsInfo.jsp");
            rd.include(request, response);

        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void writeTo(String fileName, Part part)throws IOException {
        InputStream in = part.getInputStream();
        OutputStream out = new FileOutputStream("d:/"+fileName);
        byte[] b = new byte[1024];
        int length = -1;
        while((length = in.read(b))!=-1)
        {
            out.write(b, 0, length);
        }
        in.close();
        out.close();
    }


    public boolean pushdate() throws  IOException  {

        jxl.Workbook rwb=null;
        Connection con = DB.getActiveConnection();
        Statement stmt = null;
        try {
            stmt = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        }

        try{

            InputStream is= new FileInputStream("D:\\yanggang2.xls");
            System.out.println("111111111");
            rwb= Workbook.getWorkbook(is);
            Sheet rs =rwb.getSheet(0);
            int rsRows =rs.getRows();
            System.out.println("2222222");
            for(int i=1;i<rsRows;i++){

                String trip=rs.getCell(0,i).getContents();System.out.print(trip);
                String StationOrder=rs.getCell(1,i).getContents();System.out.print(StationOrder);
                String arrivTime=rs.getCell(3,i).getContents();System.out.print(arrivTime);
                String depTime=rs.getCell(4,i).getContents();System.out.print(depTime);
                String location=rs.getCell(2,i).getContents();System.out.print(location);
                String date=rs.getCell(5,i).getContents();System.out.print(date);
//                String info7=rs.getCell(6,i).getContents();System.out.print(info7);
//                String info8=rs.getCell(7,i).getContents();System.out.print(info8);
//                String info9=rs.getCell(8,i).getContents();System.out.print(info9);
//                String info10=rs.getCell(9,i).getContents();System.out.println(info10);

                String sql = "insert into site (trip,StationOrder,arrivTime,depTime,location,date) values('" + trip + "', '" + StationOrder+ "', '" + arrivTime+ "', '" +depTime + "', "
                        + "'" + location + "', '" + date+ "')";
                try {
                    stmt.executeUpdate(sql);
                }catch (Exception e){
                    e.printStackTrace();
                    return false;
                }


            }
        } catch (BiffException e) {
            e.printStackTrace();
            return false;
        }
     return true;

    }
}

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
@WebServlet(urlPatterns = {"/import2"})
public class import2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");


        writeTo("yanggang.xls", request.getPart("excel"));
      if(pushdate()) {
          request.setAttribute("message", "导入成功");
          RequestDispatcher rd = request.getRequestDispatcher("tripsInfo.jsp");
          rd.include(request, response);
      } else{
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
                   return false;
               }

               try{

                   InputStream is= new FileInputStream("D:\\yanggang.xls");
                   System.out.println("111111111");
                   rwb= Workbook.getWorkbook(is);
                   Sheet rs =rwb.getSheet(0);
                   int rsRows =rs.getRows();
                   System.out.println("2222222");
                   for(int i=1;i<rsRows;i++){

                       String source=rs.getCell(1,i).getContents();System.out.print(source);
                       String destination=rs.getCell(2,i).getContents();System.out.print(destination);
                       String depTime=rs.getCell(3,i).getContents();System.out.print(depTime);
                       String arrivTime=rs.getCell(4,i).getContents();System.out.print(arrivTime);
                       String totaltime=rs.getCell(5,i).getContents();System.out.print(totaltime);
                       String seats=rs.getCell(6,i).getContents();System.out.print(seats);
                       String price=rs.getCell(7,i).getContents();System.out.print(price);
                       String tripNum=rs.getCell(0,i).getContents();System.out.print(tripNum);
                      // String info9=rs.getCell(8,i).getContents();System.out.print(info9);
                       String data=rs.getCell(8,i).getContents();System.out.println(data);

                       String sql = "insert into trips (source, destination, depTime, arrivTime, totaltime, seats, price, tripNum, data)" +
                               "values('" +source + "', '" + destination + "', '" + depTime + "', '" + arrivTime + "', "
                               + "'" + totaltime + "', '" + seats + "', '" + price + "', '" +tripNum + "','"+data+"')";

                           stmt.executeUpdate(sql);



                   }
               } catch (BiffException e) {
                   e.printStackTrace();
                   return false;
               } catch (SQLException e) {
                   e.printStackTrace();
               }
               return true;


           }
}

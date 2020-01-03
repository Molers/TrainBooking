import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import controll.DB;
import controll.Train;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.*;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/pull"})
public class pull extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建HSSFWorkbook对象(excel的文档对象)

        HSSFWorkbook wkb = new HSSFWorkbook();

        //在sheet里创建第三行
        try {
            wkb= pull();
        } catch (SQLException e) {
            e.printStackTrace();
        }


//输出Excel文件
        OutputStream output=response.getOutputStream();
        response.reset();
        response.setHeader("Content-disposition", "attachment; filename=details.xls");
        response.setContentType("application/msexcel");
        wkb.write(output);
        output.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public  static HSSFWorkbook pull () throws SQLException{
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        String query = ("select * from trips");
        rs = stmt.executeQuery(query);
        HSSFWorkbook wkb=new HSSFWorkbook();;
        //建立新的sheet对象（excel的表单）
        HSSFSheet sheet=wkb.createSheet("成绩表");
        //在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
        HSSFRow row1=sheet.createRow(0);
        //创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
        HSSFCell cell=row1.createCell(0);
        //设置单元格内容
        cell.setCellValue("火车购票系统旅程表");

        //合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,9));
        //在sheet里创建第二行
        HSSFRow row3=sheet.createRow(1);
        //创建单元格并设置单元格内容

        String[] Str ={"车次","出发地","目的地","出发时间","到达时间","历时","坐位","价格","日期"};
        for(int i=0;i<Str.length;i++)
        {
            row3.createCell(i).setCellValue(Str[i]);
        }

        int rownum=2;

        while (rs.next()){
            HSSFRow row2=sheet.createRow(rownum);

            row2.createCell(0).setCellValue(rs.getString("tripNum"));
            row2.createCell(1).setCellValue(rs.getString("source"));
            row2.createCell(2).setCellValue(rs.getString("destination"));
            row2.createCell(3).setCellValue(rs.getString("depTime"));
            row2.createCell(4).setCellValue(rs.getString("arrivTime"));
            row2.createCell(5).setCellValue(rs.getString("totaltime"));
            row2.createCell(6).setCellValue(rs.getString("seats"));
            row2.createCell(7).setCellValue(rs.getString("price"));
            row2.createCell(8).setCellValue(rs.getString("data"));
            rownum++;
        }
        return wkb;
    }




}
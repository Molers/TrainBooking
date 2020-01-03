package controll;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class site {
    public String trip,depTime,arrivTime,location,date,price;
    public int StationOrder,id;

    public site()  {
        trip="";
        location="";
        StationOrder=0;
        depTime="";
        arrivTime="";
        id=0;
        date="";
        price="";
    }
    //判断是否一次能到
    public static boolean notifDirect(String src,String dom,String trip) throws SQLException {

        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;

        String sql = "select * from site where trip= '"+trip+"' and location='"+src+"' ";
        rs=stmt.executeQuery(sql);
        int j=0,q=0;
        if(rs.next()){
            j=rs.getInt("StationOrder");
        }

        Statement stmt1 = con.createStatement();
        ResultSet rs1 = null;

        String sql1 = "select * from site where trip= '"+trip+"' and location = '"+dom+"' ";
        rs1=stmt1.executeQuery(sql1);

        if(rs1.next()){
            q=rs1.getInt("StationOrder");
        }


        if(j<q){
            return true;
        }else{
            return false;
        }


    }
    //一条直达的站点信息
    public  static  ArrayList<site>  oneDirect(String src,String dom,String trip) throws SQLException {

        ArrayList<site> returnsite=new ArrayList<>();

        if(notifDirect(src,dom,trip)){
            Connection con = DB.getActiveConnection();
            Statement stmt = con.createStatement();

            ResultSet rs = null;
            String sql = "select * from site where trip = '"+trip+"' ORDER BY trip";
            rs=stmt.executeQuery(sql);
            int s=1;
            while(rs.next()){
                if(s==0){
                    site newsite= new site();
                    newsite.date=rs.getString("date");
                    newsite.location=rs.getString("location");
                    newsite.trip=rs.getString("trip");
                    newsite.StationOrder=rs.getInt("StationOrder");
                    newsite.arrivTime=rs.getString("arrivTime");
                    newsite.depTime=rs.getString("depTime");
                    newsite.id=rs.getInt("id");
                    newsite.price=rs.getString("price");
                    returnsite.add(newsite);
                }

                if( rs.getString("location").equals(src)){
                    s=0;
                    site newsite= new site();
                    newsite.date=rs.getString("date");
                    newsite.location=rs.getString("location");
                    newsite.trip=rs.getString("trip");
                    newsite.StationOrder=rs.getInt("StationOrder");
                    newsite.arrivTime=rs.getString("arrivTime");
                    newsite.depTime=rs.getString("depTime");
                    newsite.id=rs.getInt("id");
                    newsite.price=rs.getString("price");
                    returnsite.add(newsite);

                }
                if( rs.getString("location").equals(dom)){
                    s=1;

                }



            }



        }else{
            return returnsite;
        }

        return returnsite;





    }
    //所有能直达的站点信息
    public  static  ArrayList<ArrayList<site>> allDirect(String src,String dom) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        ArrayList<ArrayList<site>> p =new ArrayList<>();

        String sql = "select * from site where location = '"+src+"' ";
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            ArrayList<site> newsite= new ArrayList<>();
            newsite.addAll(oneDirect(src,dom,rs.getString("trip")));
            if(newsite.size()==0){

            }else {
                p.add(newsite);
            }

        }
        return p;

    }
    //所有的换乘信息
    public  static ArrayList<ArrayList<site>>  Transfer(String src, String dom) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        ArrayList<ArrayList<site>> p =new ArrayList<>();

        String sql = "select * from site where location = '"+src+"' ";
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            Statement stmt1 = con.createStatement();
            ResultSet rs1= null;
            String sql1= "select * from site where trip = '"+rs.getString("trip")+"'";
            rs1=stmt1.executeQuery(sql1);
            ArrayList<site> every=new ArrayList<>();
            int s=1;
            while(rs1.next()){

                if(s==0){


                    if(rs1.getString("location").equals(dom)){
                        site newsite= new site();
                        newsite.date=rs1.getString("date");
                        newsite.location=rs1.getString("location");
                        newsite.trip=rs1.getString("trip");
                        newsite.StationOrder=rs1.getInt("StationOrder");
                        newsite.arrivTime=rs1.getString("arrivTime");
                        newsite.depTime=rs1.getString("depTime");
                        newsite.id=rs1.getInt("id");
                        newsite.price=rs1.getString("price");
                        every.add(newsite);

                    }else{
                        site newsite= new site();
                        newsite.date=rs1.getString("date");
                        newsite.location=rs1.getString("location");
                        newsite.trip=rs1.getString("trip");
                        newsite.StationOrder=rs1.getInt("StationOrder");
                        newsite.arrivTime=rs1.getString("arrivTime");
                        newsite.depTime=rs1.getString("depTime");
                        newsite.id=rs1.getInt("id");
                        newsite.price=rs1.getString("price");
                        every.add(newsite);
                        ArrayList<ArrayList<site>> w=new ArrayList<>();
                        w.addAll(allDirect(rs1.getString("location"),dom));
                        for(int z=0;z<w.size();z++){
                            ArrayList<site> o=new ArrayList<>();
                            ArrayList<site> oo=new ArrayList<>();
                            o=w.get(z);
                            if(o.get(0).trip.equals(rs1.getString("trip"))){

                            }else{
                                oo.addAll(every);
                                oo.addAll(o);
                                p.add(oo);

                            }

                        }

                    }

                }

                if(rs1.getString("location").equals(src)){
                    s=0;
                    site newsite= new site();
                    newsite.date=rs1.getString("date");
                    newsite.location=rs1.getString("location");
                    newsite.trip=rs1.getString("trip");
                    newsite.StationOrder=rs1.getInt("StationOrder");
                    newsite.arrivTime=rs1.getString("arrivTime");
                    newsite.depTime=rs1.getString("depTime");
                    newsite.id=rs1.getInt("id");
                    newsite.price=rs1.getString("price");
                    every.add(newsite);
                }
            }


            stmt1.close();
            rs1.close();



        }
        return p;



    }

    // 显示的车次信息,当天的车次信息，时间合适的车次信息
    public static  ArrayList<ArrayList<AllTrips>> showDirect(ArrayList<ArrayList<site>> m,Date date) throws SQLException, ParseException {
        ArrayList<ArrayList<AllTrips>> my=new ArrayList<>();
        Connection con = DB.getActiveConnection();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String format=sdf.format(date);
        System.out.println(format);
        format="2020-01-01";

        System.out.println("format的数据***********");
        System.out.println(format);
        System.out.println("format的数据***********");

        Date date2= new SimpleDateFormat("yyyy-MM-dd").parse(format);

        System.out.println("date2的数据***********");
        System.out.println(date2);
        System.out.println("date2的数据***********");

        for(int i=0;i<m.size();i++){
            int s=0;
            ArrayList<site> p =new ArrayList<>();
            p=m.get(i);
            ArrayList <AllTrips> onepath=new ArrayList<>();
            // System.out.println(i);
            for(int j=0;j<p.size();j++){
                System.out.println(j);
                site oo=new site();
                oo=p.get(j);
                Statement stmt = con.createStatement();
                ResultSet rs = null;
                String sql = "select * from trips where tripNum = '"+oo.trip+"' ";
                rs=stmt.executeQuery(sql);
                if(rs.next()){
                    if(onepath.isEmpty()){
                        AllTrips jkuo=new AllTrips();
                        jkuo.distance=rs.getInt("distance");
                        jkuo.destination=rs.getString("destination");
                        jkuo.source=rs.getString("source");
                        jkuo.arrivTime=rs.getString("arrivTime");
                        jkuo.date=rs.getDate("data");
                        jkuo.depTime=rs.getString("depTime");
                        jkuo.price=rs.getDouble("price");
                        jkuo.seats=rs.getInt("seats");
                        jkuo.tripNum=rs.getString("tripNum");
                        onepath.add(jkuo);
                        System.out.println("yg is good at studying English");
                        System.out.println("数据库的日期"+jkuo.date);
                        System.out.println("传过来的日期"+date2);
                        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
                        String format1=sdf.format(jkuo.date);
                        System.out.println(format1);
                        Date date3= new SimpleDateFormat("yyyy-MM-dd").parse(format1);
                        System.out.println(date3);
                        if(compare_date(date3,date)){

                        }else{
                            s=1;
                        }


                    }else{
                        if(onepath.get(onepath.size()-1).tripNum.equals(rs.getString("tripNum"))){
                            System.out.println("yggg");
                        }else{
//                            System.out.println(p.get(j-1).arrivTime);
//                            System.out.println(p.get(j).depTime);
                            if(notiftime(p.get(j-1).arrivTime,p.get(j).depTime)) {
                            }else{
                                s=1;
                            }
                            AllTrips jkuo=new AllTrips();
                            jkuo.distance=rs.getInt("distance");
                            jkuo.destination=rs.getString("destination");
                            jkuo.source=rs.getString("source");
                            jkuo.arrivTime=rs.getString("arrivTime");
                            jkuo.date=rs.getDate("data");
                            jkuo.depTime=rs.getString("depTime");
                            jkuo.price=rs.getDouble("price");
                            jkuo.seats=rs.getInt("seats");
                            jkuo.tripNum=rs.getString("tripNum");
                            onepath.add(jkuo);
                           // System.out.println(jkuo.date);
                            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
                            String format1=sdf.format(jkuo.date);
                            System.out.println(format1);
                            Date date3= new SimpleDateFormat("yyyy-MM-dd").parse(format1);
                            System.out.println(date3);
                            if(compare_date(date3,date)){

                            }else{
                                s=1;
                            }



                        }

                    }

                }
                stmt.close();
                rs.close();

            }
            if(s==1){

            }else{
                ArrayList<AllTrips> add =new ArrayList<>(onepath);
                my.add(add);

            }




        }

        return my;
    }
    //返回时间是大小
    //no1>no2 retrue false
    //no1<no2 retrue true

    public static boolean notiftime(String no1,String no2){
        int a=0;
        int b=0;
        if(no1.length()<5){
            a=Integer.parseInt(no1.substring(0,1));
            b=Integer.parseInt(no1.substring(2,4));

        }else{
            a=Integer.parseInt(no1.substring(0,2));
            b=Integer.parseInt(no1.substring(3,5));
        }


        int s=a*60+b;
        System.out.println(a);
        System.out.println(b);
        System.out.println(s);
        if(no2.length()<5){
            a=Integer.parseInt(no2.substring(0,1));
            b=Integer.parseInt(no2.substring(2,4));

        }else{
            a=Integer.parseInt(no2.substring(0,2));
            b=Integer.parseInt(no2.substring(3,5));
        }

        int s2=a*60+b;
        System.out.println(a);
        System.out.println(b);
        System.out.println(s2);
        if(s<s2){
            return true;
        }else{
            return false;
        }




    }

    //根据车次信息查站点信息

    public  static  ArrayList<site> showonetrip(String trip) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        String sql = "select * from site where trip= '"+trip+"' ";
        rs=stmt.executeQuery(sql);
        ArrayList<site> p=new ArrayList<>();
        while(rs.next()){
            site newsite= new site();
            newsite.date=rs.getString("date");
            newsite.location=rs.getString("location");
            newsite.trip=rs.getString("trip");
            newsite.StationOrder=rs.getInt("StationOrder");
            newsite.arrivTime=rs.getString("arrivTime");
            newsite.depTime=rs.getString("depTime");
            newsite.id=rs.getInt("id");
            newsite.price=rs.getString("price");
            p.add(newsite);

        }
        stmt.close();
        rs.close();
        return p;
    }

    //判断是否同一天
    public static boolean compare_date(Date DATE1, Date DATE2) {
        System.out.println("*****************判断是否同一天***************");
        System.out.println(DATE1);
        System.out.println(DATE2);
        System.out.println("*****************判断是否同一天***************");
        int compareflag =DATE2.compareTo(DATE1);
        System.out.println("*****************比较结果***************");
        System.out.println(compareflag);
        System.out.println("*****************比较结果***************");
        if( compareflag == 0){
            System.out.println("r");
            return true;
        } else return false;
    }

    //显示最短时间到达目的地的车次信息

    public static  ArrayList<ArrayList<AllTrips>>  showshorttimetrip(String src,String dom,Date date) throws SQLException, ParseException {
        ArrayList<ArrayList<site>>  my =new ArrayList<>();
        ArrayList<ArrayList<site>>  my2 =new ArrayList<>();
        ArrayList<ArrayList<AllTrips>> retyr=new ArrayList<>();

        my.addAll(allDirect(src,dom));
        my.addAll(Transfer(src ,dom));
        String mytime="24:00";


        for(int i=0; i<my.size();i++){
            ArrayList<site> test=new ArrayList<>();
            int s=0;
            test=my.get(i);
            for(int j=0;j<test.size();j++){
                site msite=new site();
                msite=test.get(j);
                if(msite.location.equals(dom)){
                    if(notiftime(msite.arrivTime,mytime)){
                        mytime=msite.arrivTime;
                        s=1;

                    }

                }
            }

            if(s==1){
                my2.clear();
                my2.add(my.get(i));
            }
        }

        if(showDirect(my2,date).size()==0){
            ArrayList<ArrayList<AllTrips>> u=new ArrayList<>();
            return u;

        }else{
            retyr.add(showDirect(my2,date).get(0))  ;
        }

        return retyr;

    }

    public static  ArrayList<String> showhuancheng(ArrayList<ArrayList<site>> m,Date date) throws SQLException, ParseException {
        ArrayList<ArrayList<AllTrips>> my=new ArrayList<>();
        Connection con = DB.getActiveConnection();
        ArrayList<String>  uuou=new ArrayList<>();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String format=sdf.format(date);
        System.out.println(format);
        format="2020-01-01";

        System.out.println("format的数据***********");
        System.out.println(format);
        System.out.println("format的数据***********");

        Date date2= new SimpleDateFormat("yyyy-MM-dd").parse(format);

        System.out.println("date2的数据***********");
        System.out.println(date2);
        System.out.println("date2的数据***********");

        for(int i=0;i<m.size();i++){
            int s=0;
            ArrayList<site> p =new ArrayList<>();
            p=m.get(i);
            ArrayList <AllTrips> onepath=new ArrayList<>();
            // System.out.println(i);
            for(int j=0;j<p.size();j++){
                System.out.println(j);
                site oo=new site();
                oo=p.get(j);
                Statement stmt = con.createStatement();
                ResultSet rs = null;
                String sql = "select * from trips where tripNum = '"+oo.trip+"' ";
                rs=stmt.executeQuery(sql);
                if(rs.next()){
                    if(onepath.isEmpty()){
                        AllTrips jkuo=new AllTrips();
                        jkuo.distance=rs.getInt("distance");
                        jkuo.destination=rs.getString("destination");
                        jkuo.source=rs.getString("source");
                        jkuo.arrivTime=rs.getString("arrivTime");
                        jkuo.date=rs.getDate("data");
                        jkuo.depTime=rs.getString("depTime");
                        jkuo.price=rs.getDouble("price");
                        jkuo.seats=rs.getInt("seats");
                        jkuo.tripNum=rs.getString("tripNum");
                        onepath.add(jkuo);
                        System.out.println("yg is good at studying English");
                        System.out.println("数据库的日期"+jkuo.date);
                        System.out.println("传过来的日期"+date2);
                        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
                        String format1=sdf.format(jkuo.date);
                        System.out.println(format1);
                        Date date3= new SimpleDateFormat("yyyy-MM-dd").parse(format1);
                        System.out.println(date3);
                        if(compare_date(date3,date)){

                        }else{
                            s=1;
                        }


                    }else{
                        if(onepath.get(onepath.size()-1).tripNum.equals(rs.getString("tripNum"))){
                            System.out.println("yggg");
                        }else{
//                            System.out.println(p.get(j-1).arrivTime);
//                            System.out.println(p.get(j).depTime);
                            if(notiftime(p.get(j-1).arrivTime,p.get(j).depTime)) {
                            }else{
                                s=1;
                            }
                            AllTrips jkuo=new AllTrips();
                            jkuo.distance=rs.getInt("distance");
                            jkuo.destination=rs.getString("destination");
                            jkuo.source=rs.getString("source");
                            jkuo.arrivTime=rs.getString("arrivTime");
                            jkuo.date=rs.getDate("data");
                            jkuo.depTime=rs.getString("depTime");
                            jkuo.price=rs.getDouble("price");
                            jkuo.seats=rs.getInt("seats");
                            jkuo.tripNum=rs.getString("tripNum");
                            onepath.add(jkuo);
                            // System.out.println(jkuo.date);
                            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
                            String format1=sdf.format(jkuo.date);
                            System.out.println(format1);
                            Date date3= new SimpleDateFormat("yyyy-MM-dd").parse(format1);
                            System.out.println(date3);
                            if(compare_date(date3,date)){

                            }else{
                                s=1;
                            }
                            if(s==0){
                                uuou.add(p.get(j).location);
                            }



                        }

                    }

                }
                stmt.close();
                rs.close();

            }





        }

        return uuou;
    }














//    public static ArrayList<ArrayList<site>> Transfer(){
//
//    }

    //遍历图的信息
//    public static ArrayList<site> myshortpath(String src, String dest)throws SQLException {
//        Connection con = DB.getActiveConnection();
//        Statement stmt = con.createStatement();
//        ResultSet rs = null;
//        ArrayList<site> t = new ArrayList();
//        String sql = "select * from site where location= '"+src+"'";
//        rs=stmt.executeQuery(sql);
//        //System.out.println("YANGGANG2");
//        while(rs.next()) {
//            Statement stmt1 = con.createStatement();
//            ResultSet rs1 = null;
//            int nextStationOrder = rs.getInt("StationOrder")+1;
//            String sql1 = "select * from site where  trip= '" + rs.getString("trip") + "'and StationOrder= '" + nextStationOrder + "'";
//            rs1 = stmt1.executeQuery(sql1);
//            //System.out.println("YANGGANG2");
//            while(rs1.next()) {
//
////                System.out.println( rs1.getString("location"));
//             //  System.out.println("YANGGANG3");
//                if (rs1.getString("location").equals(dest)) {
//                    site trip = new site();
//                    trip.StationOrder=rs1.getInt("StationOrder");
//                    trip.trip=rs1.getString("trip");
//                    trip.id=rs1.getInt("id");
//                    trip.location=rs1.getString("location");
//                    site trip1 = new site();
//                    trip1.StationOrder=rs.getInt("StationOrder");
//                    trip1.trip=rs.getString("trip");
//                    trip1.id=rs.getInt("id");
//                    trip1.location=rs.getString("location");
//                    t.add(trip1);
//                    t.add(trip);
//                   // System.out.println("YANGGANG1");
//
//                } else {
//                    if (myshortpath(rs1.getString("location"), dest).size() == 0) {
//
//                    } else {
//                        site trip = new site();
//                        trip.StationOrder=rs1.getInt("StationOrder");
//                        trip.trip=rs1.getString("trip");
//                        trip.id=rs1.getInt("id");
//                        trip.location=rs1.getString("location");
//                        site trip1 = new site();
//                        trip1.StationOrder=rs.getInt("StationOrder");
//                        trip1.trip=rs.getString("trip");
//                        trip1.id=rs.getInt("id");
//                        trip1.location=rs.getString("location");
//                        t.add(trip1);
//                        t.add(trip);
//
//                        t.addAll(myshortpath(rs1.getString("location"), dest));
//                    }
//
//                }
//
//            }
//            stmt1.close();
//            rs1.close();
//
//
//
//        }
//        stmt.close();
//        rs.close();
//
//        return t;
//
//    }
//
//    //经过的车次信息
//    //msite便利信息
//    //dest目的地
//    public static ArrayList<ArrayList<String>> showpath(ArrayList<site> msite,String  src, String dest){
//        ArrayList<ArrayList<String>> mshowpath=new ArrayList<>();
//
//
//        HashSet <String> onepart=new HashSet<>();
//        for(int i=0;i<msite.size();i++){
//            if(msite.get(i).location.equals(msite.get(i).location)){
//                onepart.add(msite.get(i).trip);
//                break;
//
//            }else{
//                onepart.add(msite.get(i).trip);
//            }
//
//        }
//        ArrayList<String> test=new ArrayList<>(onepart);
//        for(int i=0;i<test.size();i++){
////            System.out.println(test.get(i));
//        }
//
//        HashSet <String> onepath=new LinkedHashSet<String>();
//
//        for(int i=0;i<msite.size();i++){
//
//            if(msite.get(i).location.equals(dest)){
//                onepath.add(msite.get(i).trip);
//
//                ArrayList<String> m=new ArrayList<>(onepath);
//                mshowpath.add(m);
//                onepath.clear();
//                if(i==msite.size()-1){
//
//                }else {
//                    if (msite.get(i + 1).location.equals(src)) {
//
//                    } else {
//                        onepath.addAll(onepart);
//                    }
//                }
//                ArrayList<String> test2=new ArrayList<>(m);
//                System.out.println(test2.size());
//                for(int z=0;z<test2.size();z++){
////                    System.out.println(test2.get(z));
//                }
//            }else {
//                onepath.add(msite.get(i).trip);
//            }
//
//
//        }
//
//        return mshowpath;
//
//
//
//
//    }
//    //经过的站点信息
//    // msite便利信息
//    //dest目的地
//    public static ArrayList<ArrayList<String>> showdetailed(ArrayList<site> msite,String  src, String dest){
//        ArrayList<ArrayList<String>> mshowpath=new ArrayList<>();
//
//
//        HashSet <String> onepart=new HashSet<>();
//        for(int i=0;i<msite.size();i++){
//            if(msite.get(i).location.equals(msite.get(i).location)){
//                onepart.add(msite.get(i).location);
//                break;
//
//            }else{
//                onepart.add(msite.get(i).location);
//            }
//
//        }
////        ArrayList<String> test=new ArrayList<>(onepart);
////        for(int i=0;i<test.size();i++){
////            System.out.println(test.get(i));
////        }
//
//        HashSet <String> onepath=new LinkedHashSet<String>();
//        onepath.addAll(onepart);
//        for(int i=0;i<msite.size();i++){
//
//            if(msite.get(i).location.equals(dest)){
//                onepath.add(msite.get(i).location);
//
//                ArrayList<String> m=new ArrayList<>(onepath);
//                mshowpath.add(m);
//                onepath.clear();
//                onepath.addAll(onepart);
//                ArrayList<String> test2=new ArrayList<>(m);
////                for(int z=0;z<test2.size();z++){
////                    System.out.println(test2.get(z));
////                }
//            }else {
//                onepath.add(msite.get(i).location);
//            }
//
//
//        }
//
//        return mshowpath;
//
//
//
//
//    }
//
//
//    public static ArrayList<String> showtrips(ArrayList<site> msite){
//        HashSet<String> mysite=new HashSet<>();
//        ArrayList<String>  p=new ArrayList<>();
//        for(int i=0;i<msite.size();i++){
//            mysite.add(msite.get(i).trip);
//        }
//       p.addAll(mysite);
//        return p;
//
//
//    }
//
//    public static ArrayList<String> shortpath(ArrayList<site> msite){
//        HashSet<String> mysite=new HashSet<>();
//        ArrayList<String>  p=new ArrayList<>();
//        for(int i=0;i<msite.size();i++){
//            mysite.add(msite.get(i).trip);
//        }
//        p.addAll(mysite);
//        return p;
//
//
//    }
//
//    public static ArrayList<String> showlocation(ArrayList<site> msite){
//        HashSet<String> mysite=new HashSet<>();
//
//        for(int i=0;i<msite.size();i++){
//            mysite.add(msite.get(i).location);
//        }
//        ArrayList<String> m=new ArrayList<>(mysite);
//        return m;
//    }
//    //每条可达线路信息
//    //msite 线路信息
//    //mlocation 站点信息
//    public static ArrayList<site> detailedpath(ArrayList<String> msite,ArrayList<String> mlocation) throws SQLException {
//        Connection con = DB.getActiveConnection();
//        ArrayList<site> t=new ArrayList<>();
//
//        for(int i=0;i<msite.size();i++){
//            Statement stmt = con.createStatement();
//            ResultSet rs = null;
//            String sql = "select * from site where trip= '"+msite.get(i)+"'";
//            rs=stmt.executeQuery(sql);
//            while(rs.next()){
//                for(int j=0;j<mlocation.size();j++) {
//                    if (rs.getString("location").equals(mlocation.get(j))){
//                        site trip1 = new site();
//                        trip1.StationOrder=rs.getInt("StationOrder");
//                        trip1.trip=rs.getString("trip");
//                        trip1.id=rs.getInt("id");
//                        trip1.location=rs.getString("location");
//                        t.add(trip1);
//
//                    }
//
//                }
//            }
//
//
//        }
//        return t;


}



















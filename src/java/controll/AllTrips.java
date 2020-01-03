package controll;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class AllTrips {
    int trainNum, seats,distance;
    Date date;
    String source, destination, depTime, arrivTime,  tripNum;

    Double price;
    
    public AllTrips() throws ParseException {
        trainNum = 0;
        seats = 0;
        source = "";
        destination = "";
        depTime = "";
        arrivTime = "";
        String dateString = "00-00-00";
        date= new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        price = 0.0;
        tripNum = "";
    }
    
    public void setTrainNum(int num){
        this.trainNum = num;
    }

    public void setdistance(int num){
        this.distance = num;
    }

    public int getdistance()  {
        return distance;
    }

    public int getTrainNum()  {
        return trainNum;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public int getSeats() {
        return seats;
    }
    
    public void setPrice(double price){
       this.price = price;
    }
    
    public double getPrice()  {
        return price;
    }
    
    public void setSrc (String source){
       this.source = source;
    }
    
    public String getSrc()  {
        return source;
    }
    
    public void setDest (String destination){
       this.destination = destination;
    }
    
    public String getDest()  {
        return destination;
    }
    
    public void setDepTime (String depTime){
       this.depTime = depTime;
    }
    
    public String getDepTime()  {
        return depTime;
    }
    
    public void setArrTime (String arrivTime){
       this.arrivTime = arrivTime;
    }
    
    public String getArrTime()  {
        return arrivTime;
    }
    
    public void setDate (Date date){
       this.date = date;
    }
    
    public Date getDate()  {
        return date;
    }
    
    public void setTripNum (String tripNum){
       this.tripNum = tripNum;
    }
    
    public String getTripNum()  {
        return tripNum;
    }
    
    public static ArrayList<AllTrips> showTrips() throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        
        ArrayList<AllTrips> trip = new ArrayList<>();
//        ArrayList data = null;
        
        String query = ("select * from trips");
        rs = stmt.executeQuery(query);
        
        while (rs.next()){
            AllTrips tr = new AllTrips();
            
            tr.tripNum = rs.getString("tripNum");// trip number
            tr.trainNum = rs.getInt("trainNum");// train number
            tr.source = rs.getString("source");// source
            tr.destination = rs.getString("destination");// destination
            tr.depTime = rs.getString("depTime");//departure time
            tr.arrivTime = rs.getString("arrivTime");// arrival time
            tr.date = rs.getDate("data");// date
            tr.seats = rs.getInt("seats");// reserved seats
            tr.price = rs.getDouble("price");//price
           // tr.distance = rs.getInt("distance");//distance
            trip.add(tr);
        }
        
        return trip;
    }
    
    public static AllTrips selectTrip(String tripNum) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        AllTrips trip = new AllTrips();
        
        String sql = "select * from trips where tripNum = '"+tripNum+"' ";
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            trip.tripNum = rs.getString(9);// trip number
            trip.trainNum = rs.getInt(1);// train number
            trip.source = rs.getString(2);// source
            trip.destination = rs.getString(3);// destination
            trip.depTime = rs.getString(4);//departure time
            trip.arrivTime = rs.getString(5);// arrival time
            trip.date = rs.getDate("data");// date
            trip.seats = rs.getInt(7);// reserved seats
            trip.price = rs.getDouble(8);//price
            trip.distance = rs.getInt(10);//distance
        
        }
        return trip;
    }
    
    public static boolean deleteTrip(String tripNum) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        
        String query = "delete from trips where tripNum = '"+tripNum+"' ";
        try {
            stmt.executeUpdate(query);
            return  true;
        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        }

    }

    public static boolean updateTrip(String tripNum, String depTime, String arrTime, String date, double price,String seats,String totaltime) throws SQLException{
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        System.out.println("yanggang......updateTrip");
        String query = "update trips set depTime='"+depTime+"', arrivTime='"+arrTime+"', data='"+date+"', price='"+price+"',seats='"+seats+"',totaltime='"+totaltime+"'"
                + " where tripNum = '"+tripNum+"' ";
        int i = stmt.executeUpdate(query);
        if(i>0)
            return true;
        return false;

    }
    
    public static boolean updateSeats(String tripNum, int seats) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        int reserved = 0;

        AllTrips trip = AllTrips.selectTrip(tripNum);
        
        reserved = trip.getSeats();

        if(reserved<seats){
          return false;
        }
        else{
            reserved=reserved-seats;
        System.out.println("yanggang....updateSeats");
        String query = "update trips set `seats` = '"+reserved+"'  where tripNum = '"+tripNum+"' ";
        stmt.executeUpdate(query);
          return true;
        }
        
    }
    public static ArrayList<AllTrips> search(String Type,String dest) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        ArrayList<AllTrips> t = new ArrayList();
        System.out.println("yanggang"+Type+"......"+dest);
        String type=new String("Destination");




        if(Type.equals("目的地")){ type="destination";System.out.println(Type); }
        if(Type.equals("出发地")){ type="source"; System.out.println(Type);}
        if(Type.equals("车次")){ type="tripNum"; System.out.println(Type);}
//        if(Type.equals("TripNumber")){ type="tripNum";System.out.println(Type); }

        String sql = "select * from trips where  "+type+" = '"+dest+"' ";
        rs=stmt.executeQuery(sql);

        while(rs.next()){
            AllTrips trip = new AllTrips();
            trip.tripNum = rs.getString(9);// trip number
            trip.trainNum = rs.getInt(1);// train number
            trip.source = rs.getString(2);// source
            trip.destination = rs.getString(3);// destination
            trip.depTime = rs.getString(4);//departure time
            trip.arrivTime = rs.getString(5);// arrival time
            trip.date = rs.getDate("data");// date
            trip.seats = rs.getInt(7);// reserved seats
            trip.price = rs.getDouble(8);//price
            trip.distance = rs.getInt(10);//distance
            t.add(trip);
        }
        stmt.close();
        con.close();
        
        return t;
    }

    public static ArrayList<AllTrips> shortpath(String src,String dest) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        ArrayList<AllTrips> t = new ArrayList();
        String sql = "select * from trips where  source= '"+src+"'and destination = '"+dest+"'";
        rs=stmt.executeQuery(sql);
        System.out.println("shortpath1");
        while(rs.next()){
            AllTrips trip = new AllTrips();
            trip.tripNum = rs.getString(9);// trip number
            trip.trainNum = rs.getInt(1);// train number
            trip.source = rs.getString(2);// source
            trip.destination = rs.getString(3);// destination
            trip.depTime = rs.getString(4);//departure time
            trip.arrivTime = rs.getString(5);// arrival time
            trip.date = rs.getDate(6);// date
            trip.seats = rs.getInt(7);// reserved seats
            trip.price = rs.getDouble(8);//price
            trip.distance = rs.getInt(10);//distance
            t.add(trip);
        }

        ResultSet rs1 = null;
        Statement stmt1 = con.createStatement();
        sql="select * from trips where  source= '"+src+"'";
        rs1=stmt1.executeQuery(sql);
        while(rs1.next()){
            ResultSet rs2 = null;
            Statement stmt2 = con.createStatement();
            sql="select * from trips where  source= '"+rs1.getString(3)+"'";
            rs2=stmt2.executeQuery(sql);
            System.out.println("shortpath2"+rs1.getString(3));
            while(rs2.next()){
                System.out.println("shortpath3");
                if(rs2.getString(3).equals(dest)){
                    AllTrips trip = new AllTrips();
                    trip.tripNum = rs2.getString(9);// trip number
                    trip.trainNum = rs2.getInt(1);// train number
                    trip.source = rs2.getString(2);// source
                    trip.destination = rs2.getString(3);// destination
                    trip.depTime = rs2.getString(4);//departure time
                    trip.arrivTime = rs2.getString(5);// arrival time
                    trip.date = rs2.getDate(6);// date
                    trip.seats = rs2.getInt(7);// reserved seats
                    trip.price = rs2.getDouble(8);//price
                    trip.distance = rs.getInt(10);//distance
                    t.add(trip);
                    AllTrips trip2 = new AllTrips();
                    trip2.tripNum = rs1.getString(9);// trip number
                    trip2.trainNum = rs1.getInt(1);// train number
                    trip2.source = rs1.getString(2);// source
                    trip2.destination = rs1.getString(3);// destination
                    trip2.depTime = rs1.getString(4);//departure time
                    trip2.arrivTime = rs1.getString(5);// arrival time
                    trip2.date = rs1.getDate(6);// date
                    trip2.seats = rs1.getInt(7);// reserved seats
                    trip2.price = rs1.getDouble(8);//price
                    trip.distance = rs.getInt(10);//distance
                    t.add(trip2);
                    System.out.println("shortpath4");
                }

            }
        }
        System.out.println("shortpath5");
        return t;


    }

    public static ArrayList<AllTrips> myshortpath(String src,String dest) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        ArrayList<AllTrips> t = new ArrayList();
        String sql = "select * from trips where  source= '"+src+"'";
        rs=stmt.executeQuery(sql);


        while(rs.next()){
            if(rs.getString(3).equals(dest)){
                AllTrips trip = new AllTrips();
                trip.tripNum = rs.getString(9);// trip number
                trip.trainNum = rs.getInt(1);// train number
                trip.source = rs.getString(2);// source
                trip.destination = rs.getString(3);// destination
                trip.depTime = rs.getString(4);//departure time
                trip.arrivTime = rs.getString(5);// arrival time
                trip.date = rs.getDate(6);// date
                trip.seats = rs.getInt(7);// reserved seats
                trip.price = rs.getDouble(8);//price
                trip.distance = rs.getInt(10);//distance
                t.add(trip);

            }

            else{
                if(myshortpath(rs.getString(3),dest).size()==0){

                }
                else{
                    AllTrips trip = new AllTrips();
                    trip.tripNum = rs.getString(9);// trip number
                    trip.trainNum = rs.getInt(1);// train number
                    trip.source = rs.getString(2);// source
                    trip.destination = rs.getString(3);// destination
                    trip.depTime = rs.getString(4);//departure time
                    trip.arrivTime = rs.getString(5);// arrival time
                    trip.date = rs.getDate(6);// date
                    trip.seats = rs.getInt(7);// reserved seats
                    trip.price = rs.getDouble(8);//price
                    trip.distance = rs.getInt(10);//distance
                    t.add(trip);
                    t.addAll(myshortpath(rs.getString(3),dest));
                }

            }
        }
        stmt.close();
        con.close();
        return t;
    }

//    public static ArrayList<AllTrips> showshortpath(String type,String src,String dest) throws SQLException{
//        int sum=0;
//        int min=10000;
//        ArrayList<AllTrips> t = new ArrayList();
//        ArrayList<AllTrips> p = new ArrayList();
//        ArrayList<AllTrips> z = new ArrayList();
//        ArrayList<AllTrips> w = new ArrayList();
//        ArrayList<AllTrips> y = new ArrayList();
//        t.addAll(myshortpath(src,dest));
//        if(type.equals("shorttime")){
//
//            for (int i = 0; i < t.size(); i++) {
//                if (t.get(i).destination.equals(dest)) {
//                    p.clear();
//                    p.add(t.get(i));
//                    sum = sum + Integer.parseInt(t.get(i).getDate());
//                    if (min >= sum) {
//                        w.clear();
//                        min = sum;
//                        p.addAll(z);
//                        w.addAll(p);
//                    }
//                    sum = 0;
//                    z.clear();
//                } else {
//                    sum = sum + Integer.parseInt(t.get(i).getDate());
//                    z.add(t.get(i));
//                }
//
//            }
//
//
//        }
//        else {
//
//
//            for (int i = 0; i < t.size(); i++) {
//                if (t.get(i).destination.equals(dest)) {
//                    p.clear();
//                    p.add(t.get(i));
//                    sum = sum + t.get(i).getdistance();
//                    if (min >= sum) {
//                        w.clear();
//                        min = sum;
//                        p.addAll(z);
//                        w.addAll(p);
//                    }
//                    sum = 0;
//                    z.clear();
//                } else {
//                    sum = sum + t.get(i).getdistance();
//                    z.add(t.get(i));
//                }
//
//            }
//        }
//        String msrc=src;
//
//        while(!w.isEmpty()){
//
//            for(int i=0;i<w.size();i++){
//           if(w.get(i).source.equals(msrc)){
//               y.add(w.get(i));
//               msrc=w.get(i).destination;
//               System.out.println(w.get(i).source);
//               w.remove(i);
//           }
//
//            }
//        }
//        return y;
//    }


    public  static ArrayList<AllTrips> showtrips(ArrayList<ArrayList<String>> m) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();


        ArrayList<AllTrips> trip = new ArrayList<>();
//        ArrayList data = null;
        for(int i=0;i<m.size();i++){
            ArrayList<String> tt=new ArrayList<>();
            tt=m.get(i);
            System.out.println(i);
            for(int j=0;j<tt.size();j++){
                Statement stmt = con.createStatement();
                ResultSet rs = null;
                String query = ("select * from trips where tripNum= '"+tt.get(j)+"'");
                System.out.println(tt.get(j));
                rs = stmt.executeQuery(query);
                if(rs.next()){
                    AllTrips mtrip=new AllTrips();
                    mtrip.source=rs.getString("source");
                    mtrip.destination=rs.getString("destination");
                    mtrip.tripNum=rs.getString("tripNum");
                    mtrip.seats=rs.getInt("seats");
                    mtrip.arrivTime=rs.getString("arrivTime");
                    mtrip.depTime=rs.getString("depTime");
                    trip.add(mtrip);

                }
                stmt.close();
                rs.close();

            }

        }

        return trip;

    }





}


package controll;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class detailed {
    String trips, source, destination, depTime, arrivTime, StationOrder, price;
    int date;

    public detailed() {
        trips = "";
        source = "";
        destination = "";
        depTime = "";
        arrivTime = "";
        date = 0;
        StationOrder = "";
        price = "";
    }

    public void setTrips(String Trips) {
        this.trips = Trips;
    }

    public void setsource(String source) {
        this.source = source;
    }

    public void setdestination(String destination) {
        this.destination = destination;
    }

    public void setdepTime(String depTime) {
        this.depTime = depTime;
    }

    public void setarrivTime(String arrivTime) {
        this.arrivTime = arrivTime;
    }

    public void setdate(int date) {
        this.date = date;
    }

    public void setStationOrder(String StationOrder) {
        this.StationOrder = StationOrder;
    }

    public void setprice(String price) {
        this.price = price;
    }

    public int getDate() {
        return date;
    }
    public String gettrips() {
        return trips;
    }
    public String getsource() {
        return source;
    }
    public String getdestination() {
        return destination;
    }
    public String getdepTime() {
        return depTime;
    }
    public String getarrivTime() {
        return arrivTime;
    }
    public String getStationOrder() {
        return StationOrder;
    }
    public String getprice() {
        return price;
    }

    public static ArrayList<detailed> showTrips(String trips) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;

        ArrayList<detailed> trip = new ArrayList<>();
//        ArrayList data = null;

        String query = ("select * from detailed where tripNum = '" + trips + "'");
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            detailed tr = new detailed();

            tr.trips = rs.getString(1);// trip number
            tr.source = rs.getString(2);// train number
            tr.destination = rs.getString(3);// source
            tr.date = rs.getInt(4);// destination
            tr.depTime = rs.getString(5);//departure time
            tr.arrivTime = rs.getString(6);// arrival time
            tr.StationOrder = rs.getString(7);// date
            tr.price = rs.getString(9);//price
            trip.add(tr);
        }

        return trip;
    }

    public static ArrayList<detailed> myshortpath(String src, String dest) throws SQLException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        ArrayList<detailed> t = new ArrayList();
        String sql = "select * from detailed where  source= '" + src + "'";
        rs = stmt.executeQuery(sql);


        while (rs.next()) {
            if (rs.getString(3).equals(dest)) {
                detailed trip = new detailed();
                trip.trips = rs.getString(1);// trip number
                trip.source = rs.getString(2);// train number
                trip.destination = rs.getString(3);// source
                trip.date = rs.getInt(4);// destination
                trip.depTime = rs.getString(5);//departure time
                trip.arrivTime = rs.getString(6);// arrival time
                trip.StationOrder = rs.getString(7);// date
                trip.price = rs.getString(9);//price
                t.add(trip);

            } else {
                if (myshortpath(rs.getString(3), dest).size() == 0) {

                } else {
                    detailed trip = new detailed();
                    trip.trips = rs.getString(1);// trip number
                    trip.source = rs.getString(2);// train number
                    trip.destination = rs.getString(3);// source
                    trip.date = rs.getInt(4);// destination
                    trip.depTime = rs.getString(5);//departure time
                    trip.arrivTime = rs.getString(6);// arrival time
                    trip.StationOrder = rs.getString(7);// date
                    trip.price = rs.getString(9);//price
                    t.add(trip);
                    t.addAll(myshortpath(rs.getString(3), dest));
                }

            }
        }

        return t;
    }

    public static ArrayList<detailed> showshortpath(String type, String src, String dest) throws SQLException {
        int sum = 0;
        int min = 10000;
        ArrayList<detailed> t = new ArrayList();
        ArrayList<detailed> p = new ArrayList();
        ArrayList<detailed> z = new ArrayList();
        ArrayList<detailed> w = new ArrayList();
        t.addAll(myshortpath(src, dest));
        if (type.equals("shorttime")) {

            for (int i = 0; i < t.size(); i++) {
                if (t.get(i).destination.equals(dest)) {
                    p.clear();
                    p.add(t.get(i));
                    sum = sum + t.get(i).getDate();
                    if (min >= sum) {
                        w.clear();
                        min = sum;
                        p.addAll(z);
                        w.addAll(p);
                    }
                    sum = 0;
                    z.clear();
                } else {
                    sum = sum + t.get(i).getDate();
                    z.add(t.get(i));
                }

            }


        } else {


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
        }

        return w;
    }



    }



package controll;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;


public class booking {

    double charge;
    int bookID,  userID, seats;
    String tripID,userName;
    
    public booking(){
        charge = 0.0;
        bookID = 0;
        tripID = "";
        userID = 0;
        seats = 0;
        
    }
    
    public int getBookID(){
        return bookID;
    }
    
    public String getTripId(){
        return tripID;
    }
    
    public double getCharge(){
        return charge;
    }
    
    public int getUserId(){
        return userID;
    }
    
    public int getSeats(){
        return seats;
    }
    
    public static ArrayList<booking> showBookigs(String id) throws SQLException{
        ArrayList<booking> b = new ArrayList<>();
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        
        String query = ("select * from book where UserName = '"+id+"' ");
        rs = stmt.executeQuery(query);
        System.out.println("yanggang................booking");
        while (rs.next()){
            booking tr = new booking();

            tr.bookID = rs.getInt(1);
            tr.tripID = rs.getString(2);
            tr.userName = rs.getString(6);
            tr.seats = rs.getInt(4);
            tr.charge = rs.getDouble(5);

            b.add(tr);
        }
        
        return b;
    }
    
    public static void book(String tripID, String userID, int seats, double charge) throws SQLException, ParseException {
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        int reserved = 0;

        AllTrips trip = AllTrips.selectTrip(tripID);

        reserved = trip.getSeats();
        if(reserved<seats){


        }else{

        String sql = "insert into book (tripID, userName, seats, charge)"
                + " values('"+tripID+"', '"+userID+"', '"+seats+"', '"+charge+"' )";
        
        stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=0");
        stmt.executeUpdate(sql);
        stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=1");}
    }
    
    public static void deleteBook(int bookID) throws SQLException{
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        
        String query = "delete from book where bookID = '"+bookID+"' ";
        stmt.executeUpdate(query);
        
    }
}

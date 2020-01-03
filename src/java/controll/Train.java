
package controll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class Train {
    int trainNum, seats;
    
    public Train(){
        trainNum = 0;
        seats = 0;
    }
    
    public void setTrainNum(int num){
        this.trainNum = num;
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
    
    public static ArrayList<Train> showTrains () throws SQLException{
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        
        ArrayList<Train> train = new ArrayList<>();
        
        String query = ("select * from train");
        rs = stmt.executeQuery(query);
        
        while (rs.next()){
            Train tr = new Train();

            tr.trainNum = rs.getInt(1);
            tr.seats = rs.getInt(2);

            train.add(tr);
        }
        
        return train;
    }
    
    public static void deleteTrain(String trainNum) throws SQLException{
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        
        String query = "delete from train where trainNumber = '"+trainNum+"' ";
        stmt.executeUpdate(query);
        
    }
    
    public static boolean updateTrain(String trainNum, String seats) throws SQLException{
        Connection con = DB.getActiveConnection();
        Statement stmt = con.createStatement();
        
        String query = "update train set seats='"+seats+"' where trainNumber = '"+trainNum+"' ";
        int i = stmt.executeUpdate(query);
        if(i>0)
            return true;
        return false;
        
    }
}

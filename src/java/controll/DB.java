package controll;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class DB {

    private static Connection connection = null;

    public static Connection getActiveConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/test2?serverTimezone=UTC", "root", "123456");
            return connection;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

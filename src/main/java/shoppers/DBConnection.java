package shoppers;


import java.sql.*;

public class DBConnection {

    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/OnlineShopping";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234Lib#"; // Change this to your DB password

    // Method to get database connection
    public static Connection getConnection() throws SQLException {
        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the MySQL driver is loaded
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        }
        
        // Establish and return the connection to the database
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}

package shoppers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> users = new ArrayList<>();  // Renaming 'products1' to 'users'

        try (Connection conn = DBConnection.getConnection()) {
            // Fetch all users from the database
            String selectQuery = "SELECT * FROM users"; // Query the 'users' table
            try (PreparedStatement stmt = conn.prepareStatement(selectQuery);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> user = new HashMap<>();
                    user.put("id", String.valueOf(rs.getInt("id")));
                    user.put("username", rs.getString("username"));
                    user.put("email", rs.getString("email"));
                    user.put("isAdmin", String.valueOf(rs.getBoolean("isAdmin")));  // Added handling for 'isAdmin'
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
        System.out.println("Fetched Users: " + users);  
        // Set 'users' as a request attribute for JSP
        request.setAttribute("users", users);  // Use "users" here to match the JSP reference

        // Forward the request to the JSP for displaying the users
       
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("view-users.jsp");
        dispatcher.forward(request, response);
    }
}





        // Forward to the JSP for displaying the products
    
package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> users = new ArrayList<>(); // List to hold user data

        // Fetch all users from the database
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users";  // SQL query to select all users
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        // Map to hold user data for each row
                        Map<String, String> user = new HashMap<>();
                        user.put("id", String.valueOf(rs.getInt("id"))); // User ID
                        user.put("username", rs.getString("username")); // Username
                        user.put("email", rs.getString("email")); // User email
                        users.add(user); // Add user to the list
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }

        // Set the list of users in the request attribute so it can be accessed in the JSP page
        request.setAttribute("userList", users);

        // Forward the request to the JSP page for rendering the user list
        RequestDispatcher dispatcher = request.getRequestDispatcher("/userList.jsp");
        dispatcher.forward(request, response);
    }
}

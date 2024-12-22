package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // SQL query to insert a new user
        String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);  // In production, hash the password before storing
            stmt.setString(3, email);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to login page after successful signup
                response.sendRedirect("login.jsp");
            } else {
                // Handle failure (e.g., username already exists)
                response.getWriter().println("Error during signup!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}

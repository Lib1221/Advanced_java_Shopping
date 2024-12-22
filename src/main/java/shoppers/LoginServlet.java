package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // SQL query to validate the user and check admin status
        String sql = "SELECT isAdmin FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve isAdmin from the result set
                    boolean isAdmin = rs.getBoolean("isAdmin");

                    if (isAdmin) {
                        // Redirect to admin dashboard
                        response.sendRedirect("AdminDashboardServlet");
                    } else {
                        // Redirect to user product list page
                        response.sendRedirect("ProductListServlet");
                    }
                } else {
                    // Invalid login credentials
                    response.getWriter().println("Invalid username or password!");
                }
            } catch (SQLException e) {
                System.out.println("Error processing result set: " + e.getMessage());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}

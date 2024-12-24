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
        String sql = "SELECT id, isAdmin FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve user ID and admin status
                    int userId = rs.getInt("id");
                    boolean isAdmin = rs.getBoolean("isAdmin");

                    // Start a session and set the user ID
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", userId);

                    if (isAdmin) {
                        // Redirect to admin dashboard
                        response.sendRedirect("AdminDashboardServlet");
                    } else {
                        // Redirect to user product list page
                        response.sendRedirect("ProductListServlet");
                    }
                } else {
                    // Invalid login credentials
                    request.setAttribute("errorMessage", "Invalid username or password!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                System.out.println("Error processing result set: " + e.getMessage());
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during login processing.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }
}

package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); // Get the session without creating a new one
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if the user is not logged in
            return;
        }
        int totalUsers = 0;
        int totalProducts = 0;
        int adminsOnline = 1; // Placeholder: Adjust logic to calculate actual admins online

        try (Connection conn = DBConnection.getConnection()) {
            // Count total users
            String userCountQuery = "SELECT COUNT(*) FROM users";
            try (PreparedStatement stmt = conn.prepareStatement(userCountQuery);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalUsers = rs.getInt(1);
                }
            }

            // Count total products
            String productCountQuery = "SELECT COUNT(*) FROM products";
            try (PreparedStatement stmt = conn.prepareStatement(productCountQuery);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalProducts = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Pass data to JSP
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("adminsOnline", adminsOnline);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin-dashboard.jsp");
        dispatcher.forward(request, response);
    }
}

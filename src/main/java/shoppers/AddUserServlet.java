package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddUserServlet extends HttpServlet {

    // Handles GET requests (such as when the user directly accesses the URL)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the JSP page for adding a user (addUser.jsp)
        // Assuming you have this JSP page to display the form
        request.getRequestDispatcher("/addUser.jsp").forward(request, response);
    }

    // Handles POST requests (when the form is submitted)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user details from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));

        // Process the form data (save to the database)
        try (Connection conn = DBConnection.getConnection()) {
            // Insert user into the database
            String insertQuery = "INSERT INTO users (username, email, password, isAdmin) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, password); // Make sure to hash the password before storing in real-world applications
                stmt.setBoolean(4, isAdmin);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        // Redirect to the ViewUsersServlet to display the updated list of users
        response.sendRedirect("ViewUsersServlet");
    }
}

package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddProductServlet extends HttpServlet {

    // Handles GET requests (such as when the user directly accesses the URL)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the JSP page for adding a product (addProduct.jsp)
        // Assuming you have this JSP page to display the form
        request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
    }

    // Handles POST requests (when the form is submitted)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve product details from the form
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("image_url");

        // Process the form data (save to the database)
        try (Connection conn = DBConnection.getConnection()) {
            // Insert product into the database
            String insertQuery = "INSERT INTO products (name, description, price, image_url) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setDouble(3, price);
                stmt.setString(4, imageUrl);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        // Redirect back to the dashboard after successfully adding the product
        response.sendRedirect("ViewProductsServlet");
    }
}

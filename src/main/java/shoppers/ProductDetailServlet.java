package shoppers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID from the request parameter
        String productId = request.getParameter("id");

        // Initialize a map to hold the product details
        Map<String, String> product = new HashMap<>();

        try (Connection conn = DBConnection.getConnection()) {
            // Query to fetch product details from the database
            String selectQuery = "SELECT * FROM products WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(selectQuery)) {
                stmt.setString(1, productId);  // Set the product ID parameter
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Populate the product map with details
                        product.put("id", String.valueOf(rs.getInt("id")));
                        product.put("name", rs.getString("name"));
                        product.put("description", rs.getString("description"));
                        product.put("price", String.valueOf(rs.getDouble("price")));
                        product.put("image_url", rs.getString("image_url"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        // Check if the product exists
        if (!product.isEmpty()) {
            // Set the product details as a request attribute for the JSP
            request.setAttribute("product", product);

            // Forward the request to the JSP to display the product details
            RequestDispatcher dispatcher = request.getRequestDispatcher("productdetail.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the product doesn't exist, return a 404 error
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
        }
    }
}

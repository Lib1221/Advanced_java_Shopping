package shoppers;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SearchProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query"); // Search query
        List<Map<String, String>> products = new ArrayList<>();
        Set<Integer> productIds = new HashSet<>(); // To track unique product IDs

        try (Connection connection = DBConnection.getConnection()) {
            // SQL query to fetch all products
            String sql = "SELECT id, name, description, price, image_url FROM products";
            PreparedStatement statement;

            if (query != null && !query.trim().isEmpty()) {
                sql += " WHERE LOWER(name) LIKE ? OR LOWER(description) LIKE ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, "%" + query.toLowerCase() + "%");
                statement.setString(2, "%" + query.toLowerCase() + "%");
            } else {
                statement = connection.prepareStatement(sql);
            }

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("id");
                if (!productIds.contains(productId)) { // Check for duplicates
                    productIds.add(productId); // Mark this ID as added

                    Map<String, String> product = new HashMap<>();
                    product.put("id", String.valueOf(productId));
                    product.put("name", rs.getString("name"));
                    product.put("description", rs.getString("description"));
                    product.put("price", rs.getString("price"));
                    product.put("image_url", rs.getString("image_url"));
                    products.add(product);
                }
            }

        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }

        // Pass the product list to the JSP page
        request.setAttribute("productList", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
        dispatcher.forward(request, response);
    }
}

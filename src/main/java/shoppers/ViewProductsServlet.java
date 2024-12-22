

package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ViewProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> products1 = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            // Fetch all products from the database
            String selectQuery = "SELECT * FROM products"; // Ensure the correct table name is used
            try (PreparedStatement stmt = conn.prepareStatement(selectQuery);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> product1 = new HashMap<>();
                    product1.put("id", String.valueOf(rs.getInt("id")));
                    product1.put("name", rs.getString("name"));
                    product1.put("description", rs.getString("description"));
                    product1.put("price", String.valueOf(rs.getDouble("price")));
                    product1.put("image_url", rs.getString("image_url"));
                    products1.add(product1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        // Set products as a request attribute
        request.setAttribute("producting", products1);

        // Forward to the JSP for displaying the products
        RequestDispatcher dispatcher = request.getRequestDispatcher("view-products.jsp");
        dispatcher.forward(request, response);
    }
}

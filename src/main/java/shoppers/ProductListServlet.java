package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ProductListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> products = new ArrayList<>();

        // Fetch all products from the database
        String sql = "SELECT * FROM products";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, String> product = new HashMap<>();
                product.put("id", String.valueOf(rs.getInt("id")));
                product.put("name", rs.getString("name"));
                product.put("description", rs.getString("description"));
                product.put("price", rs.getString("price"));
                product.put("image_url", rs.getString("image_url"));
                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set the list of products in the request attribute
        request.setAttribute("productList", products);

        // Forward to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/productList.jsp");
        dispatcher.forward(request, response);
    }
}

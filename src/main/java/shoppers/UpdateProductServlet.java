package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try (Connection conn = DBConnection.getConnection()) {
            String selectQuery = "SELECT * FROM products WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(selectQuery)) {
                stmt.setInt(1, Integer.parseInt(id));
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("id", rs.getInt("id"));
                        request.setAttribute("name", rs.getString("name"));
                        request.setAttribute("description", rs.getString("description"));
                        request.setAttribute("price", rs.getDouble("price"));
                        request.setAttribute("image_url", rs.getString("image_url"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        // Forward to update form JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("update-product.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the updated product details
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("image_url");

        try (Connection conn = DBConnection.getConnection()) {
            String updateQuery = "UPDATE products SET name = ?, description = ?, price = ?, image_url = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setDouble(3, price);
                stmt.setString(4, imageUrl);
                stmt.setInt(5, id);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }

        // Redirect back to the products page
        response.sendRedirect("ViewProductsServlet");
    }
}

package shoppers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class CartServlet extends HttpServlet {

    // Handles GET requests (e.g., showing the cart)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the session without creating a new one
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if the user is not logged in
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        Map<Integer, Map<String, Object>> cartItems = new HashMap<>();

        try (Connection conn = DBConnection.getConnection()) {
            // Query to fetch the current active cart for the user from the cart table
            String query = 
                "SELECT c.product_id, p.name, p.price, c.quantity, (p.price * c.quantity) AS total " +
                "FROM cart c " +
                "JOIN products p ON c.product_id = p.id " +
                "WHERE c.user_id = ?";

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    double total = rs.getDouble("total");

                    Map<String, Object> itemDetails = new HashMap<>();
                    itemDetails.put("name", name);
                    itemDetails.put("price", price);
                    itemDetails.put("quantity", quantity);
                    itemDetails.put("total", total);

                    cartItems.put(productId, itemDetails);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching cart items: " + e.getMessage());
            return;
        }

        // If cart is empty, inform the user but still forward to the cart.jsp
        if (cartItems.isEmpty()) {
            request.setAttribute("message", "Your cart is empty.");
        } else {
            request.setAttribute("cartItems", cartItems);
        }

        // Forward to the cart.jsp to display cart (even if empty)
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }

    // Handles POST requests (e.g., update or delete cart items)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the session without creating a new one
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            updateCartItem(userId, productId, quantity);
        } else if ("delete".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            deleteCartItem(userId, productId);
        }

        // After action is completed, redirect back to the cart page
        response.sendRedirect("CartServlet");
    }

    // Method to update the quantity of an item in the cart
    private void updateCartItem(int userId, int productId, int quantity) {
        try (Connection conn = DBConnection.getConnection()) {
            // Update the quantity in the cart table for the specified user and product
            String updateQuery = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
            updateStmt.setInt(1, quantity);
            updateStmt.setInt(2, userId);
            updateStmt.setInt(3, productId);
            updateStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to delete an item from the cart
    private void deleteCartItem(int userId, int productId) {
        try (Connection conn = DBConnection.getConnection()) {
            // Delete the item from the cart table for the specified user and product
            String deleteQuery = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
            deleteStmt.setInt(1, userId);
            deleteStmt.setInt(2, productId);
            deleteStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

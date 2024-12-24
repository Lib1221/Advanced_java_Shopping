package shoppers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the session without creating a new one

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try (Connection conn = DBConnection.getConnection()) {
            // Check if the product is already in the user's cart
            String checkQuery = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, productId);

            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    // If product exists in cart, update the quantity
                    int existingQuantity = rs.getInt("quantity");
                    String updateQuery = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                    updateStmt.setInt(1, existingQuantity + quantity);
                    updateStmt.setInt(2, userId);
                    updateStmt.setInt(3, productId);
                    updateStmt.executeUpdate();
                } else {
                    // If product doesn't exist in cart, insert a new row
                    String insertQuery = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                    insertStmt.setInt(1, userId);
                    insertStmt.setInt(2, productId);
                    insertStmt.setInt(3, quantity);
                    insertStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error adding product to cart: " + e.getMessage());
            return;
        }

        // Redirect back to the cart page
        response.sendRedirect("CartServlet");
    }
}

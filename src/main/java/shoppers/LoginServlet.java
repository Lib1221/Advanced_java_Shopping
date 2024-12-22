package shoppers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {  // Use the DBConnection class to get the connection
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // User found, forward to user list
                        List<Map<String, String>> users = new ArrayList<>();
                        do {
                            Map<String, String> user = new HashMap<>();
                            user.put("id", String.valueOf(rs.getInt("id")));
                            user.put("username", rs.getString("username"));
                            user.put("email", rs.getString("email"));
                            users.add(user);
                        } while (rs.next());
                        
                        request.setAttribute("userList", users);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        // Invalid login, redirect to login page with error
                        response.sendRedirect("login.jsp?error=Invalid username or password");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

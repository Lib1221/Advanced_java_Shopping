<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body>
    <div class="header">
        <div class="logo-section">
            <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
            <h1 class="store-title">Liben Store</h1>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search for users...">
            <button class="search-btn">Search</button>
        </div>
        <div class="actions">
            <img src="images/carts.png" alt="Cart Icon" class="action-icon">
            <img src="images/orders.png" alt="Order Icon" class="action-icon">
        </div>
        
        <!-- Add User Button -->
        <a href="AddUserServlet"><button>Add User</button></a>
    </div>

    <h1 class="section-heading" style="text-align: center;">View Users</h1>
    <div class="container" style="margin: 20px auto; padding: 20px;">
        <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: left;">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Admin</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Retrieve the user list from the request --%>
                <%
                    // Retrieve the map list from the request
                    List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");

                    // Check if the list is null or empty
                    if (users != null && !users.isEmpty()) {
                        // Iterate through the list of users
                        for (Map<String, String> user : users) {
                %>
                            <tr>
                                <td><%= user.get("id") %></td>
                                <td><%= user.get("username") %></td>
                                <td><%= user.get("email") %></td>
                                <td><%= user.get("isAdmin").equals("true") ? "Yes" : "No" %></td>
                                <td>
                                    <!-- Link to Edit User Servlet -->
                                   
                        			
                        			<a href="EditUserServlet?id=<%= user.get("id") %>" class="btn btn-sm btn-warning">Edit</a>
                        			<a href="DeleteUserServlet?id=<%= user.get("id") %>"onclick="return confirm('Are you sure you want to delete this user?')"  class="btn btn-sm btn-warning">Delete</a>
                                    
                    
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5" style="text-align: center;">No users found</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="AdminDashboardServlet" class="btn btn-secondary mt-3">Back to Dashboard</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - Liben Store</title>
    <!-- Link to Bootstrap 5 CDN for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Header Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="images/log.png" alt="Liben Store Logo" class="logo-img" style="width: 50px; height: auto;">
                Liben Store
            </a>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search for users..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
            <div>
                <img src="images/carts.png" alt="Cart Icon" class="action-icon" style="width: 30px; margin-left: 15px;">
                <img src="images/orders.png" alt="Order Icon" class="action-icon" style="width: 30px; margin-left: 15px;">
            </div>
        </div>
    </nav>

    <!-- Add User Button Section -->
    <div class="container mt-3">
        <a href="AddUserServlet" class="btn btn-success mb-3">Add User</a>
    </div>

    <!-- User List Section -->
    <div class="container">
        <h1 class="text-center mb-4">View Users</h1>

        <table class="table table-bordered table-striped">
            <thead class="table-dark">
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
                    List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");
                    if (users != null && !users.isEmpty()) {
                        for (Map<String, String> user : users) {
                %>
                            <tr>
                                <td><%= user.get("id") %></td>
                                <td><%= user.get("username") %></td>
                                <td><%= user.get("email") %></td>
                                <td><%= user.get("isAdmin").equals("true") ? "Yes" : "No" %></td>
                                <td>
                                    <!-- Edit and Delete buttons -->
                                    <a href="EditUserServlet?id=<%= user.get("id") %>" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="DeleteUserServlet?id=<%= user.get("id") %>"
                                       onclick="return confirm('Are you sure you want to delete this user?')" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5" class="text-center">No users found</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- Back to Dashboard Button -->
        <a href="AdminDashboardServlet" class="btn btn-secondary mt-3">Back to Dashboard</a>
    </div>

    <!-- Include Bootstrap JS for interactive components (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

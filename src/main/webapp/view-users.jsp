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
    <style>
        .logo-img {
            max-width: 50px;
            height: auto;
        }

        .navbar {
            background-color: #000000;
        }

        .navbar-brand {
            color: white;
            font-weight: bold;
        }

        .sidebar {
            background-color: #007b00;
            color: white;
            height: 100vh;
            padding-top: 20px;
        }

        .sidebar .nav-link {
            color: white;
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        .store-title {
            text-align: center;
            color: white;
            font-size: 1.75rem;
            font-weight: bold;
        }

        .custom-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #f8f9fa;
            text-align: center;
            padding: 1rem;
        }

        footer p {
            margin: 0;
            color: #333;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            
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

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar p-3">
                <!-- Logo and Store Name with Redirection -->
                <a href="AdminDashboardServlet" class="text-decoration-none">
                    <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
                    <h1 class="store-title">Liben Store</h1>
                </a>
                <hr class="text-white">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="ViewProductsServlet">View & Edit Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewUsersServlet">View & Edit Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-4">
                <div class="container mt-4">
                    <h1 class="text-center mb-4">View Users</h1>

                    <!-- Add User Button Section -->
                    <div class="container mb-3">
                        <a href="AddUserServlet" class="btn btn-success mb-3">Add User</a>
                    </div>

                    <!-- User List Section -->
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
            </main>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>© 2024 Liben Store. All rights reserved.</p>
    </footer>

    <!-- Include Bootstrap JS for interactive components (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

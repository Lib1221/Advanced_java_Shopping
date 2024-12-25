<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item List - Liben Store</title>
    <!-- Link to Bootstrap 5 CDN -->
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
            background-color: #000000;
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

        .table img {
            max-width: 150px;
            height: auto;
        }

        .action-icons img {
            width: 30px;
            margin-left: 15px;
        }

        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>


    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar p-3">
                <a href="AdminDashboardServlet" class="text-decoration-none">
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
                    <h1 class="text-center mb-4">View Items</h1>
                    <header>
       
        <div class="search-bar mb-5">
              
            <form action="SearchProductServlet" method="GET" class="d-flex">
    <input type="text" name="query" class="form-control me-2" placeholder="Search for products...">
    <button type="submit" class="btn btn-outline-success">Search</button>
</form>
        </div>
    </header>

                    <!-- Add Product Button Section -->
                    <div class="container mb-3">
                        <a href="AddProductServlet" class="btn btn-success mb-3">Add Product</a>
                    </div>

                    <!-- Item List Section -->
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Item Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- Retrieve the list of items from the request --%>
                            <%
                                List<Map<String, String>> itemList = (List<Map<String, String>>) request.getAttribute("producting");

                                // Check if the list is null or empty
                                if (itemList != null && !itemList.isEmpty()) {
                                    // Iterate through the list of items
                                    for (Map<String, String> item : itemList) {
                            %>
                                    <tr>
                                        <td><%= item.get("name") %></td>
                                        <td><%= item.get("description") %></td>
                                        <td>$<%= item.get("price") %></td>
                                        <td>
                                            <!-- Image with fixed size -->
                                            <img src="<%= item.get("image_url") %>" alt="<%= item.get("name") %>" class="img-fluid">
                                        </td>
                                        <td>
                                            <!-- Update and Delete buttons -->
                                            <a href="updateItem?id=<%= item.get("id") %>" class="btn btn-sm btn-warning">Update</a>
                                            <a href="DeleteItem?id=<%= item.get("id") %>" onclick="return confirm('Are you sure you want to delete this item?')" class="btn btn-sm btn-danger">Delete</a>
                                        </td>
                                    </tr>
                            <%
                                    }
                                } else {
                            %>
                                    <tr>
                                        <td colspan="5" class="text-center">No items found</td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        &copy; 2024 Liben Store. All rights reserved.
    </footer>

    <!-- Bootstrap JS (for components like modal, dropdown, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

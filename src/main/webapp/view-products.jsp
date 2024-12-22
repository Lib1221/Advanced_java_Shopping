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
</head>
<body>

    <!-- Header Section (Navbar) -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="images/log.png" alt="Liben Store Logo" class="logo-img" style="width: 50px; height: auto;">
                Liben Store
            </a>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search for products..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
            <div>
                <img src="images/carts.png" alt="Cart Icon" class="action-icon" style="width: 30px; margin-left: 15px;">
                <img src="images/orders.png" alt="Order Icon" class="action-icon" style="width: 30px; margin-left: 15px;">
            </div>
        </div>
    </nav>

    <!-- Add Product Button Section -->
    <div class="container mt-3">
        <a href="AddProductServlet" class="btn btn-success mb-3">Add Products</a>
    </div>

    <!-- Item List Section -->
    <div class="container mt-4">
        <h1 class="text-center mb-4">View Items</h1>

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
                <%-- Retrieve the map list from the request --%>
                <%
                    List<Map<String, String>> itemList = (List<Map<String, String>>) request.getAttribute("producting");

                    // Check if the map is null or empty
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
                                    <img src="<%= item.get("image_url") %>" alt="<%= item.get("name") %>" class="img-fluid" style="max-width: 150px; height: auto;">
                                </td>
                                <td>
                                    <!-- Link to Update Servlet -->
                                    <a href="updateItem?id=<%= item.get("id") %>" class="btn btn-sm btn-warning">Update</a>
                                    <!-- Link to Delete Servlet -->
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

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        &copy; 2024 Liben Store. All rights reserved.
    </footer>

    <!-- Bootstrap JS (for components like modal, dropdown, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

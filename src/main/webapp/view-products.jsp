<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item List</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body>
    <div class="header">
        <div class="logo-section">
            <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
            <h1 class="store-title">Liben Store</h1>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search for products...">
            <button class="search-btn">Search</button>
        </div>
        <div class="actions">
            <img src="images/carts.png" alt="Cart Icon" class="action-icon">
            <img src="images/orders.png" alt="Order Icon" class="action-icon">
        </div>
        
        <li class="nav-item">
        
        <a class="nav-link" href="AddProductServlet"><button>Add Products</button></a></li>
        
        
    </div>

    <h1 class="section-heading" style="text-align: center;">View Items</h1>
    <div class="container" style="margin: 20px auto; padding: 20px;">
        <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: left;">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th> <!-- New Actions Column -->
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the map list from the request
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
                                <td><img src="<%= item.get("image_url") %>" alt="<%= item.get("name") %>" style="width: 100px; height: auto;"></td>
                                <td>
                                    <!-- Link to Update Servlet -->
                                    <a href="updateItem?id=<%= item.get("id") %>" class="btn btn-sm btn-warning">Update</a>
                                    <!-- Link to Delete Servlet -->
                                    <a href="DeleteItem?id=<%= item.get("id") %>" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5" style="text-align: center;">No items found</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="footer" style="text-align: center; margin-top: 40px;">
        &copy; 2024 Liben Store. All rights reserved.
    </div>
</body>
</html>

<%@ page import="java.util.*, java.util.stream.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liben Store</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo">
            <img src="images/log.png" alt="Liben Store Logo">
            <h1>Liben Store</h1>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search for products...">
        </div>
        <div class="actions">
        
            <img src="images/carts.png"  alt="Cart Icon">
            <img src="images/orders.png" alt="Order Icon">
        </div>
    </div>

    <!-- Product List -->
    <h1>Our Products</h1>
    <div class="product-container">
        <%
            // Fetch the product list from the request scope
            List<Map<String, String>> products = (List<Map<String, String>>) request.getAttribute("productList");
            if (products != null && !products.isEmpty()) {
                for (Map<String, String> product : products) {
        %>
                    <div class="product-card">
                        <img src="<%= product.get("image_url") %>" alt="<%= product.get("name") %>" class="product-image">
                        <div class="product-info">
                            <h2 class="product-title"><%= product.get("name") %></h2>
                            <p class="product-description"><%= product.get("description") %></p>
                            <p class="product-price">$<%= product.get("price") %></p>
                            <a href="#" class="buy-now">Buy Now</a>
                        </div>
                    </div>
        <%
                }
            } else {
        %>
                <p>No products available!</p>
        <%
            }
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2024 Liben Store. All rights reserved.
    </div>
</body>
</html>

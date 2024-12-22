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
    </div>

    <!-- Product List -->
    <h1 class="product-heading">Our Products</h1>
    <div class="product-slider">
        <div class="product-container">
            <%
                // Example product data if productList attribute is not provided
                List<Map<String, String>> products = (List<Map<String, String>>) request.getAttribute("productList");
                if (products == null || products.isEmpty()) {
                    products = Arrays.asList(
                        Map.of("name", "Product 1", "description", "Description 1", "price", "10.99", "image_url", "images/product1.jpg"),
                        Map.of("name", "Product 2", "description", "Description 2", "price", "20.99", "image_url", "images/product2.jpg"),
                        Map.of("name", "Product 3", "description", "Description 3", "price", "30.99", "image_url", "images/product3.jpg"),
                        Map.of("name", "Product 4", "description", "Description 4", "price", "40.99", "image_url", "images/product4.jpg"),
                        Map.of("name", "Product 5", "description", "Description 5", "price", "50.99", "image_url", "images/product5.jpg")
                    );
                }

                // Render each product
                for (int i = 0; i < 2; i++) { // Duplicate products for a seamless loop
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
                }
            %>
        </div>
    </div>

    <!-- New Section for All Items -->
<h1 class="section-heading" style="text-align: center;">Explore More Products</h1>
<div class="building-blocks" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;">
    <%
        // Render products in a dynamic, puzzle-like grid layout
        for (Map<String, String> product : products) {
    %>
        <div class="block-card" style="width: 250px; text-align: center; border: 1px solid #ddd; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
            <img src="<%= product.get("image_url") %>" alt="<%= product.get("name") %>" class="block-image" 
                 style="width: 100%; height: auto; object-fit: cover;">
            <div class="block-info" style="padding: 10px;">
                <h2 class="block-title" style="font-size: 1.2em; color: #333; margin-bottom: 5px;"><%= product.get("name") %></h2>
                <p class="block-price" style="font-weight: bold; color: #007b00; font-size: 1.1em;">$<%= product.get("price") %></p>
            </div>
        </div>
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

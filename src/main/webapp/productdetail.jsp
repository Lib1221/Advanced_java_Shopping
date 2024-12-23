<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Header styles */
        .header {
            background-color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header .logo-section {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }

        .header .logo-section img {
            width: 60px;
            height: auto;
        }

        .header .store-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #007b00;
        }

        /* Product Detail Section */
        .product-detail {
            display: flex;
            flex-direction: column;
            gap: 30px;
            align-items: center;
            margin-top: 30px;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            max-width: 800px; /* Increased image size */
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-image img {
            width: 100%;
            object-fit: cover;
            height: 500px; /* Increased image height */
        }

        .product-info {
            text-align: center;
            width: 100%;
            max-width: 800px;
        }

        .product-title {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #333;
            font-weight: 600;
        }

        .product-description {
            font-size: 1.2em;
            margin-bottom: 15px;
            color: #666;
        }

        .product-price {
            font-weight: bold;
            font-size: 1.8em;
            color: #007b00;
            margin-bottom: 25px;
        }

        .quantity-selector {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .quantity-selector input {
            width: 80px;
            text-align: center;
            font-size: 1.2em;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 1.2em;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        /* Footer styles */
        .footer {
            background-color: #f8f9fa;
            text-align: center;
            padding: 20px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }

        .footer p {
            margin: 0;
            color: #333;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo-section">
            <a href="ProductListServlet" class="text-decoration-none">
                <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
                <h1 class="store-title">Liben Store</h1>
            </a>
        </div>
    </div>

    <!-- Product Detail -->
    <div class="container my-5 product-detail">
        <%
            // Extract the product details from the map
            Map<String, String> product = (Map<String, String>) request.getAttribute("product");
            String name = product.get("name");
            String description = product.get("description");
            String price = product.get("price");
            String imageUrl = product.get("image_url");
        %>

        <!-- Product Image -->
        <div class="product-image">
            <img src="<%= imageUrl %>" alt="<%= name %>">
        </div>

        <!-- Product Info -->
        <div class="product-info">
            <h1 class="product-title"><%= name %></h1>
            <p class="product-description"><%= description %></p>
            <p class="product-price">$<%= price %></p>
            
            <!-- Quantity Selector -->
            <div class="quantity-selector">
                <label for="quantity" class="form-label">Quantity:</label>
                <input type="number" id="quantity" class="form-control" value="1" min="1">
            </div>

            <!-- Add to Cart Button -->
            <button class="btn btn-success">Add to Cart</button>
            
            <!-- Back to Products Button -->
            <a href="ProductListServlet" class="btn btn-secondary">Back to Products</a>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Liben Store. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

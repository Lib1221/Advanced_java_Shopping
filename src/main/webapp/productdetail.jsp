<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    
    <style>
        /* Header styles */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        body {
            background-color: #f8f9fa;
        }

        .header {
            background-color: #f8f9fa;
            padding: 20px 0;
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
      <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="ProductListServlet">Liben Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CartServlet">Cart</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header Section -->
    <header>
        <h1>Liben Store</h1>
        <p>Your Favorite Place to Shop Online</p>
        <div class="search-bar">
              
            <form action="SearchProductServlet" method="GET" class="d-flex">
    <input type="text" name="query" class="form-control me-2" placeholder="Search for products...">
    <button type="submit" class="btn btn-outline-success">Search</button>
</form>
        </div>
    </header>

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
        <div class="product-info mb-5">
            <h1 class="product-title"><%= name %></h1>
            <p class="product-description"><%= description %></p>
            <p class="product-price">$<%= price %></p>
            
            <!-- Add to Cart Button -->
            <form action="AddToCartServlet" method="POST" class="d-inline">
                <input type="hidden" name="productId" value="<%= product.get("id") %>">
                <input type="hidden" name="quantity" value="1">
                <button type="submit" class="btn btn-success">Add to Cart</button>
            </form>

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

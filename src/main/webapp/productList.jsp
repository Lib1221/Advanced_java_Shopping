<%@ page import="java.util.*, java.util.stream.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liben Store</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa; /* Light background color */
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
        nav {
            background-color: #343a40;
        }

        nav a {
            color: white;
            font-weight: bold;
            text-decoration: none;
        }

        nav a:hover {
            color: #007bff;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
        }

        /* Header Styling */
        header {
            background-color: #007bff; /* Blue background for header */
            color: white;
            padding: 40px 0; /* Decreased padding to shorten hero section */
            text-align: center;
        }

        header h1 {
            font-size: 3rem;
            font-weight: bold;
        }

        header p {
            font-size: 1.5rem;
        }

        /* Hero Section */
        .hero-section {
            background: url('images/hero-image.jpg') no-repeat center center/cover;
            height: 400px; /* Adjusted height for the hero section */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            border-radius: 10px;
            margin-top: 30px;
        }

        .hero-text {
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        /* Product Card Styling */
        .product-card {
            border-radius: 15px;
            background-color: white;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            margin-top: 20px;
            overflow: hidden;
            width: 280px; /* Fixed width for product cards */
        }

        .product-card:hover {
            transform: translateY(-10px); /* 3D hover effect */
            box-shadow: 0 25px 40px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-title {
            font-size: 1.4rem;
            color: #333;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-description {
            font-size: 1rem;
            color: #666;
            margin-bottom: 15px;
        }

        .product-price {
            font-size: 1.3rem;
            color: #007b00;
            font-weight: bold;
        }

        .add-to-cart {
            display: inline-block;
            padding: 10px 25px;
            margin-top: 10px;
            background-color: #007b00;
            color: white;
            border-radius: 25px;
            font-weight: bold;
            text-decoration: none;
        }

        .add-to-cart:hover {
            background-color: #005700;
        }

        /* Footer Section */
        footer {
            background-color: #343a40; /* Dark footer background */
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto; /* Ensures footer sticks to the bottom */
        }

        /* Search Bar Styling */
        .search-bar {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .search-input {
            width: 500px;
            padding: 10px;
            border-radius: 25px;
            border: 1px solid #ddd;
            margin-right: 10px;
            font-size: 1rem;
        }

        .search-button {
            width: 180px;
            padding: 12px;
            background-color: #007b00;
            color: white;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            border: none;
        }

        .search-button:hover {
            background-color: #005700;
        }
        
        /* Product Sliding Container */
        .product-container {
            position: relative;
            overflow: hidden;
            width: 100%;
            margin-top: 40px;
        }

        .product-container .row {
            display: flex;
            flex-wrap: nowrap;
            animation: slide-left-to-right 20s linear infinite; /* Adjust the timing */
        }

        /* Animation for horizontal sliding */
        @keyframes slide-left-to-right {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        /* Optional: To control the space between product cards */
        .product-container .row .col {
            flex: 0 0 auto;
            margin-right: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-text {
                font-size: 1.5rem;
            }

            .product-card {
                margin-top: 10px;
            }
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


    <!-- Product List -->
    <div class="container product-container">
        <h1 class="text-center text-dark mb-4">Our Products</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <%
                // Example product data if productList attribute is not provided
                List<Map<String, String>> products = (List<Map<String, String>>) request.getAttribute("productList");
                if (products == null || products.isEmpty()) {
                    products = Arrays.asList(
                        // Example data if productList is empty.
                    );
                }

                // Render each product dynamically in the product cards
                for (Map<String, String> product : products) {
            %>
            <div class="col">
                <a href="ProductDetailServlet?id=<%= product.get("id") %>" class="text-decoration-none">
                    <div class="product-card">
                        <img src="<%= product.get("image_url") %>" alt="<%= product.get("name") %>" class="product-image">
                        <div class="product-info">
                            <h2 class="product-title"><%= product.get("name") %></h2>
                            <p class="product-description"><%= product.get("description") %></p>
                            <p class="product-price">$<%= product.get("price") %></p>
                            <form action="AddToCartServlet" method="POST" class="d-inline">
                                <input type="hidden" name="productId" value="<%= product.get("id") %>">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-success add-to-cart">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </a>
            </div>
            <%
                }
            %>
        </div>
    </div>
    
    
    <!-- Product List -->
    <div class="container my-5">
        <h1 class="text-center mb-4">Products</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <%
                // Example product data if productList attribute is not provided
                List<Map<String, String>> prod = (List<Map<String, String>>) request.getAttribute("productList");
                if (prod == null || prod.isEmpty()) {
                    prod = Arrays.asList(
                        Map.of("id", "1", "name", "Product 1", "description", "Description 1", "price", "10.99", "image_url", "images/product1.jpg"),
                        Map.of("id", "2", "name", "Product 2", "description", "Description 2", "price", "20.99", "image_url", "images/product2.jpg"),
                        Map.of("id", "3", "name", "Product 3", "description", "Description 3", "price", "30.99", "image_url", "images/product3.jpg"),
                        Map.of("id", "4", "name", "Product 4", "description", "Description 4", "price", "40.99", "image_url", "images/product4.jpg"),
                        Map.of("id", "5", "name", "Product 5", "description", "Description 5", "price", "50.99", "image_url", "images/product5.jpg")
                    );
                }

                // Render each product dynamically in the product cards
                for (Map<String, String> product : prod) {
            %>
           <div class="col">
                <a href="ProductDetailServlet?id=<%= product.get("id") %>" class="text-decoration-none">
                    <div class="product-card">
                        <img src="<%= product.get("image_url") %>" alt="<%= product.get("name") %>" class="product-image">
                        <div class="product-info">
                            <h2 class="product-title"><%= product.get("name") %></h2>
                            <p class="product-description"><%= product.get("description") %></p>
                            <p class="product-price">$<%= product.get("price") %></p>
                            <form action="AddToCartServlet" method="POST" class="d-inline">
                                <input type="hidden" name="productId" value="<%= product.get("id") %>">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-success add-to-cart">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </a>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        &copy; 2024 Liben Store. All rights reserved.
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%@ page import="java.util.*, java.util.stream.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liben Store</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS for specific tweaks */
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        
        .product-card:hover {
            transform: scale(1.05); /* Zoom effect on hover */
        }
        
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-title {
            font-size: 1.2em;
            color: #333;
        }

        .product-description {
            font-size: 0.9em;
            color: #666;
            margin-bottom: 10px;
        }

        .product-price {
            font-weight: bold;
            color: #007b00;
            font-size: 1.2em;
        }

        .buy-now {
            display: inline-block;
            padding: 8px 20px;
            margin-top: 10px;
            background-color: #007b00;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .buy-now:hover {
            background-color: #005700;
        }

        .search-bar {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
        }

        .search-input {
            width: 300px;
            padding: 8px;
            margin-right: 10px;
        }

        .header, .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
        }

        .footer {
            font-size: 0.9em;
        }

        .logo-section img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="container d-flex justify-content-between align-items-center">
            
        <div class="logo-section d-flex align-items-center gap-3">
    <a href="ProductListServlet" class="text-decoration-none d-flex align-items-center">
        <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
        <h1 class="store-title ms-3">Liben Store</h1>
    </a>
</div>

    
            
            <form action="SearchProductServlet" method="GET" class="d-flex">
    <input type="text" name="query" class="form-control me-2" placeholder="Search for products...">
    <button type="submit" class="btn btn-outline-success">Search</button>
</form>

            <div class="actions d-flex align-items-center">
                <img src="images/carts.png" alt="Cart Icon" class="action-icon" width="30">
                <img src="images/orders.png" alt="Order Icon" class="action-icon" width="30">
            </div>
        </div>
    </div>

    <!-- Product List -->
    <div class="container my-5">
        <h1 class="text-center mb-4">Our Products</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <%
                // Example product data if productList attribute is not provided
                List<Map<String, String>> products = (List<Map<String, String>>) request.getAttribute("productList");
                if (products == null || products.isEmpty()) {
                    products = Arrays.asList(
                        Map.of("id", "1", "name", "Product 1", "description", "Description 1", "price", "10.99", "image_url", "images/product1.jpg"),
                        Map.of("id", "2", "name", "Product 2", "description", "Description 2", "price", "20.99", "image_url", "images/product2.jpg"),
                        Map.of("id", "3", "name", "Product 3", "description", "Description 3", "price", "30.99", "image_url", "images/product3.jpg"),
                        Map.of("id", "4", "name", "Product 4", "description", "Description 4", "price", "40.99", "image_url", "images/product4.jpg"),
                        Map.of("id", "5", "name", "Product 5", "description", "Description 5", "price", "50.99", "image_url", "images/product5.jpg")
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
                            <a href="#" class="buy-now">Buy Now</a>
                        </div>
                    </div>
                </a>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2024 Liben Store. All rights reserved.
    </div>

    <!-- JS Function for Search -->
    <script>
        function searchProducts() {
            let query = document.getElementById('search-input').value.toLowerCase();
            let products = document.querySelectorAll('.product-card');

            products.forEach(product => {
                let productName = product.querySelector('.product-title').innerText.toLowerCase();
                if (productName.includes(query)) {
                    product.style.display = 'block';
                } else {
                    product.style.display = 'none';
                }
            });
        }
    </script>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

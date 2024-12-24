<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liben Electronic Store - Home</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Ensures that the body and html take the full height of the screen */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        /* Main content section should take the remaining space */
        main {
            flex: 1;
        }

        /* Custom styles for the Hero section */
        .hero {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Smooth 3D gradient */
            background-size: 400% 400%; /* Creates a dynamic effect on hover */
            color: white;
            padding: 100px 0; /* Increased padding for a spacious look */
            text-align: center;
            transition: background-position 1s ease-in-out; /* Smooth transition */
        }

        .hero h1 {
            font-size: 3rem;
        }

        .hero p {
            font-size: 1.5rem;
        }

        /* Product card styles */
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        
            
            .product-image {
            width: 100%;
            height: 200px; /* Controls image height */
            object-fit: cover; /* Ensures the image covers the area without distortion */
            border-radius: 8px 8px 0 0;
        
            
        }

        .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: bold;
            color: #333;
        }

        .product-description {
            color: #666;
            font-size: 0.9rem;
        }

        .product-price {
            color: #28a745;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .add-to-cart {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-to-cart:hover {
            background-color: #0056b3;
        }

        /* Hover effect for Hero */
        .hero:hover {
            background-position: 100% 100%;
        }

        /* Footer styles */
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px;
            width: 100%;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="images/log.png" alt="Liben Store Logo" style="width: 50px; height: auto;">
                Liben Store
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero">
        <div class="container">
            <h1 class="display-4">Welcome to Liben Electronic Store</h1>
            <p class="lead">Your one-stop shop for all your electronic needs</p>
        </div>
    </header>

    <!-- Main Content Section -->
    <main class="container py-5">
        <section class="text-center">
            <h2 class="display-4 mb-3">Shop the Latest Electronics</h2>
            <p class="lead mb-5">Discover amazing gadgets, phones, laptops, and more!</p>

            <!-- Product Grid -->
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <!-- Example Product Card 1: Laptop -->
                <div class="col">
                    <div class="product-card">
                        <img src="https://img.freepik.com/free-photo/still-life-books-versus-technology_23-2150062920.jpg?t=st=1735045289~exp=1735048889~hmac=338add01f7975cdb2970589378026ab444aed8d55840f7c1e1b2707a1d4d1fb2&w=1380" alt="Laptop" class="product-image">
                        <div class="product-info">
                            <h3 class="product-title">Laptop</h3>
                            <p class="product-description">High-performance laptop for all your needs</p>
                            <p class="product-price">$999</p>
                            <button class="add-to-cart" onclick="window.location.href='login.jsp'">Add to Cart</button>
                        </div>
                    </div>
                </div>
                <!-- Example Product Card 2: Smartphone -->
                <div class="col">
                    <div class="product-card">
                        <img src="https://img.freepik.com/free-vector/colorful-smartphone-covers_23-2147499165.jpg?t=st=1735045558~exp=1735049158~hmac=10e1ab247c889ccb46f43d03c076a0a08e9fb714b10ea77821e49f10f3c7ffbd&w=826" alt="Smartphone" class="product-image">
                        <div class="product-info">
                            <h3 class="product-title">Smartphone</h3>
                            <p class="product-description">Latest smartphone with amazing features</p>
                            <p class="product-price">$799</p>
                            <button class="add-to-cart" onclick="window.location.href='login.jsp'">Add to Cart</button>
                        </div>
                    </div>
                </div>
                <!-- Example Product Card 3: Headphones -->
                <div class="col">
                    <div class="product-card">
                        <img src="https://img.freepik.com/free-vector/headphone-entertainment-audio-illustration_53876-6427.jpg?t=st=1735045607~exp=1735049207~hmac=6871e704b7fc5c2e4ae92c6b0a50d26145ce291754cfa44382974a80d984a54a&w=826" alt="Headphones" class="product-image">
                        <div class="product-info">
                            <h3 class="product-title">Headphones</h3>
                            <p class="product-description">Noise-cancelling headphones for better sound</p>
                            <p class="product-price">$199</p>
                            <button class="add-to-cart" onclick="window.location.href='login.jsp'">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex justify-content-center mt-5">
                <a href="login.jsp" class="btn btn-primary btn-lg me-3">Login</a>
                <a href="signup.jsp" class="btn btn-secondary btn-lg">Sign Up</a>
            </div>
        </section>
    </main>

    <!-- Footer Section -->
    <footer>
        <p class="mb-0">&copy; 2024 Liben Electronic Store. All rights reserved.</p>
    </footer>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

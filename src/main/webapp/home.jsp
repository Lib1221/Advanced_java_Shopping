<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liben Electronic Store - Home</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <header class="hero bg-primary text-white text-center py-5">
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

            <!-- Action Buttons -->
            <div class="d-flex justify-content-center">
                <a href="login.jsp" class="btn btn-primary btn-lg me-3">Login</a>
                <a href="signup.jsp" class="btn btn-secondary btn-lg">Sign Up</a>
            </div>
        </section>
    </main>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3">
        <p class="mb-0">&copy; 2024 Liben Electronic Store. All rights reserved.</p>
    </footer>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

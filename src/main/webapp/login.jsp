<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Liben Electronic Store</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles for a more modern design */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        body {
            background-color: #f8f9fa;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 80px 0;
        }

        header h1 {
            font-size: 3rem;
        }

        header p {
            font-size: 1.5rem;
        }

        /* Login form card styling */
        .login-card {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .login-card:hover {
            transform: scale(1.03);
        }

        .login-card h2 {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #333;
        }

        .login-card .form-label {
            font-weight: 500;
            color: #555;
        }

        .login-card .form-control {
            height: 45px;
            font-size: 1rem;
        }

        .btn-primary {
            padding: 12px 20px;
            font-size: 1.1rem;
        }

        .text-center a {
            color: #007bff;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        /* Footer Section */
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto; /* Ensures footer sticks to the bottom */
        }

        /* Background styles for the body */
        .bg-light {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="home.jsp">
                <img src="images/log.png" alt="Liben Store Logo" style="width: 50px; height: auto;">
                Liben Store
            </a>
        </div>
    </nav>

    <!-- Header Section -->
    <header class="text-center">
        <h1 class="display-4">Liben Electronic Store</h1>
        <p class="lead">Your one-stop shop for all your electronic needs</p>
    </header>

    <!-- Login Form Section -->
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="login-card shadow-lg p-4">
            <h2 class="mb-4">Login</h2>
            <form action="LoginServlet" method="POST">
                
                <!-- Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
                </div>

                <!-- Submit Button -->
                <div class="d-grid gap-2 mb-3">
                    <button type="submit" class="btn btn-primary btn-lg">Login</button>
                </div>
            </form>

            <!-- Signup Link -->
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="signup.jsp">Sign up here</a></p>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p class="mb-0">&copy; 2024 Liben Electronic Store. All rights reserved.</p>
    </footer>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

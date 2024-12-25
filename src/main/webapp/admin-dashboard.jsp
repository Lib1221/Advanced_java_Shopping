<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styling for Sidebar and Dashboard -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        /* Header and Navbar Styling */
        .navbar {
            background-color: #000000; /* Black background */
            padding: 15px 30px;
        }

        .navbar-brand {
            font-size: 2rem;
            font-weight: bold;
            color: #ffffff !important; /* White text */
        }

        .navbar-nav .nav-link {
            color: #ffffff !important; /* White text */
            font-size: 1.1rem;
        }

        .navbar-nav .nav-link:hover {
            background-color: #495057;
            color: #ffc107; /* Highlight color */
        }

        .logo-img {
            max-width: 150px; /* Increased logo size */
            height: auto;
            display: block;
            margin: 0 auto;
        }

        .store-title {
            text-align: center;
            color: white;
            font-size: 2.5rem; /* Increased title font size */
            font-weight: bold;
            margin-top: 10px;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: #000000;
            color: white;
            height: 100vh;
            padding-top: 30px;
        }

        .sidebar .nav-link {
            color: white;
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        /* Card Styling */
        .custom-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .custom-card .card-body {
            padding: 2rem;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .card-text {
            font-size: 2rem;
            color: #007bff;
        }

        /* Welcome Section */
        .welcome-title {
            font-size: 2.5rem;
            font-weight: bold;
        }

        .welcome-text {
            font-size: 1.25rem;
            color: #6c757d;
        }

        /* Footer Styling */
        footer {
            background-color: #f8f9fa;
            text-align: center;
            padding: 1rem;
        }

        footer p {
            margin: 0;
            color: #333;
            font-size: 0.9em;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container-fluid {
                padding-left: 0;
                padding-right: 0;
            }

            .navbar {
                padding: 10px 20px;
            }

            .navbar-brand {
                font-size: 1.5rem;
            }

            .store-title {
                font-size: 2rem;
            }

            .logo-img {
                max-width: 120px; /* Adjust logo size on smaller screens */
            }
        }
    </style>
</head>
<body>

  

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar Section -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar p-3">
                <a href="ProductListServlet" class="text-decoration-none">
                    <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
                    <h1 class="store-title">Liben Store</h1>
                </a>
                <hr class="text-white">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="ViewProductsServlet">View & Edit Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewUsersServlet">View & Edit Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </nav>

            <!-- Main Content Section -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-4">
            
                <div class="container mt-4">
                    <h1 class="welcome-title">Welcome, Admin!</h1>
                    <p class="welcome-text">Use the navigation menu to manage users and products.</p>
				<header>
       
        <div class="search-bar">
              
            <form action="SearchProductServlet" method="GET" class="d-flex">
    <input type="text" name="query" class="form-control me-2" placeholder="Search for products...">
    <button type="submit" class="btn btn-outline-success">Search</button>
</form>
        </div>
    </header>
                    <!-- Dashboard Cards -->
                    <div class="row mt-4">
                        <!-- Total Users Card -->
                        <div class="col-md-4">
                            <div class="card custom-card text-center">
                                <div class="card-body">
                                    <h5 class="card-title">Total Users</h5>
                                    <p class="card-text"><strong><%= request.getAttribute("totalUsers") %></strong></p>
                                </div>
                            </div>
                        </div>
                        <!-- Total Products Card -->
                        <div class="col-md-4">
                            <div class="card custom-card text-center">
                                <div class="card-body">
                                    <h5 class="card-title">Total Products</h5>
                                    <p class="card-text"><strong><%= request.getAttribute("totalProducts") %></strong></p>
                                </div>
                            </div>
                        </div>
                        <!-- Admins Online Card -->
                        <div class="col-md-4">
                            <div class="card custom-card text-center">
                                <div class="card-body">
                                    <h5 class="card-title">Admins Online</h5>
                                    <p class="card-text"><strong><%= request.getAttribute("adminsOnline") %></strong></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>© 2024 Liben Store. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

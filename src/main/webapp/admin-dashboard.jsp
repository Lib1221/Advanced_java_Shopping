<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styling for Sidebar -->
    <style>
        .sidebar {
            background-color: #343a40;
            height: 100vh;
        }

        .sidebar .nav-link {
            color: white;
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        .custom-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .custom-card .card-body {
            padding: 2rem;
        }

        .welcome-title {
            font-size: 2.5rem;
            font-weight: bold;
        }

        .welcome-text {
            font-size: 1.25rem;
            color: #6c757d;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .card-text {
            font-size: 2rem;
            color: #007bff;
        }

        .logo-img {
            max-width: 100px;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        .store-title {
            text-align: center;
            color: white;
            font-size: 1.75rem;
            font-weight: bold;
        }

        .sidebar a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar p-3">
                <!-- Logo and Store Name with Redirection -->
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

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-4">
                <div class="container mt-4">
                    <h1 class="welcome-title">Welcome, Admin!</h1>
                    <p class="welcome-text">Use the navigation menu to manage users and products.</p>

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

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

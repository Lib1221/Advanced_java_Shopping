<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { height: 100vh; background-color: #343a40; color: #fff; }
        .sidebar a { color: #ddd; text-decoration: none; }
        .sidebar a:hover { background-color: #495057; color: #fff; }
        .content { padding: 20px; }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar">
                <div class="p-3">
                    <h3 class="text-center">Admin Dashboard</h3>
                    <hr>
                    <ul class="nav flex-column">
                        <li class="nav-item"><a class="nav-link" href="ViewProductsServlet">View & Edit Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="ViewUsersServlet">View & Edit Users</a></li>
                        <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 content">
                <div class="container">
                    <h1>Welcome, Admin!</h1>
                    <p>Use the navigation menu to manage users and products.</p>
                    <div class="row mt-4">
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-body">
                                    <h5 class="card-title">Total Users</h5>
                                    <p class="card-text"><strong><%= request.getAttribute("totalUsers") %></strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-body">
                                    <h5 class="card-title">Total Products</h5>
                                    <p class="card-text"><strong><%= request.getAttribute("totalProducts") %></strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-center">
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

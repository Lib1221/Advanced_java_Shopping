<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - Liben Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .logo-img {
            max-width: 50px;
            height: auto;
        }

        .navbar {
            background-color: #007b00;
        }

        .navbar-brand {
            color: white;
            font-weight: bold;
        }

        .sidebar {
            background-color: #000000;
            color: white;
            height: 100vh;
            padding-top: 20px;
        }

        .sidebar .nav-link {
            color: white;
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        .store-title {
            text-align: center;
            color: white;
            font-size: 1.75rem;
            font-weight: bold;
        }

        .custom-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

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

        .form-control {
            border-radius: 10px;
        }

        .btn {
            border-radius: 10px;
        }

        .back-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>

 
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar p-3">
                <a href="AdminDashboardServlet" class="text-decoration-none height 400px">
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
                <div class="container mt-5">
                    <h2 class="text-center">Add Product</h2>
                    <form action="AddProductServlet" method="post">
                        <!-- Product Name -->
                        <div class="mb-4">
                            <label for="name" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        
                        <!-- Product Description -->
                        <div class="mb-4">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                        </div>
                        
                        <!-- Product Price -->
                        <div class="mb-4">
                            <label for="price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="price" name="price" step="0.01" required>
                        </div>
                        
                        <!-- Product Image URL -->
                        <div class="mb-4">
                            <label for="image_url" class="form-label">Image URL</label>
                            <input type="text" class="form-control" id="image_url" name="image_url" required>
                        </div>
                        
                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Add Product</button>
                    </form>
                    
                    <!-- Back to Dashboard Button -->
                    <a href="AdminDashboardServlet" class="btn btn-secondary mt-3 back-btn">Back to Dashboard</a>
                </div>
            </main>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        &copy; 2024 Liben Store. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

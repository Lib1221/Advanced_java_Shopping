<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User - Liben Store</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styling for Header and Form -->
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #007b00;
            color: white;
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header .logo-section {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .header .logo-img {
            height: 40px;
            width: auto;
        }

        .header .store-title {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .actions {
            display: flex;
            justify-content: flex-end;
            padding: 1rem;
        }

        .actions .btn {
            font-size: 1rem;
        }

        .section-heading {
            text-align: center;
            margin-top: 2rem;
            font-size: 2rem;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            border-radius: 0.375rem;
        }

        .btn-primary {
            width: 100%;
            padding: 0.75rem;
            font-size: 1.1rem;
            border-radius: 0.375rem;
        }

        .container {
            max-width: 600px;
            margin-top: 3rem;
        }

        .back-btn {
            margin-top: 1.5rem;
            width: 100%;
        }
        
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

        @media (max-width: 768px) {
            .container {
                margin-top: 2rem;
            }

            .section-heading {
                font-size: 1.5rem;
            }
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
                    <h2 class="text-center">Add New User</h2>
                    <form action="AddUserServlet" method="POST">
					            <!-- Username -->
					            <div class="form-group">
					                <label for="username">Username:</label>
					                <input type="text" id="username" name="username" required class="form-control">
					            </div>
					
					            <!-- Email -->
					            <div class="form-group">
					                <label for="email">Email:</label>
					                <input type="email" id="email" name="email" required class="form-control">
					            </div>
					
					            <!-- Password -->
					            <div class="form-group">
					                <label for="password">Password:</label>
					                <input type="password" id="password" name="password" required class="form-control">
					            </div>
					
					            <!-- Admin Selection -->
					            <div class="form-group">
					                <label for="isAdmin">Admin:</label>
					                <select id="isAdmin" name="isAdmin" class="form-control">
					                    <option value="true">Yes</option>
					                    <option value="false">No</option>
					                </select>
					            </div>
					
					            <!-- Submit Button -->
					            <button type="submit" class="btn btn-primary">Add User</button>
					        </form>
                    
                    
                    
                    <!-- Back to Dashboard Button -->
                    <a href="AdminDashboardServlet" class="btn btn-secondary mt-3 back-btn">Back to Dashboard</a>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

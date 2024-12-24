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

    <!-- Header Section -->
    <header class="header">
        <div class="logo-section">
            <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
            <h1 class="store-title">Liben Store</h1>
        </div>
        <div class="actions">
            <a href="ViewUsersServlet">
                <button class="btn btn-light">View Users</button>
            </a>
        </div>
    </header>

    <!-- Add User Form Section -->
    <h1 class="section-heading">Add New User</h1>

    <div class="container">
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
        <a href="AdminDashboardServlet" class="btn btn-secondary back-btn">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

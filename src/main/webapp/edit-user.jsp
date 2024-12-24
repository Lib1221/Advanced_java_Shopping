<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Liben Store</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        /* Sticky Header */
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

        /* Main Form Container */
        .container {
            max-width: 600px;
            margin-top: 80px;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: bold;
        }

        .form-check-label {
            font-size: 1rem;
        }

        .form-check-input {
            width: 20px;
            height: 20px;
        }

        .form-buttons {
            margin-top: 1.5rem;
            display: flex;
            justify-content: space-between;
        }

        .btn-custom {
            font-size: 1.1rem;
            padding: 0.75rem 1.5rem;
            border-radius: 0.375rem;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .container {
                margin-top: 30px;
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
    </header>

    <!-- Edit User Form Section -->
    <div class="container">
        <h1 class="text-center mb-4">Edit User</h1>
        
        <!-- Edit User Form -->
        <form action="EditUserServlet" method="POST" class="form-container">
            <input type="hidden" name="id" value="${id}" />
            
            <!-- Username Input -->
            <div class="form-group">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" value="${username}" required class="form-control" />
            </div>

            <!-- Email Input -->
            <div class="form-group">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" value="${email}" required class="form-control" />
            </div>

            <!-- Admin Checkbox -->
            <div class="form-group form-check">
                <input type="checkbox" id="isAdmin" name="isAdmin" 
                       <c:if test="${isAdmin == true}"> checked</c:if>
                       class="form-check-input" />
                <label for="isAdmin" class="form-check-label">Admin</label>
            </div>

            <!-- Form Buttons -->
            <div class="form-buttons">
                <button type="submit" class="btn btn-primary btn-custom">Save Changes</button>
                <a href="ViewUsersServlet" class="btn btn-secondary btn-custom">Cancel</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

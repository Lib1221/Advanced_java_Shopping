<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Liben Store</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Custom styles for the form */
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

        .btn-custom {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-buttons {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>

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
                <!-- Corrected checkbox with conditionally checked attribute -->
                <input type="checkbox" id="isAdmin" name="isAdmin" 
                       <c:if test="${isAdmin == true}"> checked</c:if>
                       class="form-check-input" />
                <label for="isAdmin" class="form-check-label">Admin</label>
            </div>

            <!-- Form Buttons -->
            <div class="form-buttons d-flex justify-content-between">
                <button type="submit" class="btn btn-primary btn-custom">Save Changes</button>
                <a href="ViewUsersServlet" class="btn btn-secondary btn-custom">Cancel</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap 5 JS Bundle (for form validation or other features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body>
    <div class="header">
        <div class="logo-section">
            <img src="images/log.png" alt="Liben Store Logo" class="logo-img">
            <h1 class="store-title">Liben Store</h1>
        </div>
        <div class="actions">
            <a href="ViewUsersServlet"><button>View Users</button></a>
        </div>
    </div>

    <h1 class="section-heading" style="text-align: center;">Add New User</h1>
    <div class="container" style="margin: 20px auto; padding: 20px;">
        <form action="AddUserServlet" method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="isAdmin">Admin:</label>
                <select id="isAdmin" name="isAdmin">
                    <option value="true">Yes</option>
                    <option value="false">No</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Add User</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

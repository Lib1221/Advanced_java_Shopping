<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <!-- Link to Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="images/log.png" alt="Liben Store Logo" style="width: 50px; height: auto;">
                Liben Store
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="AdminDashboardServlet">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewItemsServlet">View Items</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddProductServlet">Add Product</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Product Update Form Section -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Update Product</h2>

        <form action="updateItem" method="POST">
            <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">

            <!-- Product Name Field -->
            <div class="mb-3">
                <label for="name" class="form-label">Product Name:</label>
                <div class="input-group">
                    <span class="input-group-text" id="name-addon"><i class="bi bi-box"></i></span>
                    <input type="text" class="form-control" name="name" value="<%= request.getAttribute("name") %>" required aria-describedby="name-addon">
                </div>
            </div>

            <!-- Product Description Field -->
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <textarea class="form-control" name="description" rows="4" required><%= request.getAttribute("description") %></textarea>
            </div>

            <!-- Product Price Field -->
            <div class="mb-3">
                <label for="price" class="form-label">Price ($):</label>
                <div class="input-group">
                    <span class="input-group-text" id="price-addon">$</span>
                    <input type="number" class="form-control" name="price" value="<%= request.getAttribute("price") %>" required aria-describedby="price-addon">
                </div>
            </div>

            <!-- Product Image URL Field -->
            <div class="mb-3">
                <label for="image_url" class="form-label">Image URL:</label>
                <div class="input-group">
                    <span class="input-group-text" id="url-addon"><i class="bi bi-image"></i></span>
                    <input type="text" class="form-control" name="image_url" value="<%= request.getAttribute("image_url") %>" required aria-describedby="url-addon">
                </div>
            </div>

            <!-- Submit Button -->
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">Update Product</button>
            </div>
        </form>
    </div>

    <!-- Include Bootstrap JS (for functionality like dropdowns, modals, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Include Bootstrap Icons for input groups (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

</body>
</html>

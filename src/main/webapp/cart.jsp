<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <style>
        /* Custom styling */

        .navbar .navbar-brand {
            font-size: 1.8rem;
            color: white;
        }

        .navbar .nav-link {
            color: white;
        }

        .navbar .nav-link:hover {
            color: #28a745;
        }

        footer {
            background-color: #f8f9fa;
        }

        .footer p {
            margin: 0;
            color: #333;
            font-size: 0.9em;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .action-icon {
            width: 30px;
            height: 30px;
            margin-left: 10px;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="ProductListServlet">Liben Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CartServlet">Cart</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header Section -->
    <header>
        <h1>Liben Store</h1>
        <p>Your Favorite Place to Shop Online</p>
        <div class="search-bar">
              
            <form action="SearchProductServlet" method="GET" class="d-flex">
    <input type="text" name="query" class="form-control me-2" placeholder="Search for products...">
    <button type="submit" class="btn btn-outline-success">Search</button>
</form>
        </div>
    </header>

<!-- Cart Content -->
<div class="container my-5">
    <h2 class="text-center mb-4">Your Shopping Cart</h2>

    <%
        Map<Integer, Map<String, Object>> cartItems = (Map<Integer, Map<String, Object>>) request.getAttribute("cartItems");
        double grandTotal = 0;

        if (cartItems == null || cartItems.isEmpty()) {
    %>
        <div class="alert alert-warning text-center" role="alert">
            Your cart is empty! <a href="ProductListServlet" class="alert-link">Continue shopping</a>.
        </div>
    <%
        } else {
    %>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Map.Entry<Integer, Map<String, Object>> entry : cartItems.entrySet()) {
                    Map<String, Object> item = entry.getValue();
                    String name = (String) item.get("name");
                    double price = (double) item.get("price");
                    int quantity = (int) item.get("quantity");
                    double total = (double) item.get("total");
            %>
                <tr>
                    <td><%= name %></td>
                    <td>$<%= String.format("%.2f", price) %></td>
                    <td>
                        <form action="CartServlet" method="POST" style="display: inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productId" value="<%= entry.getKey() %>">
                            <input type="number" name="quantity" value="<%= quantity %>" min="1" class="form-control d-inline w-auto" required>
                            <button type="submit" class="btn btn-primary btn-sm">Update</button>
                        </form>
                    </td>
                    <td>$<%= String.format("%.2f", total) %></td>
                    <td>
                        <form action="CartServlet" method="POST" style="display: inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="productId" value="<%= entry.getKey() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                grandTotal += total;
                }
            %>
                <tr class="table-primary">
                    <td colspan="3" class="text-end"><strong>Grand Total</strong></td>
                    <td><strong>$<%= String.format("%.2f", grandTotal) %></strong></td>
                </tr>
            </tbody>
        </table>

        <!-- Action Buttons -->
        <div class="d-flex justify-content-between">
            <a href="ProductListServlet" class="btn btn-secondary">Continue Shopping</a>
            <a href="CheckoutServlet" class="btn btn-success">Proceed to Checkout</a>
        </div>
    <%
        }
    %>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <p class="mb-0">© 2024 Liben Store. All rights reserved.</p>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

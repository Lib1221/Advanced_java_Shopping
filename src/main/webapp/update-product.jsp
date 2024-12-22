<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
</head>
<body>
    <h1>Update Product</h1>
    <form action="updateItem" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= request.getAttribute("name") %>" required><br>
        <label for="description">Description:</label>
        <textarea name="description" required><%= request.getAttribute("description") %></textarea><br>
        <label for="price">Price:</label>
        <input type="number" name="price" value="<%= request.getAttribute("price") %>" required><br>
        <label for="image_url">Image URL:</label>
        <input type="text" name="image_url" value="<%= request.getAttribute("image_url") %>" required><br>
        <input type="submit" value="Update Product">
    </form>
</body>
</html>

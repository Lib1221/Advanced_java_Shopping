<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form action="EditUserServlet" method="POST">
        <input type="hidden" name="id" value="${id}"/>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${username}" required/><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${email}" required/><br>

        <label for="isAdmin">Admin:</label>
        <input type="checkbox" id="isAdmin" name="isAdmin" <c:if test="${isAdmin == true}">checked</c:if>/><br>

        <button type="submit">Save Changes</button>
    </form>

    <a href="ViewUsersServlet">Cancel</a>
</body>
</html>

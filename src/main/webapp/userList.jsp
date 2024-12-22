<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - Electronics Shop</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <!-- Header Section -->
    <header class="header">
        <h1>Registered Users</h1>
    </header>

    <!-- User Table Section -->
    <section class="user-list-section">
        <table class="user-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Fetch the user list from request scope and display
                    List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("userList");
                    if (users != null && !users.isEmpty()) {
                        for (Map<String, String> user : users) {
                %>
                            <tr>
                                <td><%= user.get("id") %></td>
                                <td><%= user.get("username") %></td>
                                <td><%= user.get("email") %></td>
                            </tr>
                <%
                        }
                    } else {
                        // If no users are found, display a message
                %>
                        <tr>
                            <td colspan="3" class="no-users">No users found</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </section>

    <!-- Action Buttons Section -->
    <div class="action-buttons">
        <a href="homepage.jsp" class="btn">Go to Homepage</a>
    </div>

</body>
</html>

<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - Electronics Shop</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<head>
    <title>User List</title>
    
</head>
<body>
     <div class="header">
        <h1>Registered Users</h1>
    </div>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
        </tr>
        
        <%
            // Fetch the user list from request scope and display
            List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("userList");
            if (users != null && !users.isEmpty()) {
                for (Map<String, String> user : users) {
                    out.println("<tr>");
                    out.println("<td>" + user.get("id") + "</td>");
                    out.println("<td>" + user.get("username") + "</td>");
                    out.println("<td>" + user.get("email") + "</td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr><td colspan='3' class='no-users'>No users found</td></tr>");
            }
        %>
    </table>
    
   <div class="action-buttons">
        <a href="homepage.jsp" class="btn">Go to Homepage</a>
    </div>
    
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Liben Electronic Store</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2 class="form-header">Login</h2>
        <form action="LoginServlet" method="POST">
            <div class="input-group">
                <input type="text" name="username" placeholder="Username" required><br><br>
                <input type="password" name="password" placeholder="Password" required><br><br>
            </div>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="signup.jsp">Signup here</a></p>
    </div>
</body>
</html>

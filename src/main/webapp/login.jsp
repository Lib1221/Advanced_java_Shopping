<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Electronics Shop</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="card">
        <h2>Login to Your Account</h2>
        
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>

            <button type="submit" class="btn">Login</button>
        </form>

        <p>Don't have an account? <a href="signup.jsp">Sign up here</a></p>
    </div>
</body>
</html>

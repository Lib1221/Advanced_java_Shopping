<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Electronics Shop</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="card">
        <h2>Create an Account</h2>

        <form action="SignupServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required placeholder="Choose a username">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Choose a password">
            </div>

            <button type="submit" class="btn">Sign Up</button>
        </form>

        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
    <title>QuizMaster - Login</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,700|Playfair+Display:700" rel="stylesheet">
    <style>
        :root {
            --hoverEasing: cubic-bezier(0.23, 1, 0.32, 1);
            --returnEasing: cubic-bezier(0.445, 0.05, 0.55, 0.95);
        }

        body {
            font-family: "Raleway";
            background-image: url('https://images.pexels.com/photos/268883/pexels-photo-268883.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 400px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            font-family: "Playfair Display";
            font-size: 28px;
            color: #333;
            margin: 0;
        }

        .login-header p {
            color: #666;
            margin: 10px 0 0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-button:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #dc3545;
            margin-top: 10px;
            text-align: center;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
=======
<html>
<head>
    <title>Login page</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }

        form {
            display: inline-block;
            text-align: left;
            margin-top: 20px;
        }

        input[type="text"] {
            display: block;
            width: 200px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
>>>>>>> 993fc4a66590bfd6c8aa8f36b916b7d9e781065b
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <div class="login-container">
        <div class="login-header">
            <h1>QuizMaster</h1>
            <p>Sign in to your account</p>
        </div>

        <form action="login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="error-message">
                <% if (request.getAttribute("error") != null) { %>
                    <%= request.getAttribute("error") %>
                <% } %>
            </div>

            <button type="submit" class="login-button">Log In</button>
        </form>

        <a href="solar_system.html" class="back-link">Back to Home</a>
    </div>
=======
<h1>Welcome to Homework 5</h1>

<p>Please log in.</p>

<form action="Login" method="post">
    <label>User Name:</label>
    <input type="text" name="username" />

    <label>Password:</label>
    <input type="text" name="password" />

    <input type="submit" value="Login" />
</form>

<p><a href="create_new.jsp">Create New Account</a></p>
>>>>>>> 993fc4a66590bfd6c8aa8f36b916b7d9e781065b
</body>
</html>

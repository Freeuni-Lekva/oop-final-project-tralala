<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - QuizMaster</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            background-image: url('https://wallpaper.dog/large/20419572.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background-color: rgba(30, 30, 30, 0.9);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 350px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #f1f1f1;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #e0e0e0;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #666;
            border-radius: 4px;
            font-size: 14px;
            background-color: #222;
            color: #f1f1f1;
        }

        .form-group input:focus {
            border-color: #888;
            outline: none;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #888;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #666;
        }

        .error-message {
            color: #ff4d4d;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }

        .link {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #bbbbff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Login to QuizMaster</h2>
    <form action="/Login" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required />
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />
        </div>

        <div class="error-message">
            <% if (request.getAttribute("error") != null) { %>
            <%= request.getAttribute("error") %>
            <% } %>
        </div>

        <button type="submit" class="login-button">Login</button>
    </form>

    <a href="create_new.jsp" class="link">Create New Account</a>
    <a href="solar_system.html" class="link">Back to Home</a>
</div>
</body>
</html>

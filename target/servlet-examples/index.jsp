<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login page</title>
    <style>
        h2.assignment-title {
            color: #2e86c1;
            font-size: 32px; /* Increased font size */
            text-align: center;
        }

        h1 {
            text-align: center;
        }

        .form-container {
            text-align: center;
        }

        .login-form {
            display: inline-block;
            text-align: left;
            padding: 10px;
        }

        .login-form input[type="text"],
        .login-form input[type="submit"] {
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }

        .login-form label {
            display: block;
            margin-bottom: 4px;
        }
    </style>
</head>
<body>
<h2 class="assignment-title">Assignment 5</h2>

<h1>Welcome to Homework 5</h1>

<div class="form-container">
    <form class="login-form" action="Login" method="post">
        <label>User Name:</label>
        <input type="text" name="username" />

        <label>Password:</label>
        <input type="text" name="password" />

        <input type="submit" value="Login" />
    </form>
</div>

<div style="text-align: center;">
    <a href="create_new.jsp">Create New Account</a>
</div>
</body>
</html>

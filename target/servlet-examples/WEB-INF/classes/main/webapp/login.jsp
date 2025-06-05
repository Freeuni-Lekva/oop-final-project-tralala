<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        }
    </style>
</head>
<body>
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
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Account</title>
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

        label {
            display: block;
            margin-bottom: 4px;
        }
    </style>
</head>
<body>
<h1>Create New Account</h1>

<p>Please enter your desired username and password.</p>

<form action="AccountCreation" method="post">
    <label>User Name:</label>
    <input type="text" name="username" />

    <label>Password:</label>
    <input type="text" name="password" />

    <input type="submit" value="Create" />
</form>
</body>
</html>

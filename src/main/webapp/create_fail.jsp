<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Please enter another user name and password</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        form {
            display: inline-block;
            text-align: left;
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 4px;
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
<h1>The name <%= request.getParameter("username") %> is already in use</h1>
<p>Please enter another username and password.</p>

<form action="AccountCreation" method="post">
    <label>User Name:</label>
    <input type="text" name="username" />

    <label>Password:</label>
    <input type="text" name="password" />

    <input type="submit" value="Create" />
</form>
</body>
</html>

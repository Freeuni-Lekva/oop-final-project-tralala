<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Please Try Again</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .form-container {
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
<h1>Please Try Again</h1>

<p style="color: red;">Either your username or password is incorrect. Please try again.</p>

<div class="form-container">
    <form action="Login" method="post">
        <label>User Name:</label>
        <input type="text" name="username"/>

        <label>Password:</label>
        <input type="text" name="password"/>

        <input type="submit" value="Login"/>
    </form>
</div>

<br>
<a href="create_new.jsp">Create New Account</a>
</body>
</html>

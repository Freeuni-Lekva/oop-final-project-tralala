<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Please Try Again</title>
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
            background-color: #121212;
            background-image: url('https://wallpaper.dog/large/20419572.jpg');
            background-size: cover;
            background-position: center;
        }

        .container {
            background-color: rgba(30, 30, 30, 0.95);
            padding: 20px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 300px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        .form-container {
            display: inline-block;
            text-align: left;
            margin-top: 20px;
        }

        h1 {
            text-align: center;
            color: #f1f1f1;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .error-message {
            color: #ff4c4c;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .create-link {
            color: #b497ff;
            font-size: 13px;
            text-decoration: none;
            display: inline-block;
            margin-top: 15px;
        }

        .create-link:hover {
            color: #d0bcff;
            text-decoration: underline;
        }
        input[type="text"],
        input[type="username"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #666;
            border-radius: 4px;
            font-size: 13px;
            background-color: #222;
            color: #f1f1f1;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #f14444, #c73333);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #ff5555, #e04444);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(241, 68, 68, 0.4);
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #cccccc;
            font-size: 14px;
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="container">

    <h1>Please Try Again</h1>


    <p class="error-message">Either your username or password is incorrect.</p>

    <div class="form-container">
        <form action="Login" method="post">
            <label>Username:</label>
            <input type="text" name="username"/>

            <label>Password:</label>
            <input type="password" name="password"/>

            <input type="submit" value="Login"/>
        </form>
    </div>

    <br>
    <a class="create-link" href="create_new.jsp">Create New Account</a>
</div>
</body>
</html>

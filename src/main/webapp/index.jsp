<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web Store</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,700|Playfair+Display:700" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            margin: 0;
            font-family: "Raleway";
            font-size: 14px;
            font-weight: 500;
            background-color: #BCAAA4;
            -webkit-font-smoothing: antialiased;
        }

        .container {
            padding: 40px 80px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card-wrap {
            margin: 10px;
            transform: perspective(800px);
            transform-style: preserve-3d;
            cursor: pointer;
        }

        .card {
            position: relative;
            flex: 0 0 240px;
            width: 240px;
            height: 320px;
            background-color: #333;
            overflow: hidden;
            border-radius: 10px;
        }

        .card-bg {
            opacity: 0.5;
            position: absolute;
            top: -20px; left: -20px;
            width: 100%;
            height: 100%;
            padding: 20px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            pointer-events: none;
        }

        .card-info {
            padding: 20px;
            position: absolute;
            bottom: 0;
            color: #fff;
            transform: translateY(40%);
        }

        .card-info h1 {
            font-family: "Playfair Display";
            font-size: 36px;
            font-weight: 700;
            text-shadow: rgba(black, 0.5) 0 10px 10px;
        }

        .card-info p {
            opacity: 0;
            text-shadow: rgba(black, 1) 0 2px 3px;
        }

        .card-info:after {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-image: linear-gradient(to bottom, transparent 0%, rgba(#000, 0.6) 100%);
            background-blend-mode: overlay;
            opacity: 0;
            transform: translateY(100%);
        }

        .card-wrap:hover {
            .card-info {
                transform: translateY(0);
            }
            .card-info p {
                opacity: 1;
            }
            .card-info, .card-info p {
                transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            }
            .card-info:after {
                transition: 5s cubic-bezier(0.23, 1, 0.32, 1);
                opacity: 1;
                transform: translateY(0);
            }
            .card-bg {
                transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1), opacity 5s cubic-bezier(0.23, 1, 0.32, 1);
                opacity: 0.8;
            }
            .card {
                transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1), box-shadow 2s cubic-bezier(0.23, 1, 0.32, 1);
                box-shadow:
                    rgba(white, 0.2) 0 0 40px 5px,
                    rgba(white, 1) 0 0 0 1px,
                    rgba(black, 0.66) 0 30px 60px 0,
                    inset #333 0 0 0 5px,
                    inset white 0 0 0 6px;
            }
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #fff;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #333;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #fff;
            color: #333;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-group button:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div id="app" class="container">
        <card data-image="https://images.unsplash.com/photo-1479660656269-197ebb83b540?dpr=2&auto=compress,format&fit=crop&w=1199&h=798&q=80&cs=tinysrgb&crop=">
            <h1 slot="header">Create Account</h1>
            <div slot="content">
                <form action="AccountCreation" method="post" class="form">
                    <div class="form-group">
                        <label>First Name:</label>
                        <input type="text" name="firstName" required />
                    </div>
                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="text" name="lastName" required />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" required />
                    </div>
                    <div class="form-group">
                        <label>Username:</label>
                        <input type="text" name="username" required />
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" required />
                    </div>
                    <div class="form-group">
                        <button type="submit">Create Account</button>
                    </div>
                </form>
            </div>
        </card>
    <source src="assets/video/background1.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
</video>

<div class="overlay"></div>

<!-- ✅ Login / Create Account Buttons -->
<div class="top-right-buttons">
    <button onclick="window.location.href='login.jsp'">Login</button>
    <button onclick="window.location.href='create_new.jsp'">Create Account</button>
</div>

<div class="content">
    <div>
        <h1>Welcome to QuizMaster</h1>
        <p>Test your knowledge, challenge your mind</p>
    </div>
</div>
</body>
</html>

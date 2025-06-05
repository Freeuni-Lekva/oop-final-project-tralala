<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome <%= request.getParameter("username") %></title>
    <style>
        body {
            display: flex;
            justify-content: center;      /* horizontal centering */
            align-items: center;          /* vertical centering */
            height: 100vh;                /* full viewport height */
            margin: 0;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: green;
            font-size: 48px;
        }
    </style>
</head>
<body>
<h1>Welcome <%= request.getParameter("username") %></h1>
</body>
</html>

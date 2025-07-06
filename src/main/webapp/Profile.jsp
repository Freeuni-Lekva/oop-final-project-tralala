<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="Models.Account" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Quiz App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .profile-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 20px auto;
            display: block;
        }
        .profile-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .profile-info h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .info-row {
            margin-bottom: 15px;
        }
        .info-label {
            font-weight: bold;
            color: #666;
        }
        .edit-btn {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%
        Account account = (Account) request.getAttribute("account");
        String currentUsername = (String) request.getSession().getAttribute("username");
        boolean isSelf = (Boolean) request.getAttribute("isSelf");
        boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
    %>
    <div class="profile-container">
        <div class="profile-header">
            <h1>Profile</h1>
            <img src="${imageUrl}" alt="Profile Picture" class="profile-avatar">
            <h2>${firstName} ${lastName}</h2>
            <p class="username">@${userName}</p>
        </div>
        
        <div class="profile-info">
            <div class="info-row">
                <span class="info-label">Full Name:</span>
                <span>${firstName} ${lastName}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Username:</span>
                <span>@${userName}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Email:</span>
                <span>${email}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Profile Image:</span>
                <span><a href="${imageUrl}" target="_blank">View Image</a></span>
            </div>
            <div class="info-row">
                <span class="info-label">Friends:</span>
                <span>${profile.friends.size()} friends</span>
            </div>
            <div class="info-row">
                <span class="info-label">Achievements:</span>
                <span>${profile.achievementIds.size()} achievements</span>
            </div>
            <div class="info-row">
                <span class="info-label">Admin Status:</span>
                <span>${isAdmin ? 'Admin' : 'User'}</span>
            </div>
            
            <div class="edit-btn">
                <form action="ProfileServlet" method="post">
                    <button type="submit" name="action" value="editProfile" class="btn btn-primary">Edit Profile</button>
                </form>
            </div>
            
            <% if (request.getAttribute("isAdmin") != null && ((Boolean) request.getAttribute("isAdmin")).booleanValue()) { %>
                <div class="edit-btn">
                    <form action="ProfileServlet" method="post" id="deleteProfileForm">
                        <input type="hidden" name="action" value="deleteProfile">
                        <input type="hidden" name="username" value="${userName}">
                        <button type="submit" class="btn btn-danger" id="deleteProfileButton">Delete User</button>
                    </form>

                    <form action="ProfileServlet" method="post" id="makeAdmin">
                        <input type="hidden" name="action" value="makeAdmin">
                        <input type="hidden" name="username" value="${userName}">
                        <button type="submit" class="btn btn-primary" id="makeAdminButton">Make Admin</button>
                    </form>
                </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
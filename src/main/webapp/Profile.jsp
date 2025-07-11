<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            background-image: url('https://wallpaper.dog/large/20419572.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background-color: rgba(30, 30, 30, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 900px;
            max-width: 95%;
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 30px;
        }

        h1 {
            grid-column: 1 / -1;
            text-align: center;
            color: #f1f1f1;
            font-size: 24px;
            margin-bottom: 25px;
        }

        .left-panel {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .right-panel {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .profile-header {
            text-align: center;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #666;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            color: #f1f1f1;
            border: 3px solid #888;
        }

        .profile-name {
            color: #f1f1f1;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .profile-username {
            color: #cccccc;
            font-size: 16px;
            font-style: italic;
            margin-bottom: 5px;
        }

        .profile-section {
            text-align: center;
        }

        .section-title {
            color: #cccccc;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            border-bottom: 1px solid #666;
            padding-bottom: 5px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .stat-item {
            background-color: rgba(40, 40, 40, 0.8);
            padding: 15px;
            border-radius: 6px;
            text-align: center;
        }

        .stat-icon {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .stat-number {
            color: #f1f1f1;
            font-size: 28px;
            font-weight: bold;
        }

        .stat-label {
            color: #cccccc;
            font-size: 13px;
            margin-top: 5px;
        }

        .friends-list {
            background-color: rgba(40, 40, 40, 0.8);
            padding: 15px;
            border-radius: 6px;
            max-height: 200px;
            overflow-y: auto;
            text-align: center;
        }

        .friend-item {
            color: #f1f1f1;
            font-size: 14px;
            padding: 8px 0;
            border-bottom: 1px solid #555;
        }

        .friend-item:last-child {
            border-bottom: none;
        }

        .account-info {
            background-color: rgba(40, 40, 40, 0.8);
            padding: 15px;
            border-radius: 6px;
            text-align: center;
        }

        .info-item {
            color: #f1f1f1;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .info-label {
            color: #cccccc;
            font-size: 12px;
            display: block;
            margin-bottom: 3px;
        }

        button {
            background-color: #888;
            color: white;
            padding: 12px 20px;
            width: 100%;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #666;
        }

        .edit-profile-btn {
            background-color: #cc4444;
        }

        .edit-profile-btn:hover {
            background-color: #aa3333;
        }

        .link {
            grid-column: 1 / -1;
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
            color: #bbbbff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        .friends-list::-webkit-scrollbar {
            width: 6px;
        }

        .friends-list::-webkit-scrollbar-track {
            background: #333;
            border-radius: 3px;
        }

        .friends-list::-webkit-scrollbar-thumb {
            background: #666;
            border-radius: 3px;
        }

        .friends-list::-webkit-scrollbar-thumb:hover {
            background: #888;
        }

        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
                width: 400px;
                gap: 20px;
            }

            .profile-pic {
                width: 100px;
                height: 100px;
                font-size: 36px;
            }

            .profile-name {
                font-size: 20px;
            }

            .stat-icon {
                font-size: 28px;
            }

            .stat-number {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Profile</h1>

    <div class="left-panel">
        <div class="profile-header">
            <div class="profile-pic">
                <% if (request.getAttribute("imageUrl") != null && !((String)request.getAttribute("imageUrl")).isEmpty()) { %>
                <img src="<%= request.getAttribute("imageUrl") %>" alt="Profile Picture" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
                <% } else { %>
                👤
                <% } %>
            </div>
            <div class="profile-name"> <%= request.getAttribute("firstName") %> <%= request.getAttribute("lastName") %></div>
            <div class="profile-username">@<%= request.getAttribute("userName") %></div>
        </div>

        <div class="profile-section">
            <div class="section-title">Statistics</div>
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-icon">🏆</div>
                    <div class="stat-number">
                        <%
                            String achievementIds = (String) request.getAttribute("achievementIds");
                            int achievementCount = 0;
                            if (achievementIds != null && !achievementIds.isEmpty()) {
                                achievementCount = achievementIds.split(",").length;
                            }
                        %>
                        <%= achievementCount %>
                    </div>
                    <div class="stat-label">Achievements</div>
                </div>
                <div class="stat-item">
                    <div class="stat-icon">📝</div>
                    <div class="stat-number"><%= request.getAttribute("quizCount") != null ? request.getAttribute("quizCount") : "0" %></div>
                    <div class="stat-label">Quizzes Taken</div>
                </div>
            </div>
        </div>

        <div class="profile-section">
            <div class="section-title">Profile Settings</div>
            <button type="button" class="edit-profile-btn" onclick="editProfile()">Edit Profile</button>
        </div>
    </div>

    <div class="right-panel">
        <div class="profile-section">
            <div class="section-title">Friends</div>
            <div class="friends-list">
                <%
                    java.util.List<String> friendsList = (java.util.List<String>) request.getAttribute("friendsList");
                    if (friendsList != null && !friendsList.isEmpty()) {
                        for (String friend : friendsList) {
                %>
                <div class="friend-item"><%= friend %></div>
                <%
                    }
                } else {
                %>
                <div class="friend-item" style="color: #888;">No friends yet</div>
                <%
                    }
                %>
            </div>
        </div>

        <div class="profile-section">
            <div class="section-title">Account Information</div>
            <div class="account-info">
                <div class="info-item">
                    <div class="info-label">Email</div>
                    <%= request.getAttribute("email") %>
                </div>
                <div class="info-item">
                    <div class="info-label">Username</div>
                    <%= request.getAttribute("userName") %>
                </div>
                <div class="info-item">
                    <div class="info-label">Member Since</div>
                    <%= request.getAttribute("memberSince") %>
                </div>
            </div>
        </div>
    </div>

    <a href="solar_system.html" class="link">Back to Home</a>
</div>

<script>
    function editProfile() {
        // Redirect to edit profile page or show edit form
        alert('Edit Profile functionality would be implemented here');
        // window.location.href = 'edit_profile.jsp';
    }
</script>
</body>
</html>
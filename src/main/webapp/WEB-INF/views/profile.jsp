<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Quiz App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .profile-container {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        .profile-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .profile-header {
            background: linear-gradient(135deg, #4361ee 0%, #3f37c9 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px 15px 0 0;
        }
        .profile-header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .profile-avatar {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 3px solid white;
            box-shadow: 0 0 0 5px rgba(255, 255, 255, 0.3);
        }
        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin: 1rem 0;
            transition: transform 0.3s ease;
        }
        .stats-card:hover {
            transform: translateY(-5px);
        }
        .stats-value {
            font-size: 2rem;
            font-weight: bold;
            color: #3f37c9;
        }
        .edit-btn {
            background: linear-gradient(135deg, #4361ee 0%, #3f37c9 100%);
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            color: white;
            font-weight: bold;
            transition: transform 0.3s ease;
        }
        .edit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(63, 55, 201, 0.3);
        }
        .form-control:focus {
            border-color: #3f37c9;
            box-shadow: 0 0 0 0.2rem rgba(63, 55, 201, 0.25);
        }
    </style>
</head>
<body>
    <div class="container-fluid profile-container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="profile-card">
                    <div class="profile-header text-center">
                        <h1>My Profile</h1>
                        <div class="mt-4">
                            <img src="${profile.imageUrl}" alt="Profile Picture" class="rounded-circle profile-avatar">
                        </div>
                        <h2 class="mt-3">${profile.firstName} ${profile.lastName}</h2>
                        <p class="lead">@${profile.userName}</p>
                    </div>
                    
                    <div class="container py-4">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="stats-card text-center">
                                    <div class="stats-value">${profile.friends.size()}</div>
                                    <p class="text-muted mb-0">Friends</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="stats-card text-center">
                                    <div class="stats-value">${profile.achievementIds.size()}</div>
                                    <p class="text-muted mb-0">Achievements</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="stats-card text-center">
                                    <div class="stats-value">${profile.achievementIds.size()}</div>
                                    <p class="text-muted mb-0">Quizzes Taken</p>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Account Information</h5>
                                        <p><i class="fas fa-envelope me-2"></i>${profile.email}</p>
                                        <p><i class="fas fa-user-friends me-2"></i>${profile.friends.size()} Friends</p>
                                        <p><i class="fas fa-crown me-2"></i>${profile.achievementIds.size()} Achievements</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Profile Settings</h5>
                                        <form action="profile" method="post" class="mb-3">
                                            <div class="input-group">
                                                <input type="url" name="imageUrl" value="${profile.imageUrl}" 
                                                       class="form-control" placeholder="Enter profile picture URL">
                                                <button type="submit" class="btn btn-primary">Update Picture</button>
                                            </div>
                                        </form>
                                        <div class="d-grid gap-2">
                                            <a href="edit-profile.jsp" class="btn btn-outline-primary edit-btn">Edit Profile</a>
                                            <a href="change-password.jsp" class="btn btn-outline-secondary edit-btn">Change Password</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,700|Playfair+Display:700" rel="stylesheet">
    <style>
        :root {
            --blur-color: rgba(0, 0, 0, 0.8);
        }

        body {
            font-family: "Raleway";
            margin: 0;
            padding: 20px;
            background-color: #121212;
            background-image: url('https://wallpaper.dog/large/20419572.jpg');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .profile-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: rgba(30, 30, 30, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 100%;
        }
        
        .profile-form {
            margin-top: 30px;
            width: 90%;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #cccccc;
            font-size: 14px;
        }
        
        .form-control {
            width: 100%;
            height: 45px;
            background-color: rgba(30, 30, 30, 0.9);
            border: 2px solid #444;
            border-radius: 6px;
            padding: 12px 15px;
            color: #f1f1f1;
            font-size: 16px;
            transition: all 0.3s ease;
            opacity: 0.9;
        }

        .form-control:focus {
            background-color: rgba(30, 30, 30, 0.95);
            border-color: #666;
            transform: scale(1.02);
            opacity: 1;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        textarea.form-control {
            height: auto;
            min-height: 100px;
            resize: vertical;
        }
        
        .form-label {
            color: #ffffff;
            opacity: 0.8;
            margin-bottom: 8px;
        }
        
        .btn-primary {
            padding: 15px 30px;
            background: #2196F3;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            width: 100%;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: #1976D2;
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 40px;
            color: #f1f1f1;
        }
        
        .profile-header h2 {
            font-family: "Playfair Display";
            font-size: 36px;
            color: #f1f1f1;
            margin: 0;
        }
        
        .profile-header p {
            color: #cccccc;
            font-size: 18px;
            margin: 10px 0 0;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <h2>Edit Profile</h2>
            <p>Update your personal information</p>
        </div>
        
        <form class="profile-form" action="EditProfileServlet" method="POST">
            <div class="form-group">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            
            <div class="form-group">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            
            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="tel" class="form-control" id="phone" name="phone">
            </div>
            
            <div class="form-group">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" id="address" name="address" rows="3"></textarea>
            </div>
            
            <button type="submit" class="btn btn-primary w-100">Save Changes</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
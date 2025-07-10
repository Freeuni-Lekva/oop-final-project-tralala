<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
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
            width: 600px;
            max-width: 95%;
        }

        h1 {
            text-align: center;
            color: #f1f1f1;
            font-size: 24px;
            margin-bottom: 25px;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .section-title {
            color: #cccccc;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            border-bottom: 1px solid #666;
            padding-bottom: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            color: #cccccc;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            background-color: rgba(40, 40, 40, 0.8);
            border: 2px solid #555;
            border-radius: 6px;
            color: #f1f1f1;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-input:focus {
            outline: none;
            border-color: #888;
            background-color: rgba(40, 40, 40, 0.9);
        }

        .form-input::placeholder {
            color: #888;
        }

        textarea.form-input {
            min-height: 80px;
            resize: vertical;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .profile-pic-section {
            text-align: center;
            margin-bottom: 20px;
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

        .pic-upload-btn {
            background-color: #888;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
            margin-top: 10px;
        }

        .pic-upload-btn:hover {
            background-color: #666;
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }

        button {
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            flex: 1;
        }

        .save-btn {
            background-color: #4CAF50;
            color: white;
        }

        .save-btn:hover {
            background-color: #45a049;
        }

        .cancel-btn {
            background-color: #888;
            color: white;
        }

        .cancel-btn:hover {
            background-color: #666;
        }

        .link {
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

        .error-message {
            color: #ff6b6b;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .success-message {
            color: #4CAF50;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        #imagePreview {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        @media (max-width: 768px) {
            .container {
                width: 400px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .profile-pic {
                width: 100px;
                height: 100px;
                font-size: 36px;
            }

            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Profile</h1>

    <form action="EditProfileServlet" method="POST" enctype="multipart/form-data">
        <div class="profile-pic-section">
            <div class="profile-pic">
                <% if (request.getAttribute("imageUrl") != null && !((String)request.getAttribute("imageUrl")).isEmpty()) { %>
                <img id="imagePreview" src="<%= request.getAttribute("imageUrl") %>" alt="Profile Picture">
                <% } else { %>
                <img id="imagePreview" style="display: none;" alt="Profile Picture">
                <span id="defaultIcon">👤</span>
                <% } %>
            </div>
            <input type="file" id="profileImage" name="profileImage" accept="image/*" style="display: none;" onchange="previewImage(this)">
            <button type="button" class="pic-upload-btn" onclick="document.getElementById('profileImage').click()">
                Change Photo
            </button>
        </div>

        <div class="form-section">
            <div class="section-title">Personal Information</div>
            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-input" name="firstName"
                           value="<%= request.getAttribute("firstName") != null ? request.getAttribute("firstName") : "" %>"
                           required>
                </div>
                <div class="form-group">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-input" name="lastName"
                           value="<%= request.getAttribute("lastName") != null ? request.getAttribute("lastName") : "" %>"
                           required>
                </div>
            </div>
            <div class="form-group">
                <label class="form-label">Username</label>
                <input type="text" class="form-input" name="userName"
                       value="<%= request.getAttribute("userName") != null ? request.getAttribute("userName") : "" %>"
                       required>
            </div>
        </div>

        <div class="form-section">
            <div class="section-title">Contact Information</div>
            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" class="form-input" name="email"
                       value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                       required>
            </div>
        </div>

        <div class="form-section">
            <div class="section-title">Security</div>
            <div class="form-group">
                <label class="form-label">Current Password</label>
                <input type="password" class="form-input" name="currentPassword"
                       placeholder="Enter current password to change">
            </div>
            <div class="form-group">
                <label class="form-label">New Password</label>
                <input type="password" class="form-input" name="newPassword"
                       placeholder="Enter new password (leave blank to keep current)">
            </div>
            <div class="form-group">
                <label class="form-label">Confirm New Password</label>
                <input type="password" class="form-input" name="confirmPassword"
                       placeholder="Confirm new password">
            </div>
        </div>

        <div class="button-group">
            <button type="submit" class="save-btn">Save Changes</button>
            <button type="button" class="cancel-btn" onclick="cancelEdit()">Cancel</button>
        </div>
    </form>

    <a href="Profile.jsp" class="link">Back to Profile</a>
</div>

<script>
    function previewImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('imagePreview');
                const defaultIcon = document.getElementById('defaultIcon');

                preview.src = e.target.result;
                preview.style.display = 'block';
                if (defaultIcon) {
                    defaultIcon.style.display = 'none';
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    function cancelEdit() {
        if (confirm('Are you sure you want to cancel? Any unsaved changes will be lost.')) {
            window.location.href = 'profile.jsp';
        }
    }

    // Form validation
    document.querySelector('form').addEventListener('submit', function(e) {
        const firstName = document.querySelector('input[name="firstName"]').value.trim();
        const lastName = document.querySelector('input[name="lastName"]').value.trim();
        const email = document.querySelector('input[name="email"]').value.trim();
        const userName = document.querySelector('input[name="userName"]').value.trim();
        const currentPassword = document.querySelector('input[name="currentPassword"]').value.trim();
        const newPassword = document.querySelector('input[name="newPassword"]').value.trim();
        const confirmPassword = document.querySelector('input[name="confirmPassword"]').value.trim();

        if (!firstName || !lastName || !email || !userName) {
            e.preventDefault();
            alert('Please fill in all required fields.');
            return false;
        }

        // Email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            e.preventDefault();
            alert('Please enter a valid email address.');
            return false;
        }

        // Password validation
        if (newPassword) {
            if (!currentPassword) {
                e.preventDefault();
                alert('Please enter your current password to change it.');
                return false;
            }
            if (newPassword !== confirmPassword) {
                e.preventDefault();
                alert('New passwords do not match.');
                return false;
            }
            if (newPassword.length < 6) {
                e.preventDefault();
                alert('New password must be at least 6 characters long.');
                return false;
            }
        }

        return true;
    });
</script>
</body>
</html>
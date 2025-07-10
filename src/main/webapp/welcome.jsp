<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome <%= request.getParameter("username") %></title>
    <link rel="stylesheet" href="css/welcome.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
        <div class="title">QuizMaster</div>
        <div class="subtitle">Test your knowledge, challenge your mind</div>
            <div class="settings">
                <div class="settings-btn">
                    <a href="#" class="icon-container">
                        <svg viewBox="0 0 140 140" class="gear-icon">
                            <g class="icon">
                                <path d="M95.7,70c0,13.9-11.3,25.1-25.1,25.1S45.4,83.9,45.4,70s11.3-25.1,25.1-25.1S95.7,56.1,95.7,70z
                                M119.9,101.6c3.7-5.7,6.3-12.2,7.8-19c0,0,10.7,0,10.7,0c1.2,0,2.1-1.4,2.1-2.7v-20c0-1.2-0.7-2.3-1.9-2.3l-10.8,0l0,0
                                c-1.5-6.9-4.2-13.4-7.9-19.1l0,0l7.6-7.7c0.9-0.9,0.7-2.7-0.2-3.6L113.2,13c-0.9-0.9-2.3-1-3.2-0.1l-7.8,7.8l0,0
                                C96.5,17,90,14.4,83.1,12.9l0-10.7c0-1.2-1.4-2.1-2.7-2.1h-20c-1.2,0-2.3,0.7-2.3,1.9l0,10.8c-6.9,1.5-13.4,4.2-19.1,7.9l0,0
                                L31.2,13c-0.9-0.9-2.7-0.7-3.6,0.2L13.5,27.3c-0.9,0.9-1,2.3-0.1,3.2l7.8,7.8l0,0c-3.7,5.8-6.4,12.3-7.9,19.2l0,0
                                c0,0-10.9,0.1-10.9,0.1C1.2,57.6,0,59,0,60.3l0,20c0,1.2,0.9,2.3,2.2,2.3l11.1,0l0,0c1.5,6.9,4.1,13.6,8,19.1l0,0l-7.6,7.7
                                c-0.9,0.9-0.7,2.8,0.2,3.6L28,127.1c0.9,0.9,2.3,1,3.2,0.1l7.9-7.7l0,0c5.9,3.8,12.1,6.3,19,7.8l-0.1,10.8c0,1.2,1.5,2.4,2.7,2.4
                                l20,0c1.2,0,2.3-0.9,2.3-2.2l0-11c6.9-1.5,13.4-4.2,19.1-7.9l0,0l7.7,7.6c0.9,0.9,2.7,0.7,3.6-0.2l14.1-14.2c0.9-0.9,1-2.3,0.1-3.2
                                L119.9,101.6L119.9,101.6z"/>
                            </g>
                        </svg>
                    </a>
                    <div class="slide-out-menu">
                        <div class="menu-header">
                            <div class="user-info">
                                <div class="avatar"></div>
                                <div class="user-details">
                                    <div class="username"><%= request.getParameter("username") %></div>
                                    <div class="status">Online</div>
                                </div>
                            </div>
                        </div>
                        <div class="menu-items">
                            <button onclick="location.href='set-status.jsp'" class="menu-item">
                                <svg class="menu-icon" viewBox="0 0 24 24">
                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"/>
                                </svg>
                                <span>Set Status</span>
                            </button>
                            <button onclick="location.href='profile'" class="menu-item">
                                <svg class="menu-icon" viewBox="0 0 24 24">
                                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                </svg>
                                <span>Your Profile</span>
                            </button>
                            <button onclick="location.href='EditProfile.jsp'" class="menu-item">
                                <svg class="menu-icon" viewBox="0 0 24 24">
                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"/>
                                </svg>
                                <span>Edit Profile</span>
                            </button>
                            <button onclick="location.href='logout.jsp'" class="menu-item">
                                <svg class="menu-icon" viewBox="0 0 24 24">
                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"/>
                                </svg>
                                <span>Log Out</span>
                            </button>
                            <button onclick="confirmDeleteAccount()" class="menu-item delete-account">
                                <svg class="menu-icon" viewBox="0 0 24 24">
                                    <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
                                </svg>
                                <span>Delete Account</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <nav>
        <ul>
            <li><a href="#slide-1">My activities</a></li>
            <li><a href="#slide-2">Announcements</a></li>
            <li><a href="#slide-3">Notifications</a></li>
            <li><a href="#slide-4">Quiz news</a></li>
        </ul>
    </nav>

    <div class="slides-container">
        <div class="slide" id="slide-1">
            <div class="centered">
                <h1>My Activities</h1>
                <div class="button-container">
                    <a href="/CreateQuiz.jsp" class="quiz-button">
                        Create your own quiz
                    </a>
                </div>
            </div>
        </div>
        <div class="slide" id="slide-2">
            <div class="centered">
                <h1>Announcements</h1>
            </div>
        </div>
        <div class="slide" id="slide-3">
            <div class="centered">
                <h1>Notifications</h1>
            </div>
        </div>
        <div class="slide" id="slide-4">
            <div class="centered">
                <h1>Quiz News</h1>
                <p>Explore the latest quizzes and create your own!</p>
            </div>
        </div>
    </div>

    <script src="js/welcome.js"></script>

</body>
</html>
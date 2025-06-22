<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz - QuizMaster</title>
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

        .quiz-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: rgba(30, 30, 30, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 100%;
        }

        .category-header {
            text-align: center;
            margin-bottom: 40px;
            color: #f1f1f1;
        }

        .category-header h1 {
            font-family: "Playfair Display";
            font-size: 36px;
            color: #f1f1f1;
            margin: 0;
        }

        .category-header p {
            color: #cccccc;
            font-size: 18px;
            margin: 10px 0 0;
        }

        .question {
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
            background-color: rgba(30, 30, 30, 0.9);
            color: #f1f1f1;
            opacity: 0.7;
            filter: blur(2px);
            pointer-events: none;
        }

        .question.current {
            background-color: rgba(30, 30, 30, 0.95);
            transform: scale(1.02);
            opacity: 1;
            filter: none;
            pointer-events: all;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .question-number {
            font-size: 18px;
            color: #cccccc;
            margin-bottom: 10px;
        }

        .question-text {
            font-size: 24px;
            font-weight: 600;
            color: #f1f1f1;
            margin-bottom: 20px;
        }

        .options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .option {
            padding: 15px 20px;
            border: 2px solid #444;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #f1f1f1;
        }

        .option:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: #666;
        }

        .option.selected {
            background: #2196F3;
            border-color: #2196F3;
            color: white;
        }

        .next-btn {
            display: none;
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

        .next-btn:hover {
            background: #1976D2;
        }

        .next-btn.show {
            display: block;
        }

        .full-quiz-button {
            margin-top: 30px;
            text-align: center;
        }

        .full-quiz-button a {
            display: inline-block;
            padding: 15px 30px;
            border-radius: 25px;
            background-color: #888;
            color: white;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .full-quiz-button a:hover {
            background-color: #666;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
        }

        .error-message {
            color: #ff4444;
            text-align: center;
            padding: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <jsp:scriptlet>
        String category = request.getParameter("category");
        String categoryName = "";
        String categoryDescription = "";
        
        switch(category) {
            case "art":
                categoryName = "Art Quiz";
                categoryDescription = "Test your knowledge about art and artists";
                break;
            case "sports":
                categoryName = "Sports Quiz";
                categoryDescription = "Test your knowledge about sports and athletes";
                break;
            case "science":
                categoryName = "Science Quiz";
                categoryDescription = "Test your knowledge about science and technology";
                break;
            case "movies":
                categoryName = "Movies Quiz";
                categoryDescription = "Test your knowledge about films and cinema";
                break;
            default:
                categoryName = "Quiz";
                categoryDescription = "Test your knowledge";
        }
    </jsp:scriptlet>

    <div class="quiz-container">
        <div class="category-header">
            <h1><jsp:expression>categoryName</jsp:expression></h1>
            <p><jsp:expression>categoryDescription</jsp:expression></p>
        </div>

        <jsp:scriptlet>
            String[] questions = new String[] {};
            String[][] options = new String[][] {};
            
            switch(category) {
                case "art":
                    questions = new String[] {
                        "Which artist painted the iconic Mona Lisa?",
                        "Which artist is famous for his optical illusion artworks?",
                        "Who created the famous painting 'The Starry Night'?",
                        "Which artist painted 'The Persistence of Memory' (melting clocks)?",
                        "Who created the expressionist masterpiece 'The Scream'?"
                    };
                    options = new String[][] {
                        {"Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Michelangelo"},
                        {"Salvador Dali", "M.C. Escher", "Pablo Picasso", "Jackson Pollock"},
                        {"Vincent van Gogh", "Claude Monet", "Edgar Degas", "Pierre-Auguste Renoir"},
                        {"Salvador Dali", "Pablo Picasso", "Vincent van Gogh", "Claude Monet"},
                        {"Vincent van Gogh", "Edvard Munch", "Pablo Picasso", "Leonardo da Vinci"}
                    };
                    break;
                case "science":
                    questions = new String[] {
                        "What is the chemical symbol for gold?",
                        "Which planet is known as the Red Planet?",
                        "What is the hardest natural substance on Earth?",
                        "What is the largest organ in the human body?",
                        "What is the process by which plants make their food?"
                    };
                    options = new String[][] {
                        {"Gd", "Au", "Ag", "Fe"},
                        {"Venus", "Jupiter", "Mars", "Saturn"},
                        {"Gold", "Iron", "Diamond", "Platinum"},
                        {"Heart", "Brain", "Skin", "Liver"},
                        {"Photosynthesis", "Respiration", "Digestion", "Circulation"}
                    };
                    break;
                case "sports":
                    questions = new String[] {
                        "Which country won the FIFA World Cup 2022?",
                        "In which sport would you perform a slam dunk?",
                        "How many players are there in a standard soccer team on the field?",
                        "Which country invented table tennis?",
                        "What is the distance of a marathon race in kilometers?"
                    };
                    options = new String[][] {
                        {"Brazil", "France", "Argentina", "Germany"},
                        {"Football", "Basketball", "Volleyball", "Tennis"},
                        {"9", "10", "11", "12"},
                        {"China", "Japan", "England", "USA"},
                        {"21.1", "32.2", "42.2", "50.0"}
                    };
                    break;
                case "movies":
                    questions = new String[] {
                        "Who directed the movie 'Inception'?",
                        "Which actor played Iron Man in the Marvel Cinematic Universe?",
                        "What movie won the Academy Award for Best Picture in 2024?",
                        "Which film franchise features a character named Luke Skywalker?",
                        "Who played the role of Jack in the movie 'Titanic'?"
                    };
                    options = new String[][] {
                        {"Steven Spielberg", "Christopher Nolan", "Martin Scorsese", "James Cameron"},
                        {"Chris Evans", "Chris Hemsworth", "Robert Downey Jr.", "Mark Ruffalo"},
                        {"Barbie", "Oppenheimer", "Poor Things", "The Holdovers"},
                        {"Star Trek", "Star Wars", "Battlestar Galactica", "The Expanse"},
                        {"Brad Pitt", "Leonardo DiCaprio", "Matt Damon", "Tom Cruise"}
                    };
                    break;
                default:
                    questions = new String[] {};
                    options = new String[][] {};
            }
        </jsp:scriptlet>

        <% if (questions != null && questions.length > 0) { %>
            <% for(int i = 0; i < questions.length; i++) { %>
                <div class="question <%= i == 0 ? "current" : "" %>">
                    <div class="question-number">Question <%= i + 1 %></div>
                    <div class="question-text"><%= questions[i] %></div>
                    <div class="options">
                        <div class="option" onclick="selectOption(this, <%= i %>)"><%= options[i][0] %></div>
                        <div class="option" onclick="selectOption(this, <%= i %>)"><%= options[i][1] %></div>
                        <div class="option" onclick="selectOption(this, <%= i %>)"><%= options[i][2] %></div>
                        <div class="option" onclick="selectOption(this, <%= i %>)"><%= options[i][3] %></div>
                    </div>
                    <button class="next-btn" onclick="nextQuestion()">Next Question</button>
                </div>
            <% } %>
        <% } else { %>
            <div class="error-message">
                <p>No questions available for this category</p>
            </div>
        <% } %>

        <div class="full-quiz-button">
            <a href="login.jsp">Log In to Access Full Quiz</a>
        </div>
    </div>

    <script>
        let currentQuestion = 0;
        let selectedOptions = Array(<%= questions.length %>).fill(null);
        const questions = document.querySelectorAll('.question');

        function selectOption(optionElement, questionIndex) {
            if (!questions[questionIndex].classList.contains('current')) return;
            
            const currentQuestionElement = questions[questionIndex];
            const options = currentQuestionElement.querySelectorAll('.option');
            options.forEach(option => option.classList.remove('selected'));
            optionElement.classList.add('selected');
            
            selectedOptions[questionIndex] = Array.from(options).indexOf(optionElement);
            
            const nextBtn = currentQuestionElement.querySelector('.next-btn');
            nextBtn.classList.add('show');
        }

        function nextQuestion() {
            const currentQuestionElement = questions[currentQuestion];
            currentQuestionElement.classList.remove('current');

            currentQuestion++;
            if (currentQuestion < questions.length) {
                const nextQuestionElement = questions[currentQuestion];
                nextQuestionElement.classList.add('current');
                
                const nextBtn = nextQuestionElement.querySelector('.next-btn');
                nextBtn.classList.remove('show');

                if (selectedOptions[currentQuestion] !== null) {
                    const options = nextQuestionElement.querySelectorAll('.option');
                    options[selectedOptions[currentQuestion]].classList.add('selected');
                    nextBtn.classList.add('show');
                }
            } else {
                alert('Quiz completed!');
                window.location.href = 'login.jsp';
            }
        }

        window.addEventListener('DOMContentLoaded', () => {
            if (questions.length > 0) {
                questions[0].classList.add('current');
                if (selectedOptions[0] !== null) {
                    const options = questions[0].querySelectorAll('.option');
                    options[selectedOptions[0]].classList.add('selected');
                    questions[0].querySelector('.next-btn').classList.add('show');
                }
            }
        });
    </script>
</body>
</html>
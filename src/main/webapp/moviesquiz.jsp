<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Movies Quiz - QuizMaster</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,700|Playfair+Display:700" rel="stylesheet">
    <style>
        :root {
            --blur-color: rgba(0, 0, 0, 0.8);
        }

        body {
            font-family: "Raleway";
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .quiz-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .question {
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
            display: none;
        }

        .question.current {
            background: white;
            transform: scale(1.02);
            z-index: 1;
            display: block;
        }

        .full-quiz-button {
            margin-top: 30px;
            text-align: center;
            position: relative;
            z-index: 10;
        }

        .full-quiz-button a {
            display: inline-block;
            padding: 15px 30px;
            border-radius: 25px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .full-quiz-button a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .question:not(.current) {
            filter: blur(2px);
            opacity: 0.7;
            pointer-events: none;
            background: var(--blur-color);
        }

        .question-number {
            font-size: 18px;
            color: #666;
            margin-bottom: 10px;
        }

        .question-text {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .option {
            padding: 15px 20px;
            border: 2px solid #ddd;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .option:hover {
            background: #f8f9fa;
            border-color: #ccc;
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
        }

        .next-btn.show {
            display: block;
        }

        .category-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .category-header h1 {
            font-family: "Playfair Display";
            font-size: 36px;
            color: #333;
            margin: 0;
        }

        .category-header p {
            color: #666;
            font-size: 18px;
            margin: 10px 0 0;
        }
    </style>
</head>
<body>
    <jsp:scriptlet>
        String[] questions = new String[] {
            "Which movie won the Academy Award for Best Picture in 2020?",
            "Who directed the movie 'The Godfather'?",
            "Which actor played Tony Stark in the Marvel Cinematic Universe?",
            "What is the highest-grossing movie of all time worldwide?",
            "Which movie features the famous line 'May the Force be with you'?",
            "Which movie features the famous line 'I'll be back'?",
            "Who directed the original Star Wars trilogy?",
            "Which movie won the most Academy Awards in history?",
            "Which actor played the Joker in 'The Dark Knight'?",
            "Which movie is the highest-grossing animated film of all time?"
        };
        String[][] options = new String[][] {
            {"Parasite", "Joker", "1917", "Once Upon a Time in Hollywood"},
            {"Francis Ford Coppola", "Martin Scorsese", "Steven Spielberg", "Quentin Tarantino"},
            {"Robert Downey Jr.", "Chris Evans", "Chris Hemsworth", "Tom Holland"},
            {"Avatar", "Titanic", "Star Wars: The Force Awakens", "Avengers: Endgame"},
            {"The Godfather", "The Dark Knight", "Star Wars", "The Matrix"},
            {"The Terminator", "The Matrix", "RoboCop", "Total Recall"},
            {"George Lucas", "Steven Spielberg", "James Cameron", "Quentin Tarantino"},
            {"Ben-Hur", "Titanic", "The Lord of the Rings: Return of the King", "The Shape of Water"},
            {"Heath Ledger", "Joaquin Phoenix", "Jared Leto", "Mark Hamill"},
            {"Frozen II", "The Lion King", "Toy Story 4", "Avengers: Endgame"}
        };
    </jsp:scriptlet>

    <div class="category-header">
        <h1>Movies Quiz</h1>
        <p>Test your knowledge about films and cinema</p>
    </div>

    <div class="quiz-container">
        <% for(int i = 0; i < questions.length; i++) { %>
            <div class="question <%= i == 0 ? "current" : "" %>">
                <div class="question-number">Question <%= i + 1 %></div>
                <div class="question-text"><%= questions[i] %></div>
                <div class="options">
                    <div class="option" onclick="selectOption(0)"><%= options[i][0] %></div>
                    <div class="option" onclick="selectOption(1)"><%= options[i][1] %></div>
                    <div class="option" onclick="selectOption(2)"><%= options[i][2] %></div>
                    <div class="option" onclick="selectOption(3)"><%= options[i][3] %></div>
                </div>
                <button class="next-btn" onclick="nextQuestion()">Next Question</button>
                <% if (i == 0) { %>
                    <div class="full-quiz-button">
                        <a href="quiz.jsp?category=all" class="nav-button">See Full Quiz</a>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>

    <script>
        let currentQuestion = 0;
        let selectedOptions = Array(questions.length).fill(null);
        const questions = document.querySelectorAll('.question');

        function selectOption(index) {
            if (!questions[currentQuestion].classList.contains('current')) return;
            
            const currentQuestionElement = questions[currentQuestion];
            const options = currentQuestionElement.querySelectorAll('.option');
            options.forEach(option => option.classList.remove('selected'));
            options[index].classList.add('selected');
            
            // Store the selected option
            selectedOptions[currentQuestion] = index;
            
            // Show next button
            const nextBtn = currentQuestionElement.querySelector('.next-btn');
            nextBtn.classList.add('show');
        }

        function nextQuestion() {
            // Get current question
            const currentQuestionElement = questions[currentQuestion];
            currentQuestionElement.classList.remove('current');

            // Get next question
            currentQuestion++;
            if (currentQuestion < questions.length) {
                const nextQuestionElement = questions[currentQuestion];
                nextQuestionElement.classList.add('current');
                
                // Add See Full Quiz button after second question
                const fullQuizButton = document.createElement('div');
                fullQuizButton.className = 'full-quiz-button';
                fullQuizButton.innerHTML = '<a href="quiz.jsp?category=all" class="nav-button">See Full Quiz</a>';
                nextQuestionElement.appendChild(fullQuizButton);
                
                // Reset next button
                const nextBtn = nextQuestionElement.querySelector('.next-btn');
                nextBtn.classList.remove('show');
            } else {
                // Quiz completed
                alert('Quiz completed!');
            }
        }
    </script>
</body>
</html>

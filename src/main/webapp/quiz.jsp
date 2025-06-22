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
            background-color: white;
        }

        .question.current {
            background: white;
            transform: scale(1.02);
            z-index: 1;
        }

        .question:not(:nth-child(-n+2)) {
            filter: blur(2px);
            opacity: 0.7;
            pointer-events: none;
            background: var(--blur-color);
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
        String category = request.getParameter("category");
        String categoryName = "";
        String categoryDescription = "";
        
        // Set category name and description
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
            case "sports":
                questions = new String[] {
                    "Who holds the record for most Grand Slam titles in men's tennis?",
                    "Which country has won the most FIFA World Cups?",
                    "Who is the all-time leading scorer in NBA history?",
                    "Which Formula 1 driver has won the most World Championships?",
                    "Who won the most Olympic gold medals in history?"
                };
                options = new String[][] {
                    {"Roger Federer", "Rafael Nadal", "Novak Djokovic", "Pete Sampras"},
                    {"Brazil", "Germany", "Italy", "Argentina"},
                    {"LeBron James", "Kareem Abdul-Jabbar", "Karl Malone", "Michael Jordan"},
                    {"Lewis Hamilton", "Michael Schumacher", "Ayrton Senna", "Sebastian Vettel"},
                    {"Michael Phelps", "Larisa Latynina", "Natalie Coughlin", "Allan Wells"}
                };
                break;
            case "science":
                questions = new String[] {
                    "What is the chemical symbol for gold?",
                    "Which planet is known as the Red Planet?",
                    "What is the speed of light in a vacuum?",
                    "What is the largest organ in the human body?",
                    "What gas makes up most of Earth's atmosphere?"
                };
                options = new String[][] {
                    {"Au", "Ag", "Cu", "Fe"},
                    {"Mars", "Venus", "Jupiter", "Saturn"},
                    {"299,792 km/s", "300,000 km/s", "299,792,458 m/s", "300,000,000 m/s"},
                    {"Liver", "Skin", "Heart", "Lungs"},
                    {"Oxygen", "Nitrogen", "Carbon Dioxide", "Helium"}
                };
                break;
            case "movies":
                questions = new String[] {
                    "Who directed the movie 'The Godfather'?",
                    "Which movie won the Academy Award for Best Picture in 2020?",
                    "Which actor played Tony Stark in the Marvel Cinematic Universe?",
                    "What is the highest-grossing movie of all time worldwide?",
                    "Which movie features the famous line 'May the Force be with you'?"
                };
                options = new String[][] {
                    {"Francis Ford Coppola", "Martin Scorsese", "Steven Spielberg", "Quentin Tarantino"},
                    {"Parasite", "Joker", "1917", "Once Upon a Time in Hollywood"},
                    {"Robert Downey Jr.", "Chris Evans", "Chris Hemsworth", "Tom Holland"},
                    {"Avatar", "Titanic", "Star Wars: The Force Awakens", "Avengers: Endgame"},
                    {"The Godfather", "The Dark Knight", "Star Wars", "The Matrix"}
                };
                break;
            default:
                questions = new String[] {
                    "What is the capital of France?",
                    "Who painted the Mona Lisa?",
                    "What is the largest planet in our solar system?",
                    "Who wrote 'Romeo and Juliet'?",
                    "What is the chemical symbol for water?"
                };
                options = new String[][] {
                    {"Paris", "London", "Berlin", "Madrid"},
                    {"Leonardo da Vinci", "Vincent van Gogh", "Pablo Picasso", "Michelangelo"},
                    {"Jupiter", "Saturn", "Mars", "Earth"},
                    {"William Shakespeare", "Charles Dickens", "Jane Austen", "Mark Twain"},
                    {"H2O", "CO2", "O2", "NaCl"}
                };
        }
    </jsp:scriptlet>

    <div class="quiz-container">
        <% if (questions != null && options != null) {
            for(int i = 0; i < questions.length; i++) { %>
            <div class="question">
                <div class="question-number">Question <%= i + 1 %></div>
                <div class="question-text"><%= questions[i] %></div>
                <div class="options">
                    <div class="option" onclick="selectOption(0)"><%= options[i][0] %></div>
                    <div class="option" onclick="selectOption(1)"><%= options[i][1] %></div>
                    <div class="option" onclick="selectOption(2)"><%= options[i][2] %></div>
                    <div class="option" onclick="selectOption(3)"><%= options[i][3] %></div>
                </div>
                <button class="next-btn" onclick="nextQuestion()">Next Question</button>
            </div>
        <% } %>
        <% } else { %>
            <div class="error-message">
                <p>No questions available for this category</p>
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
                
                // Add See Full Quiz button
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Art Quiz - QuizMaster</title>
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
            opacity: 0.5;
            filter: blur(3px);
            pointer-events: none;
        }

        .question.current {
            background: white;
            transform: scale(1.02);
            z-index: 1;
            opacity: 1;
            filter: none;
            pointer-events: auto;
        }

        .full-quiz-button {
            margin-top: 30px;
            text-align: center;
            position: relative;
            z-index: 10;
            opacity: 1; /* Make button always visible */
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
            "Which artist painted the iconic Mona Lisa?",
            "Which artist is famous for his optical illusion artworks?",
            "Who created the famous painting 'The Starry Night'?",
            "Which artist painted 'The Persistence of Memory' (melting clocks)?",
            "Who created the expressionist masterpiece 'The Scream'?",
            "Which artist painted the famous 'Girl with a Pearl Earring'?",
            "Who is known for his Cubist paintings?",
            "Which artist created 'The Birth of Venus'?",
            "Who painted 'The Night Watch'?",
            "Which artist is known for his surrealist paintings of melting clocks?"
        };
        String[][] options = new String[][] {
            {"Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Michelangelo"},
            {"Salvador Dali", "M.C. Escher", "Pablo Picasso", "Jackson Pollock"},
            {"Vincent van Gogh", "Claude Monet", "Edgar Degas", "Pierre-Auguste Renoir"},
            {"Salvador Dali", "Pablo Picasso", "Vincent van Gogh", "Claude Monet"},
            {"Vincent van Gogh", "Edvard Munch", "Pablo Picasso", "Leonardo da Vinci"},
            {"Johannes Vermeer", "Rembrandt", "Vincent van Gogh", "Pablo Picasso"},
            {"Pablo Picasso", "Salvador Dali", "Vincent van Gogh", "Claude Monet"},
            {"Sandro Botticelli", "Leonardo da Vinci", "Michelangelo", "Raphael"},
            {"Rembrandt", "Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso"},
            {"Salvador Dali", "Pablo Picasso", "Vincent van Gogh", "Claude Monet"}
        };
    </jsp:scriptlet>

    <div class="category-header">
        <h1>Art Quiz</h1>
        <p>Test your knowledge about art and artists</p>
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
                <div class="full-quiz-button">
                    <a href="quiz.jsp?category=all" class="nav-button">Explore Complete Quiz</a>
                </div>
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
                
                // Reset next button
                const nextBtn = nextQuestionElement.querySelector('.next-btn');
                nextBtn.classList.remove('show');
            } else {
                // Quiz completed
                alert('Quiz completed!');
            }
        }

        // Initialize the first question
        document.addEventListener('DOMContentLoaded', () => {
            const firstQuestion = questions[0];
            if (firstQuestion) {
                firstQuestion.classList.add('current');
            }
        });
    </script>
</body>
</html>
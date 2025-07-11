<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background-color: #121212;
            background-image: url('https://wallpaper.dog/large/20419572.jpg');
            background-size: cover;
            background-position: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            background-color: rgba(30, 30, 30, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 600px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            margin: 20px 0;
        }

        .quiz-form h1 {
            text-align: center;
            color: #8b5cf6;
            font-size: 24px;
            margin-bottom: 20px;
            text-shadow: 0 0 10px rgba(139, 92, 246, 0.3);
        }

        .quiz-form h2 {
            color: #8b5cf6;
            font-size: 20px;
            margin: 30px 0 20px 0;
            text-shadow: 0 0 10px rgba(139, 92, 246, 0.3);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #cccccc;
            font-size: 14px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #666;
            border-radius: 4px;
            font-size: 14px;
            background-color: #222;
            color: #f1f1f1;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #8b5cf6;
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        select {
            cursor: pointer;
        }

        select option {
            background-color: #222;
            color: #f1f1f1;
        }

        .question-section {
            margin: 30px 0;
        }

        .question-item {
            background-color: rgba(40, 40, 40, 0.8);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
        }

        .question-item h3 {
            color: #8b5cf6;
            margin-top: 0;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .add-question-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #444, #666);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }

        .add-question-btn:hover {
            background: linear-gradient(135deg, #555, #777);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(100, 100, 100, 0.3);
        }

        .submit-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #8b5cf6, #7c3aed);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, #a855f7, #8b5cf6);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 92, 246, 0.4);
        }

        .remove-question-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #c73333;
            color: white;
            border: none;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease;
        }

        .remove-question-btn:hover {
            background: #f14444;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            .quiz-form h1 {
                font-size: 20px;
            }

            .quiz-form h2 {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="quiz-form">
        <h1>Create Your Quiz</h1>
        <form id="quizForm" method="post" action="/CreateQuizServlet">
            <input type="hidden" name="quizAction" value="save">

            <div class="form-group">
                <label for="quizTitle">Quiz Title</label>
                <input type="text" id="quizTitle" name="quizName" required>
            </div>

            <div class="form-group">
                <label for="quizDescription">Description</label>
                <textarea id="quizDescription" name="quizDescription" rows="3"></textarea>
            </div>

            <div class="form-group">
                <label>Category</label>
                <select id="quizCategory" name="quizCategory" required>
                    <option value="">Select Category</option>
                    <option value="science">Science</option>
                    <option value="history">History</option>
                    <option value="math">Mathematics</option>
                    <option value="literature">Literature</option>
                    <option value="geography">Geography</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <div class="question-section">
                <h2>Questions</h2>
                <div id="questionsContainer">
                    <div class="question-item" id="question1">
                        <h3>Question 1</h3>
                        <div class="form-group">
                            <label>Question</label>
                            <input type="text" name="question1" required>
                        </div>
                        <div class="form-group">
                            <label>Correct Answer</label>
                            <input type="text" name="answer1" required>
                        </div>
                        <div class="form-group">
                            <label>Wrong Answer 1</label>
                            <input type="text" name="wrong1_1" required>
                        </div>
                        <div class="form-group">
                            <label>Wrong Answer 2</label>
                            <input type="text" name="wrong1_2" required>
                        </div>
                        <div class="form-group">
                            <label>Wrong Answer 3</label>
                            <input type="text" name="wrong1_3" required>
                        </div>
                    </div>
                </div>
                <button type="button" id="addQuestion" class="add-question-btn">Add Question</button>
            </div>

            <div class="form-group">
                <label for="timeLimit">Time Limit (minutes)</label>
                <input type="number" id="timeLimit" name="timeLimit" min="1" required>
            </div>

            <button type="submit" class="submit-btn">Create Quiz</button>
        </form>
    </div>
</div>

<script>
    let questionCount = 1;

    document.getElementById('addQuestion').addEventListener('click', function() {
        questionCount++;
        const questionsContainer = document.getElementById('questionsContainer');

        const questionDiv = document.createElement('div');
        questionDiv.className = 'question-item';
        questionDiv.id = 'question' + questionCount;

        questionDiv.innerHTML = `
                <button type="button" class="remove-question-btn" onclick="removeQuestion(${questionCount})">×</button>
                <h3>Question ${questionCount}</h3>
                <div class="form-group">
                    <label>Question</label>
                    <input type="text" name="question${questionCount}" required>
                </div>
                <div class="form-group">
                    <label>Correct Answer</label>
                    <input type="text" name="answer${questionCount}" required>
                </div>
                <div class="form-group">
                    <label>Wrong Answer 1</label>
                    <input type="text" name="wrong${questionCount}_1" required>
                </div>
                <div class="form-group">
                    <label>Wrong Answer 2</label>
                    <input type="text" name="wrong${questionCount}_2" required>
                </div>
                <div class="form-group">
                    <label>Wrong Answer 3</label>
                    <input type="text" name="wrong${questionCount}_3" required>
                </div>
            `;

        questionsContainer.appendChild(questionDiv);
    });

    function removeQuestion(questionNum) {
        const questionDiv = document.getElementById('question' + questionNum);
        if (questionDiv && questionCount > 1) {
            questionDiv.remove();
            // Renumber remaining questions
            renumberQuestions();
        }
    }

    function renumberQuestions() {
        const questions = document.querySelectorAll('.question-item');
        questionCount = 0;

        questions.forEach((question, index) => {
            questionCount++;
            const newNum = index + 1;
            question.id = 'question' + newNum;
            question.querySelector('h3').textContent = 'Question ' + newNum;

            // Update input names
            const inputs = question.querySelectorAll('input[type="text"]');
            inputs[0].name = 'question' + newNum;
            inputs[1].name = 'answer' + newNum;
            inputs[2].name = 'wrong' + newNum + '_1';
            inputs[3].name = 'wrong' + newNum + '_2';
            inputs[4].name = 'wrong' + newNum + '_3';

            // Update remove button
            const removeBtn = question.querySelector('.remove-question-btn');
            if (removeBtn) {
                removeBtn.setAttribute('onclick', 'removeQuestion(' + newNum + ')');
            }
        });
    }

    // Form submission handling
    document.getElementById('quizForm').addEventListener('submit', function(e) {
        // Add any additional validation if needed
        console.log('Form submitted');
    });
</script>
</body>
</html>
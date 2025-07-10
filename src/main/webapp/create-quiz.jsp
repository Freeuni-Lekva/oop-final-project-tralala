<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz</title>
    <link rel="stylesheet" href="css/create-quiz.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/create-quiz.js?v=2" defer></script>
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
                            <div class="form-group">
                                <label>Question 1</label>
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
</body>
</html>

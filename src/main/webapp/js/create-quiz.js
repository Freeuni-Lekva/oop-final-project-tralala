document.addEventListener('DOMContentLoaded', function() {
    const questionTemplate = document.querySelector('.question-item');
    const questionsContainer = document.getElementById('questionsContainer');
    const addQuestionBtn = document.getElementById('addQuestion');
    let questionCount = 1;

    // Function to create new question
    function createNewQuestion() {
        questionCount++;
        const newQuestion = questionTemplate.cloneNode(true);
        newQuestion.id = `question${questionCount}`;
        
        // Update input names for new question
        newQuestion.querySelectorAll('input').forEach(input => {
            const name = input.name;
            const newName = name.replace(/\d+/, questionCount);
            input.name = newName;
            input.value = '';
        });

        return newQuestion;
    }

    // Add question button click handler
    addQuestionBtn.addEventListener('click', function() {
        const newQuestion = createNewQuestion();
        questionsContainer.appendChild(newQuestion);
    });

    // Form submission handler
    document.getElementById('quizForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Collect form data
        const formData = new FormData(this);
        const quizData = {};

        // Convert FormData to object
        for (let [key, value] of formData.entries()) {
            quizData[key] = value;
        }

        // Send quiz data to server
        fetch('/create-quiz', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(quizData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Quiz created successfully!');
                window.location.href = '/quiz/' + data.quizId;
            } else {
                alert('Error creating quiz: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while creating the quiz');
        });
    });
});

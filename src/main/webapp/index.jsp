<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Quiz Home</title>
    <link rel="icon" href="assets/logo3.png" type="image/png" />
    <style>
        body {
            background-color: #737ba2;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        h1 {
            color: #fff;
            font-size: 3em;
            text-align: center;
            animation: sparkle 2.5s infinite alternate ease-in-out;
            margin-bottom: 30px;
        }

        @keyframes sparkle {
            0%, 100% {
                text-shadow: 0 0 2px #fff, 0 0 4px #fff;
            }
            50% {
                text-shadow: 0 0 6px #e0aaff, 0 0 10px #fcb1f5;
            }
        }

        .todo-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 350px;
        }

        .todo-item {
            display: flex;
            align-items: center;
            opacity: 0.3;
            transition: opacity 0.5s ease;
            font-size: 1.5em;
            color: #fff;
        }

        .todo-item.active {
            opacity: 1;
            color: #fff176;
        }

        .todo-item img {
            width: 60px; /* bigger check */
            height: auto;
            margin-left: 15px;
            display: none;
        }

        .todo-item.checked img {
            display: inline;
        }

        .brainman {
            position: fixed;
            bottom: 10px;
            left: -10px;
            width: 350px;
            height: auto;
            z-index: 1000;
        }

        .books {
            position: fixed;
            bottom: 10px;
            right: 0px;
            width: 250px;
            height: auto;
            z-index: 1000;
        }
    </style>
</head>
<body>
<h1>Welcome to the Quiz App!</h1>

<div class="todo-list">
    <div class="todo-item" id="task1">
        Take a quiz <img src="assets/check.png" alt="Check" />
    </div>
    <div class="todo-item" id="task2">
        Learn something new <img src="assets/check.png" alt="Check" />
    </div>
    <div class="todo-item" id="task3">
        Check your score <img src="assets/check.png" alt="Check" />
    </div>
    <div class="todo-item" id="task4">
        Repeat <img src="assets/check.png" alt="Check" />
    </div>
</div>

<img src="assets/logo2.png" alt="Brainman" class="brainman" />
<img src="assets/books.png" alt="Books" class="books" />

<script>
    const items = [
        document.getElementById("task1"),
        document.getElementById("task2"),
        document.getElementById("task3"),
        document.getElementById("task4")
    ];

    function runLoop() {
        items.forEach((item) => {
            item.classList.remove("active", "checked");
        });

        items.forEach((el, idx) => {
            const delay = idx * 2000;
            setTimeout(() => {
                el.classList.add("active");
            }, delay);
            setTimeout(() => {
                el.classList.add("checked");
            }, delay + 1000);
        });

        setTimeout(runLoop, items.length * 2000 + 2000);
    }

    runLoop();
</script>
</body>
</html>

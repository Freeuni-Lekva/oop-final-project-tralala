<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Account</title>
<<<<<<< HEAD
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,700|Playfair+Display:700" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            margin: 0;
            font-family: "Raleway";
            font-size: 14px;
            font-weight: 500;
            background-color: #BCAAA4;
            -webkit-font-smoothing: antialiased;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #fff;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #333;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #fff;
            color: #333;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-group button:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
        }

        .container {
            padding: 40px 80px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card-wrap {
            margin: 10px;
            transform: perspective(800px);
            transform-style: preserve-3d;
            cursor: pointer;
        }

        .card {
            position: relative;
            flex: 0 0 240px;
            width: 240px;
            height: 320px;
            background-color: #333;
            overflow: hidden;
            border-radius: 10px;
        }

        .card-bg {
            opacity: 0.5;
            position: absolute;
            top: -20px; left: -20px;
            width: 100%;
            height: 100%;
            padding: 20px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            pointer-events: none;
        }

        .card-info {
            padding: 20px;
            position: absolute;
            bottom: 0;
            color: #fff;
            transform: translateY(40%);
        }

        .card-info h1 {
            font-family: "Playfair Display";
            font-size: 36px;
            font-weight: 700;
            text-shadow: rgba(black, 0.5) 0 10px 10px;
        }

        .card-info p {
            opacity: 0;
            text-shadow: rgba(black, 1) 0 2px 3px;
        }

        .card-info:after {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-image: linear-gradient(to bottom, transparent 0%, rgba(#000, 0.6) 100%);
            background-blend-mode: overlay;
            opacity: 0;
            transform: translateY(100%);
        }

        .card-wrap:hover {
            .card-info {
                transform: translateY(0);
            }
            .card-info p {
                opacity: 1;
            }
            .card-info, .card-info p {
                transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            }
            .card-info:after {
                transition: 5s cubic-bezier(0.23, 1, 0.32, 1);
                opacity: 1;
                transform: translateY(0);
            }
            .card-bg {
                transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1), opacity 5s cubic-bezier(0.23, 1, 0.32, 1);
                opacity: 0.8;
            }
            .card {
                transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1), box-shadow 2s cubic-bezier(0.23, 1, 0.32, 1);
                box-shadow:
                    rgba(white, 0.2) 0 0 40px 5px,
                    rgba(white, 1) 0 0 0 1px,
                    rgba(black, 0.66) 0 30px 60px 0,
                    inset #333 0 0 0 5px,
                    inset white 0 0 0 6px;
            }
=======
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }

        form {
            display: inline-block;
            text-align: left;
            margin-top: 20px;
        }

        input[type="text"] {
            display: block;
            width: 200px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 4px;
>>>>>>> 993fc4a66590bfd6c8aa8f36b916b7d9e781065b
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <div id="app" class="container">
        <card data-image="https://images.unsplash.com/photo-1479660656269-197ebb83b540?dpr=2&auto=compress,format&fit=crop&w=1199&h=798&q=80&cs=tinysrgb&crop=">
            <h1 slot="header">Create Account</h1>
            <div slot="content">
                <form action="AccountCreation" method="post" class="form">
                    <div class="form-group">
                        <label>First Name:</label>
                        <input type="text" name="firstName" required />
                    </div>
                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="text" name="lastName" required />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" required />
                    </div>
                    <div class="form-group">
                        <label>Username:</label>
                        <input type="text" name="username" required />
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" required />
                    </div>
                    <div class="form-group">
                        <button type="submit">Create Account</button>
                    </div>
                </form>
            </div>
        </card>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script>
        Vue.component('card', {
            template: `
                <div class="card-wrap"
                    @mousemove="handleMouseMove"
                    @mouseenter="handleMouseEnter"
                    @mouseleave="handleMouseLeave"
                    ref="card">
                    <div class="card"
                        :style="cardStyle">
                        <div class="card-bg" :style="[cardBgTransform, cardBgImage]"></div>
                        <div class="card-info">
                            <slot name="header"></slot>
                            <slot name="content"></slot>
                        </div>
                    </div>
                </div>`,
            mounted() {
                this.width = this.$refs.card.offsetWidth;
                this.height = this.$refs.card.offsetHeight;
            },
            props: ['dataImage'],
            data: () => ({
                width: 0,
                height: 0,
                mouseX: 0,
                mouseY: 0,
                mouseLeaveDelay: null
            }),
            computed: {
                mousePX() {
                    return this.mouseX / this.width;
                },
                mousePY() {
                    return this.mouseY / this.height;
                },
                cardStyle() {
                    const rX = this.mousePX * 30;
                    const rY = this.mousePY * -30;
                    return {
                        transform: `rotateY(${rX}deg) rotateX(${rY}deg)`
                    };
                },
                cardBgTransform() {
                    const tX = this.mousePX * -40;
                    const tY = this.mousePY * -40;
                    return {
                        transform: `translateX(${tX}px) translateY(${tY}px)`
                    }
                },
                cardBgImage() {
                    return {
                        backgroundImage: `url(${this.dataImage})`
                    }
                }
            },
            methods: {
                handleMouseMove(e) {
                    this.mouseX = e.pageX - this.$refs.card.offsetLeft - this.width/2;
                    this.mouseY = e.pageY - this.$refs.card.offsetTop - this.height/2;
                },
                handleMouseEnter() {
                    clearTimeout(this.mouseLeaveDelay);
                },
                handleMouseLeave() {
                    this.mouseLeaveDelay = setTimeout(()=>{
                        this.mouseX = 0;
                        this.mouseY = 0;
                    }, 1000);
                }
            }
        });

        new Vue({
            el: '#app'
        });
    </script>
</body>
</html>
    </style>
</head>
<body>
    <div id="particles-background" class="vertical-centered-box"></div>
    <div id="particles-foreground" class="vertical-centered-box"></div>

    <div class="vertical-centered-box">
        <div class="content">
            <h1>Create New Account</h1>
            <p>Please fill out the form below:</p>
            
            <form action="AccountCreation" method="post">
                <label>First Name:</label>
                <input type="text" name="firstName" required />

                <label>Last Name:</label>
                <input type="text" name="lastName" required />

                <label>Email:</label>
                <input type="email" name="email" required />

                <label>Username:</label>
                <input type="text" name="username" required />

                <label>Password:</label>
                <input type="password" name="password" required />

                <input type="submit" value="Create" />
            </form>
        </div>
    </div>

    <script src="js/particleground.js"></script>
    <script>
        particleground(document.getElementById('particles-foreground'), {
            dotColor: 'rgba(255, 255, 255, 1)',
            lineColor: 'rgba(255, 255, 255, 0.05)',
            minSpeedX: 0.3,
            maxSpeedX: 0.6,
            minSpeedY: 0.3,
            maxSpeedY: 0.6,
            density: 50000,
            curvedLines: false,
            proximity: 250,
            parallaxMultiplier: 10,
            particleRadius: 4
        });

        particleground(document.getElementById('particles-background'), {
            dotColor: 'rgba(255, 255, 255, 0.5)',
            lineColor: 'rgba(255, 255, 255, 0.05)',
            minSpeedX: 0.075,
            maxSpeedX: 0.15,
            minSpeedY: 0.075,
            maxSpeedY: 0.15,
            density: 30000,
            curvedLines: false,
            proximity: 20,
            parallaxMultiplier: 20,
            particleRadius: 2
        });
    </script>
=======
<h1>Create New Account</h1>

<p>Please enter your desired username and password.</p>

<form action="AccountCreation" method="post">
    <label>User Name:</label>
    <input type="text" name="username" />

    <label>Password:</label>
    <input type="text" name="password" />

    <input type="submit" value="Create" />
</form>
>>>>>>> 993fc4a66590bfd6c8aa8f36b916b7d9e781065b
</body>
</html>

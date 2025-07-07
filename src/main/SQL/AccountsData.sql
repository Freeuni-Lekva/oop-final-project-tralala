CREATE TABLE IF NOT EXISTS Accounts (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL UNIQUE,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    imageUrl VARCHAR(255),
    salt VARCHAR(16),
    achievementIds TEXT,
    isAdmin BOOLEAN
    );

CREATE TABLE IF NOT EXISTS Friends (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usernameFrom VARCHAR(50) NOT NULL,
    usernameTo VARCHAR(50) NOT NULL,
    isAccepted BOOLEAN DEFAULT FALSE,
    requestTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usernameFrom) REFERENCES Accounts(userName),
    FOREIGN KEY (usernameTo) REFERENCES Accounts(userName)
);
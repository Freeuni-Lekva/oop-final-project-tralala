CREATE TABLE IF NOT EXISTS Friends (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usernameFrom VARCHAR(50) NOT NULL,
    usernameTo VARCHAR(50) NOT NULL,
    isAccepted BOOLEAN DEFAULT FALSE,
    requestTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usernameFrom) REFERENCES Accounts(userName),
    FOREIGN KEY (usernameTo) REFERENCES Accounts(userName)
);
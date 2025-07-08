-- Create the OOP_QUIZ database
CREATE DATABASE IF NOT EXISTS OOP_QUIZ;

-- Use the OOP_QUIZ database
USE OOP_QUIZ;

-- Create the AccountsData table
CREATE TABLE IF NOT EXISTS AccountsData (
                                            userId INT AUTO_INCREMENT PRIMARY KEY,
                                            userName VARCHAR(50) NOT NULL UNIQUE,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    imageUrl VARCHAR(255),
    salt VARCHAR(16),
    achievementIds TEXT not null,
    isAdmin BOOLEAN
    );

CREATE TABLE IF NOT EXISTS FriendsData (
                                           friendRequestId INT NOT NULL AUTO_INCREMENT,
                                           usernameFrom VARCHAR(255) NOT NULL,
    usernameTo VARCHAR(255) NOT NULL,
    isAccepted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (friendRequestId),
    FOREIGN KEY (usernameFrom) REFERENCES AccountsData(userName) ON DELETE CASCADE,
    FOREIGN KEY (usernameTo) REFERENCES AccountsData(userName) ON DELETE CASCADE,
    UNIQUE (usernameFrom, usernameTo)
    );

CREATE TABLE AnnouncementsData (
                                   announcementId INT AUTO_INCREMENT PRIMARY KEY,
                                   username VARCHAR(255) NOT NULL,
                                   message TEXT NOT NULL,
                                   announcementTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   FOREIGN KEY (userName) REFERENCES AccountsData(username) ON DELETE CASCADE
);


CREATE TABLE QuizData (
                          quizID INT NOT NULL AUTO_INCREMENT,
                          userName VARCHAR(255) NOT NULL,
                          quizName VARCHAR(255) NOT NULL,
                          quizDescription TEXT,
                          quizScore INT DEFAULT 0,
                          questionIds TEXT,
                          isSinglePage BOOLEAN DEFAULT FALSE,
                          randomizeQuestions BOOLEAN DEFAULT FALSE,
                          immediateFeedback BOOLEAN DEFAULT FALSE,
                          createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (quizID),
                          FOREIGN KEY (username) references AccountsData(username) ON DELETE CASCADE
);

CREATE TABLE QuestionData (
                              questionId INT NOT NULL AUTO_INCREMENT,
                              quizId INT NOT NULL,
                              questionType INT NOT NULL,
                              questionText TEXT NOT NULL,
                              singleQuestionAnswer TEXT,
                              alternativeAnswers TEXT,
                              multipleChoiceAnswers TEXT,
                              multipleChoiceCorrectIndexes TEXT,
                              questionImage TEXT,
                              multipleAnswerFields TEXT,
                              matchingPairs TEXT,
                              PRIMARY KEY (questionId),
                              FOREIGN KEY (quizId) REFERENCES Quiz(quizID) ON DELETE CASCADE
);



CREATE TABLE AchievementData (
                                 achievementId INT NOT NULL AUTO_INCREMENT,
                                 achievementName VARCHAR(255) NOT NULL,
                                 achievementUrl VARCHAR(255),
                                 achievementDescription TEXT,
                                 PRIMARY KEY (achievementId)
);



CREATE TABLE QuizHistoryData (
                                 id INT AUTO_INCREMENT PRIMARY KEY,
                                 quizID INT NOT NULL,
                                 userName VARCHAR(255) NOT NULL,
                                 quizScore INT DEFAULT 0,
                                 startTime TIME,
                                 endTime TIME,
                                 endDate DATE,
                                 elapsedTime BIGINT DEFAULT 0,
                                 FOREIGN KEY (quizID) REFERENCES QuizData(quizID) ON DELETE CASCADE,
                                 FOREIGN KEY (username) REFERENCES AccountsData(username) ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS NotificationsData (
                                                 notificationId INT NOT NULL AUTO_INCREMENT,
                                                 usernameFrom VARCHAR(255) NOT NULL,
    usernameTO VARCHAR(255) NOT NULL,
    notificationType INT NOT NULL,
    quizLink VARCHAR(255) DEFAULT NULL,
    highScore INT DEFAULT NULL,
    friendRequestId INT DEFAULT NULL,
    message TEXT,
    PRIMARY KEY (notificationId),
    FOREIGN KEY (usernameFrom) REFERENCES AccountsData(userName) ON DELETE CASCADE,
    FOREIGN KEY (usernameTo) REFERENCES AccountsData(userName) ON DELETE CASCADE,
    FOREIGN KEY (friendRequestId) REFERENCES FriendsData(friendRequestId) ON DELETE CASCADE
    );

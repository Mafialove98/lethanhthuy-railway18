drop database if exists Testing_System_Assignment_1;

create database Testing_System_Assignment_1;

use  Testing_System_Assignment_1;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(250)
);

drop table position;

CREATE TABLE Position (
    positionID INT PRIMARY KEY AUTO_INCREMENT,
    positionName ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);


CREATE TABLE `Account` (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(250),
    Username VARCHAR(250),
    fullName VARCHAR(250),
    DepartmentID INT,
    PositionID INT,
    createDate DATE,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)
        REFERENCES Position (positionID)
);



drop table if exists `group`;

CREATE TABLE `group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(50) UNIQUE,
    CreatorID INT,
    CreateDate DATE
);

drop table if exists groupAccount;

CREATE TABLE groupAccount (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(250) UNIQUE NOT NULL,
    CreatorID INT,
    JoinDate DATE
);

drop table if exists TypeQuestion;
 
 CREATE TABLE TypeQuestion (
    typeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName ENUM('Essay', 'Multiple-Choice')
);


use Testing_System_Assignment_1;

drop table if exists CategoryQuestion;


CREATE TABLE CategoryQuestion (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) UNIQUE
);




drop table if exists Question;

CREATE TABLE Question (
    QuestionID INT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(255),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE,
    FOREIGN KEY (typeID)
        REFERENCES TypeQuestion (typeID),
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (categoryID)
);


drop table if exists Answer;

CREATE TABLE Answer (
    AnswerID INT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(255),
    QuestionID INT,
    isCorrect ENUM('dung', 'sai'),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);



drop table if exists Exam ;

CREATE TABLE Exam (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    `Code` INT NOT NULL,
    Title VARCHAR(255),
    CategoryID INT,
    Duration TIME,
    CreatorID INT NOT NULL,
    CreateDate DATE,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID)
);



drop table if exists ExamQuestion;

CREATE TABLE ExamQuestion (
    ExamID INT NOT NULL,
    QuestionID INT NOT NULL,
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID)
);




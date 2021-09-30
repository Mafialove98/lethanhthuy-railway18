drop database if exists Testing_System_Assignment_1;

create database Testing_System_Assignment_1;

use  Testing_System_Assignment_1;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(250) UNIQUE
);

drop table if exists Position;

CREATE TABLE Position (
    positionID INT PRIMARY KEY AUTO_INCREMENT,
    positionName varchar (255) unique
);


CREATE TABLE `Account` (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(250),
    Username VARCHAR(250),
    fullName VARCHAR(250),
    DepartmentID INT,
    PositionID INT,
    createDate DATETIME,
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
    JoinDate DATETIME
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
    CreateDate DATETIME,
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
    CreateDate DATETIME,
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


 -- them gia tri vao bang --
 
INSERT INTO department 	(DepartmentName)
	VALUES 	('Phong Ky Thuat 1'),
			('Phong Ky Thuat 2'),
			('Phong Dev 1'),
			('Phong Dev 2'),
			('Phong Sale'),
			('Phong Marketing'),
			('Phong Giam Doc'),
			('Phong Tai Chinh'),
            ('Phong Dev 4'),
			('Phong Dev 3')
;

INSERT INTO department 	(DepartmentName)
	VALUES ('Phong nhan vien');
  
insert into Position (PositionName)
	values ('Dev1'),
			('Dev2'),
			('Tester'),
			('PM'),
			('Leader'),
			('Scrum Master')
            ;

insert into `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
	VALUES ('vti_account1@vtiacademy.com', 'vti1', 'Nguyen Van Tinh', 1, 1, '2019-12-01'),
		   ('vti_account2@vtiacademy.com', 'vti2', 'Trinh Hoai Linh', 1, 2, '2020-12-01'),
		   ('vti_account3@vtiacademy.com', 'vti3', 'Nguyen Van Test', 1, 1, '2020-07-01'),
		   ('vti_account4@vtiacademy.com', 'vti4', 'Tran Van Tinh', 1, 2, '2019-09-01'),
		   ('vti_account5@vtiacademy.com', 'account5', 'Ho Van Tinh', 3, 2, '2021-07-01'),
		   ('vti_account6@vtiacademy.com', 'account_vti6', 'Cao Thai Son', 3, 1, '2021-09-07'),
		   ('vti_7@vtiacademy.com', 'account_vti7', 'Tam That Tung', 3, 3, '2020-10-01'),
		   ('vti_8@vtiacademy.com', 'account_vti8', 'Nguyen Quynh Thu', 3, 4, '2019-04-01'),
		   ('vti_9@vtiacademy.com', 'account_vti9', 'Tran Kim Tuyen', 2, 1, '2021-06-08'),
		   ('vti_account10@vtiacademy.com', 'account_vti10', 'Nguyen Ba Dao', 1, 5, '2019-10-01'),
		   ('vti_account11@vtiacademy.com', 'account_vti11', 'Nguyen Van Binh', 1, 3, '2020-12-01'),
           ('vti_account12@vtiacademy.com', 'account_vti2', 'Nguyen Phong Lam', 2, 5, '2021-09-17')
;

 


insert into `Group`(GroupName, CreatorID, CreateDate) 
	values ('Nhom 1', '3', '2021-04-03'),
		   ('Nhom 2', '3', '2019-01-03'),
		   ('Nhom 3', '2', '2020-04-03'),
		   ('Nhom 4', '1', '2019-02-01'),
		   ('Nhom 5', '3', '2021-06-03'),
		   ('Nhom 6', '1', '2020-04-03'),
		   ('Nhom 7', '5', '2021-04-03'),
		   ('Nhom 8', '5', '2019-05-03'),
		   ('Nhom 9', '3', '2019-01-03'),
		   ('Nhom 10', '1', '2020-03-02');



insert	into groupAccount (GroupName,CreatorID,JoinDate) 
	values ('Nhom 1','3', '2021-06-01'),
		   (' Nhom 2','3', '2020-01-01'),
		   ( 'Nhom 3','2', NOW()),
		   ( ' Nhom 4','1', '2021-06-01'),
		   ( 'Nhom 5', '3','2021-06-01'),
		   ( 'Nhom 6','1', '2019-05-01'),
		   ( 'Nhom 7', '5','2021-06-01'),
		   ( 'Nhom 8','5', '2020-01-01'),
		   ( 'Nhom 9','3', '2021-07-01'),
		   ( 'nhom 10', '1','2021-06-01');
           


insert into TypeQuestion (TypeName)
values('Essay'),
	('Multiple-Choice')
;


insert into CategoryQuestion (CategoryName)
values('Java'),
		   ('SQL'),
		   ('HTML'),
		   ('CSS '),
		   ('.NET'),
		   ('Python'),
		   ('Ruby'),
		   ('JavaScript')
;


insert into `question` (Content, CategoryID, TypeID, CreatorID, CreateDate)
	VALUES ('Câu hỏi SQL 1', 2, 2, 1, '2021-04-01'),
		   ('Câu hỏi SQL 2', 2, 2, 2, '2020-01-01'),
		   ('Câu hỏi JAVA 1', 1, 1, 10, '2021-07-01'),
		   ('Câu hỏi JAVA 2', 1, 2, 5, '2021-06-01'),
		   ('Câu hỏi HTML 1', 3, 1, 2, NOW()),
		   ('Câu hỏi HTML 2', 3, 2, 2, NOW())
;


INSERT INTO answer (Content, QuestionID, isCorrect)
	VALUES ('Câu trả lời 1 - question SQL 1', 1, 'dung'),
		   ('Câu trả lời 2 - question SQL 1', 1, 'sai'),
		   ('Câu trả lời 3 - question SQL 1', 1, 'sai'),
		   ('Câu trả lời 4 - question SQL 1', 1, 'dung'),
		   ('Câu trả lời 1 - question SQL 2', 2, 'dung'),
		   ('Câu trả lời 2 - question SQL 2', 2, 'sai'),
		   ('Câu trả lời 3 - question SQL 2', 2, 'sai'),
		   ('Câu trả lời 4 - question SQL 2', 2, 'sai'),
		   ('Câu trả lời 1 - question JAVA 1', 3, 'sai'),
		   ('Câu trả lời 2 - question JAVA 1', 3, 'dung')
		   ;
           
	
insert into Exam(`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
	VALUES ('01', 'De thi 01', 1, '2021-08-03 09:54:45', 1, NOW()),
		   ('02', 'De thi 02', 1, '2021-08-06 09:54:45', 5, NOW()),
		   ('03', 'De thi 03', 2, '2021-08-05 09:54:45', 9, NOW()),
		   ('04', 'De thi 04', 2, '2021-08-01 09:54:45', 1, NOW()),
		   ('05', 'De thi 05', 1, '2021-08-04 09:54:45', 2, NOW()),
		   ('06', 'De thi 06', 2, '2021-08-07 09:54:45', 2, NOW()),
		   ('07', 'De thi 07', 1, '2021-08-08 09:54:45', 1, NOW());
           
           
           insert into Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
           values ('08', 'De thi 10', 1, '2021-08-04 09:54:45', 2, NOW()),
		   ('09', 'De thi 09', 2, '2021-08-07 09:54:45', 2, NOW()),
		   ('10', 'De thi 08', 1, '2021-08-08 09:54:45', 1, NOW());
           
			


insert into ExamQuestion (ExamID,QuestionID)
	values (1, 1),
		   (2, 1),
		   (3, 1),
		   (4, 1),
		   (5, 2),
		   (6, 2),
		   (7, 2),
		   (8, 2),
		   (9, 3),
		   (10, 3)
		  
;


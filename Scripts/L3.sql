USE [master];

--Task 1
DROP DATABASE University;

CREATE DATABASE University;
GO
--


--Task 2
USE University;
CREATE TABLE Students(

Id integer NOT NULL,
[Name] national char(25) NOT NULL,
Surname national char(25) NOT NULL,
[Group number] tinyint NOT NULL,

CONSTRAINT PK_Students_Id PRIMARY KEY(Id)
);
GO
--


--Task 3
ALTER TABLE Students ADD [Date of entry] date;
GO

ALTER TABLE Students DROP COLUMN [Date of entry];
GO
--


--Task 4
INSERT Students VALUES (74039571, 'Maksim', 'Alekseev', 2);
GO

INSERT INTO Students VALUES (68348345, 'Chupris', 'Eugene', 2);
GO

ALTER TABLE Students ALTER COLUMN [Group number] tinyint NULL;
GO

INSERT INTO Students (Id, Name, Surname) VALUES (23523854, 'Leonid', 'Matveenko');
GO

UPDATE Students
SET [Group number] = 2
FROM (SELECT * FROM Students WHERE Id = 23523854) AS selected
WHERE Students.Id = selected.Id;
GO

INSERT [Students] VALUES
(45458643, 'Roman', 'Bovkynovich', DEFAULT)
GO

INSERT Students VALUES
(45963092, 'Vladislav', 'Jeleznyak', 2),
(43583946, 'Jane', 'Razvodovskaya', 2),
(76584509, 'Anastasiya', 'Sakun', DEFAULT);
GO
--


--Task 5
SELECT * FROM Students;
SELECT [Name] FROM Students;
SELECT Id, [Name] FROM Students;
SELECT COUNT(*) AS [Rows amount] FROM Students;
GO
--


--Task 6
TRUNCATE TABLE Students;
GO

INSERT Students VALUES
(74039571, 'Maksim', 'Alekseev', 2),
(35673324, 'Artem', 'Radchikov', 3),
(47454956, 'Sergey', 'Urevich', 2),
(45853143, 'Ivan', 'Ermakov', 1),
(25746145, 'Yan', 'Pershay', 8),
(98430944, 'Dmirty', 'Nichiporchik', 1),
(13485356, 'Andrew', 'Akyshevich', 8),
(67348534, 'Roman', 'Bovkynovich', 2),
(34573425, 'Semen', 'Pilik', 8),
(94658893, 'Dmitry', 'Gargarin', 2);

SELECT * FROM Students;
GO

UPDATE Students SET [Group number] = 5;
DELETE FROM Students Where Id = 35673324 OR Id = 94658893 OR Id = 45853143;
SELECT * FROM Students;
GO

DROP TABLE Students;
GO
--


--Task 7
CREATE TABLE Students
(
Id int PRIMARY KEY,
[Name] nchar(25) NOT NULL,
[Phone number] nchar(25) UNIQUE,
Age tinyint DEFAULT 18,
CHECK(([Name] != '') AND ([Phone number] != '') AND (Age >= 16 AND Age < 40))
);
GO

INSERT Students VALUES (12543455, 'Maksim', '+375339346293', DEFAULT);
INSERT INTO Students (Id, [Name], [Phone number]) VALUES (14235345, 'Boris', '+375295693274');
GO

INSERT Students VALUES (37467394, NULL, '+375336322401', 19);
INSERT Students VALUES (12543455, 'Jane', '+375445923671', NULL);
INSERT Students VALUES (95834953, 'Fill', '', 19);
INSERT Students VALUES (95834953, 'Fill', '+375335830174', 15);
INSERT Students (Id, [Name], [Phone number]) VALUES (24539463, 'Irina', '+375295693274');
GO

UPDATE Students SET [Phone number] = '+375339346293';
GO

DROP TABLE Students;
GO

CREATE TABLE Students
(
Id integer PRIMARY KEY,
[Name] nchar(25),
Gender nchar(10) CHECK(Gender = 'Male' OR Gender = 'Female')
);
GO

INSERT Students VALUES(8345925, 'Kirill', 'Male228');
GO

DROP TABLE Students;
GO
--


--Task 8 --WTF
CREATE TABLE Results
(
Id int PRIMARY KEY IDENTITY(1, 1),
[Student name] national char(25) NOT NULL,
[Average value] float NOT NULL --n = 53
);
GO
--

--Task 11
CREATE TABLE Students
(
Id int PRIMARY KEY,
Surname nchar(25) NULL,
[Name] nchar(25) NOT NULL,
Patronymic nchar(25) NULL,
CHECK(Surname != '' AND [Name] != '' AND Patronymic != ''),
[Date of birth] date NOT NULL,
Gender nchar(15) NOT NULL CHECK(Gender = 'Male' OR Gender = 'Female'), --BTW, is it pulled with spaces when not all of symbols used
[Date of entry] date NOT NULL
--[E-mail] nchar(30) NULL UNIQUE CHECK([E-mail] != '') 
); --EPIC FAIL AHAHAHAHAHAH, stupid }, f*ck u!
GO

INSERT INTO Students (Id, [Name], [Date of birth], [Gender], [Date of entry]) VALUES
(13584934, 'Sergey', '11/10/2000', 'Male', '15-09-2017'),
(36894649, 'Victoria', '01/01/2001', 'Female', '15-09-2017'),
(38457424, 'Ekaterina', '26/02/1998', 'Female', '23-04-2018'),
(83673452, 'Helen', '12/07/1999', 'Female', '12-01-2016'),
(59474397, 'Gregory', '23/05/1999', 'Male', '05-01-2017'),
(35234265, 'Olga', '20/07/1999', 'Female', '23-09-2016');
GO

SELECT Id, [Name], [Gender], [Date of birth], [Date of entry] FROM Students
WHERE (Gender = 'Female' AND DATEDIFF(dd, [Date of birth], [Date of entry]) < 18*365 + 4);
GO

DROP TABLE Students;
--
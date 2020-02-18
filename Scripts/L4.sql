USE master;
CREATE DATABASE University
DROP DATABASE University;
USE University;

DROP TABLE Student;
DROP TABLE Groups;
DROP TABLE [Subject];
DROP TABLE Teacher;
DROP TABLE Pulpit;
DROP TABLE Profession;
DROP TABLE Faculty;
DROP TABLE Auditorium;
DROP TABLE [Auditorium type];
GO

CREATE TABLE [Auditorium type]
(
[Auditorium type] nchar(10) CONSTRAINT AUDITORIUM_TYPE_PK PRIMARY KEY,
[Auditorium type name] nchar(30) NOT NULL
);
GO

INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES ('��', '����������');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES ('��-�', '������������ �����');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES ('��-�', '���������� � ���. ����������');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES('��-X', '���������� �����������');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES('��-��', '����. ������������ �����');
GO

CREATE TABLE Faculty
(
Faculty nchar(10) CONSTRAINT FACULTY_PK PRIMARY KEY,
[Faculty name] nchar(50) NOT NULL
);
GO

INSERT FACULTY (FACULTY, [Faculty name])
VALUES('����', '������������ ���� � ����������');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('����', '���������� ���������� � �������');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('���', '����������������� ���������');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('���', '���������-������������� ���������');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('����','���������� � ������� ������ ��������������');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('���', '���������� ������������ �������');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('��', '��������� �������������� ����������');
GO

CREATE TABLE Profession
( 
Profession nchar(20) CONSTRAINT PROFESSION_PK PRIMARY KEY,
Faculty nchar(10) CONSTRAINT PROFESSION_FACULTY_FK FOREIGN KEY REFERENCES Faculty(Faculty),
[Profession name] nchar(100) NOT NULL,
Qualification nchar(70) NOT NULL
);
GO

INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-40 01 02', '�������������� ������� � ����������', '�������-�����������-�������������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-47 01 01', '������������ ����', '��������-��������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-36 06 01', '��������������� ������������ � ������� ��������� ����������', '�������-��������������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-36 01 08', '��������������� � ������������ ������� �� �������������� ����������', '�������-�������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-36 07 01', '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-75 01 01', '������ ���������', '������� ������� ���������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-75 02 01', '������-�������� �������������', '������� ������-��������� �������������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-89 02 02', '������ � ������������������', '���������� � ����� �������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-25 01 07', '��������� � ���������� �� �����������', '���������-��������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-25 01 08', '������������� ����, ������ � �����', '���������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-36 05 01', '������ � ������������ ������� ���������', '�������-�������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('����', '1-46 01 01', '�������������� ����', '�������-��������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-48 01 02', '���������� ���������� ������������ �������, ���������� � �������', '�������-�����-��������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-48 01 05', '���������� ���������� ����������� ���������', '�������-�����-��������');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('���', '1-54 01 03', '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������');
GO

CREATE TABLE Pulpit
(
Pulpit nchar(10) CONSTRAINT PULPIT_PK PRIMARY KEY,
[Pulpit name] nchar(100) NOT NULL, 
Faculty nchar(10) CONSTRAINT PULPIT_FACULTY_FK FOREIGN KEY REFERENCES Faculty(Faculty)
);
GO

INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��������', '?', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��������', '?', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '?', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('����', '������������� ������ � ����������', '��');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('������', '���������������� ������������ � ������ ��������� ����������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '����������� ���������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('���', '�����������-������������ ���������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '��������������� �����������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '�����������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '��������������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('�����', '���������� � ����������������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('����', '������ ������� � ������������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('���', '������� � ������������������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('������', '������������ �������������� � ������-��������� �������������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '���������� ����', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('�����', '������ ����� � ���������� �������������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('���', '���������� �������������������� �����������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('�����', '���������� � ������� ������� �� ���������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('��', '������������ �����', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('���', '���������� ����������� ���������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('�������', '���������� �������������� ������� � ����� ���������� ���������� ', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('�����', '��������� � ��������� ���������� �����������', '����');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('����', '������������� ������ � ����������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('����', '����������� � ��������� ������������������', '���');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('������', '����������, �������������� �����, ������� � ������', '���');
GO

CREATE TABLE Teacher
(
Teacher nchar(10) CONSTRAINT TEACHER_PK PRIMARY KEY,
[Teacher name] nchar(100) NOT NULL,
Gender nchar(1) CHECK (Gender in ('�', '�')) NOT NULL,
Pulpit nchar(10) CONSTRAINT TEACHER_PULPIT_FK FOREIGN KEY REFERENCES Pulpit(Pulpit)
);
GO

INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('����', '������ �������� �������������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('�����', '�������� ��������� ��������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('�����', '���������� ������� ����������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('�����', '�������� ������ ��������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '����� ��������� ����������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '��������� ����� ��������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '����� ������� ��������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '����� ������� �������������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '����� ����� �������������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('������', '���������� ��������� �������������', '�', '������');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '��������� ������� �����������', '�', '������');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('������', '����������� ��������� ��������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('����', '������� ��������� ����������', '�', '����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('����', '������ ������ ��������', '�', '��');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('����', '������� ������ ����������', '�', '������');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '���������� ������� ��������', '�', '������');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('���', '������ ������ ���������� ', '�', '��');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('�����', '��������� �������� ���������', '�', '�����');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('������', '���������� �������� ����������', '�', '��');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('�����', '�������� ������ ����������', '�', '��');
GO

CREATE TABLE [Subject]
(
[Subject] nchar(10) CONSTRAINT SUBJECT_PK PRIMARY KEY,
[Subject name] nchar(100) UNIQUE NOT NULL,
Pulpit nchar(10) CONSTRAINT SUBJECT_PULPIT_FK FOREIGN KEY REFERENCES Pulpit(Pulpit)
);
GO

INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('����', '������� ���������� ������ ������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '���� ������', '����')
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '�������������� ����������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('����', '������ �������������� � ����������������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '������������� ������ � ������������ ��������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '���������������� ������� ����������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('����', '������������� ������ ��������� ����������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '�������������� �������������� ������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '������������ ��������� ', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('�����', '��������. ������, �������� � �������� �����', '������');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '������������ �������������� �������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '����������� ��������. ������������', '������');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '���������� ����������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '�������������� ����������������', '����'); 
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('����', '���������� ������ ���', '����'); 
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '��������-��������������� ����������������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '��������� ������������������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '������������� ������', '����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('������OO', '�������� ������ ������ � ���� � ���. ������.', '��');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('�������', '������ ������-��������� � ������������� ���������', '������');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '���������� �������� ', '��');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '�����������', '�����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('��', '������������ �����', '��');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '���������� ��������� �������', '��������');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '������ ��������� ����', '��');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('����', '���������� � ������������ �������������', '�����');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('����', '���������� ���������� �������� ���������� ', '�������');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('���', '���������� ������������', '��������');
GO

CREATE TABLE Auditorium
(
Auditorium nchar(20) CONSTRAINT AUDITORIUM_PK PRIMARY KEY,
[Auditorium type] nchar(10) NOT NULL CONSTRAINT AUDITORIUM_AUDITORIUM_TYPE_FK FOREIGN KEY REFERENCES [Auditorium type]([Auditorium type]),
[Auditorium capacity] integer CONSTRAINT AUDITORIUM_CAPACITY_CHECK DEFAULT 1 CHECK ([Auditorium capacity] BETWEEN 1 AND 300),
[Auditorium name] nchar(10) NOT NULL
);
GO

INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('206-1', '206-1', '��-�', 15);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('301-1', '301-1', '��-�', 15);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('236-1', '236-1', '��', 60);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('313-1', '313-1', '��-�', 60);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('324-1', '324-1', '��-�', 50);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('413-1', '413-1', '��-�', 15);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('423-1', '423-1', '��-�', 90);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('408-2', '408-2', '��', 90);
GO

CREATE TABLE Groups
(
GroupID integer IDENTITY(1,1) CONSTRAINT GROUP_PK PRIMARY KEY,
Faculty nchar(10) CONSTRAINT GROUPS_FACULTY_FK FOREIGN KEY REFERENCES Faculty(Faculty),
Profession nchar(20) CONSTRAINT GROUPS_PROFESSION_FK FOREIGN KEY REFERENCES Profession(Profession),
[Year first] smallint CHECK ([Year first] <= YEAR(GETDATE()))
);
GO

INSERT Groups (Faculty, Profession, [Year first])
VALUES
('����', '1-40 01 02', 2013),--1 ��
('����', '1-40 01 02', 2012),
('����', '1-40 01 02', 2011),
('����', '1-40 01 02', 2010),
('����', '1-47 01 01', 2013),--5 ��
('����', '1-47 01 01', 2012),
('����', '1-47 01 01', 2011),
('����', '1-36 06 01', 2010),--8 ��
('����', '1-36 06 01', 2013),
('����', '1-36 06 01', 2012),
('����', '1-36 06 01', 2011),
('����', '1-36 01 08', 2013),--12 ��
('����', '1-36 01 08', 2012),
('����', '1-36 07 01', 2011),
('����', '1-36 07 01', 2010),
('���', '1-48 01 02', 2012),--16 ��
('���', '1-48 01 02', 2011),
('���', '1-48 01 05', 2013),
('���', '1-54 01 03', 2012),
('���', '1-75 01 01', 2013),--20 ��
('���', '1-75 02 01', 2012),
('���', '1-75 02 01', 2011),
('���', '1-89 02 02', 2012),
('���', '1-89 02 02', 2011),
('����', '1-36 05 01', 2013),
('����', '1-36 05 01', 2012),
('����', '1-46 01 01', 2012),--27 ��
('���', '1-25 01 07', 2013),
('���', '1-25 01 07', 2012),
('���', '1-25 01 07', 2010),
('���', '1-25 01 08', 2013),
('���', '1-25 01 08', 2012);--32 ��
GO

CREATE TABLE Student
(
StudentID integer IDENTITY(1000,1) CONSTRAINT STUDENT_PK primary key,
GroupID integer CONSTRAINT STUDENT_GROUP_FK FOREIGN KEY REFERENCES Groups(GroupID),
[Name] nchar(100), 
Bday date
);
GO

INSERT Student (GroupID, [Name], Bday)
VALUES
(1, '���������� ��������� �������������', '11.03.1995'),
(1, '������ ��������� �������', '07.12.1995'),
(1, '������ �������� ����������', '12.10.1995'),
(1, '����� ��������� ���������', '08.01.1995'),
(1, '����� ����� ��������', '02.08.1995');

INSERT Student (GroupID, [Name], Bday)
VALUES 
(2, '����� ������� ��������', '12.07.1994'),
(2, '������� �������� ����������', '06.03.1994'),
(2, '�������� ����� �����������', '09.11.1994'),
(2, '������� ����� ���������', '04.10.1994'),
(2, '��������� ��������� ����������', '08.01.1994'),
(3, '������� ������ ���������', '02.08.1993'),
(3, '������� ��� ����������', '07.12.1993'),
(3, '������� ����� �����������', '02.12.1993'),
(4, '������� ������ �����������', '08.03.1992'),
(4, '������� ����� �������������', '02.06.1992'),
(4, '�������� ����� �����������', '11.12.1992'),
(4, '�������� ������� �������������', '11.05.1992'),
(4, '����������� ������� ��������', '09.11.1992'),
(4, '�������� ������� ����������', '01.11.1992'),
(5, '�������� ����� ������������', '08.07.1995'),
(5, '������ ������� ����������', '02.11.1995'),
(5, '������ ��������� �����������', '07.05.1995'),
(5, '����� ��������� ���������', '04.08.1995'),
(6, '���������� ����� ����������', '08.11.1994'),
(6, '�������� ������ ��������', '02.03.1994'),
(6, '���������� ����� ����������', '04.06.1994'),
(6, '��������� ���������� ���������', '09.11.1994'),
(6, '����� ��������� �������', '04.07.1994'),
(7, '����������� ����� ������������', '03.01.1993'),
(7, '������� ���� ��������', '12.09.1993'),
(7, '��������� ������ ��������', '12.06.1993'),
(7, '���������� ��������� ����������', '09.02.1993'),
(7, '������� ������ ���������', '04.07.1993'),
(8, '������ ������� ���������', '08.01.1992'),
(8, '��������� ����� ����������', '12.05.1992'),
(8, '�������� ����� ����������', '08.11.1992'),
(8, '������� ������� ���������', '12.03.1992'),
(9, '�������� ����� �������������', '10.08.1995'),
(9, '���������� ������ ��������', '02.05.1995'),
(9, '������ ������� �������������', '08.01.1995'),
(9, '��������� ��������� ��������', '11.09.1995'),
(10, '������ ������� ������������', '08.01.1994'),
(10, '������ ������ ����������', '11.09.1994'),
(10, '����� ���� �������������', '06.04.1994'),
(10, '������� ������ ����������', '12.08.1994');

INSERT Student (GroupID, [Name], Bday)
VALUES 
(11, '��������� ��������� ����������', '07.11.1993'),
(11, '������ ������� ����������', '04.06.1993'),
(11, '������� ����� ����������', '10.12.1993'),
(11, '������� ������ ����������', '04.07.1993'),
(11, '������� ����� ���������', '08.01.1993'),
(11, '����� ������� ����������', '02.09.1993'),
(12, '���� ������ �����������', '11.12.1995'),
(12, '������� ���� �������������', '10.06.1995'),
(12, '��������� ���� ���������', '09.08.1995'),
(12, '����� ����� ���������', '04.07.1995'),
(12, '��������� ������ ����������', '08.03.1995'),
(12, '����� ����� ��������', '12.09.1995'),
(13, '������ ����� ������������', '08.10.1994'),
(13, '���������� ����� ����������', '10.02.1994'),
(13, '�������� ������� �������������', '11.11.1994'),
(13, '���������� ����� ����������', '10.02.1994'),
(13, '����������� ����� ��������', '12.01.1994'),
(14, '�������� ������� �������������', '11.09.1993'),
(14, '������ �������� ����������', '01.12.1993'),
(14, '���� ������� ����������', '09.06.1993'),
(14, '�������� ���������� ����������', '05.01.1993'),
(14, '����������� ����� ����������', '01.07.1993'),
(15, '������� ��������� ���������', '07.04.1992'),
(15, '������ �������� ���������', '10.12.1992'),
(15, '��������� ����� ����������', '05.05.1992'),
(15, '���������� ����� ������������', '11.01.1992'),
(15, '�������� ����� ����������', '04.06.1992'),
(16, '����� ����� ����������', '08.01.1994'),
(16, '��������� ��������� ���������', '07.02.1994'),
(16, '������ ������ �����������', '12.06.1994'),
(16, '������� ����� ��������', '03.07.1994'),
(16, '������ ������ ���������', '04.07.1994'),
(17, '������� ��������� ����������', '08.11.1993'),
(17, '������ ����� ����������', '02.04.1993'),
(17, '������ ���� ��������', '03.06.1993'),
(17, '������� ������ ���������', '05.11.1993'),
(17, '������ ������ �������������', '03.07.1993'),
(18, '��������� ����� ��������', '08.01.1995'),
(18, '���������� ��������� ���������', '06.09.1995'),
(18, '�������� ��������� ����������', '08.03.1995'),
(18, '��������� ����� ��������', '07.08.1995');
GO

CREATE TABLE Progress
( 
[Subject] nchar(10) CONSTRAINT PROGRESS_SUBJECT_FK FOREIGN KEY
REFERENCES [Subject]([Subject]), 
StudentID integer CONSTRAINT PROGRESS_IDSTUDENT_FK FOREIGN KEY 
REFERENCES Student(StudentID), 
[Date] date, 
Note integer CHECK (NOTE BETWEEN 1 AND 10)
);
GO

INSERT INTO PROGRESS ([Subject], StudentID, [Date], NOTE)
VALUES 
('����', 1000, '01.10.2013', 6),
('����', 1001, '01.10.2013', 8),
('����', 1002, '01.10.2013', 7),
('����', 1003, '01.10.2013', 5),
('����', 1005, '01.10.2013', 4);

INSERT INTO PROGRESS ([Subject], StudentID, [Date], NOTE)
VALUES 
('����', 1014, '01.12.2013', 5),
('����', 1015, '01.12.2013', 9),
('����', 1016, '01.12.2013', 5),
('����', 1017, '01.12.2013', 4);

INSERT INTO PROGRESS ([Subject], StudentID, [Date], NOTE)
VALUES 
('��', 1018, '06.05.2013', 4),
('��', 1019, '06.05.2013', 7),
('��', 1020, '06.05.2013', 7),
('��', 1021, '06.05.2013', 9),
('��', 1022, '06.05.2013', 5),
('��', 1023, '06.05.2013', 6);
GO
USE University;
GO

-->FROM-->WHERE-->GROUP BY->HAVING-->SELECT-->DISTINCT-->ORDER BY-->TOP-->INTO

--� ������� ��������� SELECT ������������ �������������� �����, ���������� ��� ������ � ������� ������� FACULTY.
SELECT * FROM Faculty;
GO

--� ������� ��������� SELECT ������������ �������������� �����, ���������� ��� ������ �������� TEACHER � PULPIT ������� TEACHER.
SELECT Teacher, Pulpit FROM Teacher;
GO

--������������ �������� ���� �������������� (������� TEACHER), ���������� �� ������� ���� (������� PULPIT).
SELECT [Teacher name] FROM Teacher WHERE Pulpit = '����';
GO

--������������ �������� ���� (������� TEACHER_NAME) �������������� (������� TEACHER), ���������� �� ������� ���� ��� �� ������� ������ (������� PULPIT).
SELECT [Teacher name] FROM Teacher WHERE Pulpit = '����' OR Pulpit = '������';
GO

--������������ �������� ���� (������� TEACHER_NAME) �������������� (������� TEACHER) �������� ���� (������� GENDER), ���������� �� ������� ����.
SELECT [Teacher name] FROM Teacher WHERE Gender = '�' AND Pulpit = '����'
GO

--������������ �������� ���� (������� TEACHER_NAME) ���� �������������� (������� TEACHER) ����� �������������� �������� ���� (������� GENDER),
--���������� �� ������� ����.
--��� ���� ������� ��������������� ������ ������ ����� ���: ��� �������������. 
SELECT [Teacher name] '��� �������������' FROM Teacher WHERE Gender != '�' AND Pulpit = '����'
GO

--�� ������ ����������� ������� TEACHER ������������ �������� ��-��� ���� ������.
--����������: ������������ ������ DISTINCT.
SELECT DISTINCT Pulpit FROM Teacher;
GO

--������������ �������� ��������� (������� AUDITORIUM) � ������� ����������� �� ����������� (������� AUDITORIUM_CAPACITY). 
--����������: ������������ ������ ORDER BY.
SELECT [Auditorium name], [Auditorium capacity] FROM Auditorium ORDER BY [Auditorium capacity];
GO

--�� ������ ����������� ������� AUDITORIUM ������� ��� ���� ��������� (������� AUDITORIUM_TYPE), � ������� ��������� ����� ������������� ���������.
--����������: ������������ ������ ORDER BY, �������� ����� DISTINCT � TOP. 
SELECT DISTINCT TOP(2) [Auditorium type], [Auditorium capacity] FROM Auditorium ORDER BY [Auditorium capacity] DESC;
GO

--�� ������ ����������� ������� SUBJECT ������������ �������� ��������� (������� SUBJECT), ������� ���������� �� ��������� (������� PULPIT) �����, ������ � ��.
--����������: ������������ ������ DISTINCT � �������� ����� IN.
SELECT [Subject], [Subject name] FROM [Subject] WHERE Pulpit IN ('�����', '������', '��');
GO


--�� ������ ����������� ������� PROFESSION ���������� �������� ������������ �������������� (������� PROFESSION_NAME),
--������� ������������� ������������ (������� QUALIFICATION) � ������������ �������� ������������ ����� �����.
--�������������� ����� ������� ������ ��������� ��� ������� � �������: ������������ ������������� � ������������. ����������: ������������ LIKE.
SELECT [Profession name] '������������ �������������' ,  Qualification '������������' FROM Profession WHERE Qualification LIKE '%�����%';
GO


--� ������� ��������� SELECT ��������� ������ � ��������� (��� � ���� ��������) �� ��������� �������.
USE University;
CREATE TABLE #MyNewDB
(
[Name] nchar(100),
Bday date
);
GO

INSERT INTO #MyNewDB
SELECT [Name], Bday FROM Student;
GO

SELECT * FROM #MyNewDB;
GO
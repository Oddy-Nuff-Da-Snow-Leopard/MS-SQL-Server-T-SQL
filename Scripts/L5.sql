USE University;
GO

-->FROM-->WHERE-->GROUP BY->HAVING-->SELECT-->DISTINCT-->ORDER BY-->TOP-->INTO

--С помощью оператора SELECT сформировать результирующий набор, содержащий все строки и столбцы таблицы FACULTY.
SELECT * FROM Faculty;
GO

--С помощью оператора SELECT сформировать результирующий набор, содержащий все строки столбцов TEACHER и PULPIT таблицы TEACHER.
SELECT Teacher, Pulpit FROM Teacher;
GO

--Сформировать перечень имен преподавателей (таблица TEACHER), работающих на кафедре ИСиТ (столбец PULPIT).
SELECT [Teacher name] FROM Teacher WHERE Pulpit = 'ИСиТ';
GO

--Сформировать перечень имен (столбец TEACHER_NAME) преподавателей (таблица TEACHER), работающих на кафедре ИСиТ или на кафедре ПОиСОИ (столбец PULPIT).
SELECT [Teacher name] FROM Teacher WHERE Pulpit = 'ИСиТ' OR Pulpit = 'ПОиСОИ';
GO

--Сформировать перечень имен (столбец TEACHER_NAME) преподавателей (таблица TEACHER) женского пола (столбец GENDER), работающих на кафедре ИСиТ.
SELECT [Teacher name] FROM Teacher WHERE Gender = 'ж' AND Pulpit = 'ИСиТ'
GO

--Сформировать перечень имен (столбец TEACHER_NAME) всех преподавателей (таблица TEACHER) кроме преподавателей женского пола (столбец GENDER),
--работающих на кафедре ИСиТ.
--При этом столбец результирующего набора должен иметь имя: Имя преподавателя. 
SELECT [Teacher name] 'Имя преподователя' FROM Teacher WHERE Gender != 'ж' AND Pulpit = 'ИСиТ'
GO

--На основе содержимого таблицы TEACHER сформировать перечень ко-дов всех кафедр.
--Примечание: использовать секцию DISTINCT.
SELECT DISTINCT Pulpit FROM Teacher;
GO

--Сформировать перечень аудиторий (таблица AUDITORIUM) в порядке возрастания их вместимости (столбец AUDITORIUM_CAPACITY). 
--Примечание: использовать секцию ORDER BY.
SELECT [Auditorium name], [Auditorium capacity] FROM Auditorium ORDER BY [Auditorium capacity];
GO

--На основе содержимого таблицы AUDITORIUM выбрать два типа аудиторий (столбец AUDITORIUM_TYPE), к которым относятся самые вместительные аудитории.
--Примечание: использовать секции ORDER BY, ключевые слова DISTINCT и TOP. 
SELECT DISTINCT TOP(2) [Auditorium type], [Auditorium capacity] FROM Auditorium ORDER BY [Auditorium capacity] DESC;
GO

--На основе содержимого таблицы SUBJECT сформировать перечень дисциплин (столбец SUBJECT), которые закреплены за кафедрами (столбец PULPIT) ЛЗиДВ, ПОиСОИ и ОВ.
--Примечание: использовать секцию DISTINCT и ключевое слово IN.
SELECT [Subject], [Subject name] FROM [Subject] WHERE Pulpit IN ('ЛЗиДВ', 'ПОиСОИ', 'ОВ');
GO


--На основе содержимого таблицы PROFESSION определить перечень наименований специальностей (столбец PROFESSION_NAME),
--которым соответствует квалификация (столбец QUALIFICATION) в наименовании которого присутствует слово химик.
--Результирующий набор запроса должен содержать два столбца с именами: Наименование специальности и Квалификация. Примечание: использовать LIKE.
SELECT [Profession name] 'Наименование специальности' ,  Qualification 'Квалификация' FROM Profession WHERE Qualification LIKE '%химик%';
GO


--С помощью оператора SELECT перенести данные о студентах (ФИО и дата рождения) во временную таблицу.
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
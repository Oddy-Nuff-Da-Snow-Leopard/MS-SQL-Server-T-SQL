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

INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES ('ЛК', 'Лекционная');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES ('ЛБ-К', 'Компьютерный класс');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES ('ЛК-К', 'Лекционная с уст. проектором');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES('ЛБ-X', 'Химическая лаборатория');
INSERT [Auditorium type] ([Auditorium type], [Auditorium type name]) VALUES('ЛБ-СК', 'Спец. компьютерный класс');
GO

CREATE TABLE Faculty
(
Faculty nchar(10) CONSTRAINT FACULTY_PK PRIMARY KEY,
[Faculty name] nchar(50) NOT NULL
);
GO

INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ИДиП', 'Издательское дело и полиграфия');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ХТиТ', 'Химическая технология и техника');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ЛХФ', 'Лесохозяйственный факультет');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ИЭФ', 'Инженерно-экономический факультет');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ТТЛП','Технология и техника лесной промышленности');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ТОВ', 'Технология органических веществ');
INSERT FACULTY (FACULTY, [Faculty name])
VALUES('ИТ', 'Факультет информационных технологий');
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
VALUES ('ИДиП', '1-40 01 02', 'Информационные системы и технологии', 'инженер-программист-системотехник');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ИДиП', '1-47 01 01', 'Издательское дело', 'редактор-технолог');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ИДиП', '1-36 06 01', 'Полиграфическое оборудование и системы обработки информации', 'инженер-электромеханик');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ХТиТ', '1-36 01 08', 'Конструирование и производство изделий из композиционных материалов', 'инженер-механик');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ХТиТ', '1-36 07 01', 'Машины и аппараты химических производств и предприятий строительных материалов', 'инженер-механик');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ЛХФ', '1-75 01 01', 'Лесное хозяйство', 'инженер лесного хозяйства');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ЛХФ', '1-75 02 01', 'Садово-парковое строительство', 'инженер садово-паркового строительства');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ЛХФ', '1-89 02 02', 'Туризм и природопользование', 'специалист в сфере туризма');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ИЭФ', '1-25 01 07', 'Экономика и управление на предприятии', 'экономист-менеджер');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ИЭФ', '1-25 01 08', 'Бухгалтерский учет, анализ и аудит', 'экономист');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ТТЛП', '1-36 05 01', 'Машины и оборудование лесного комплекса', 'инженер-механик');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ТТЛП', '1-46 01 01', 'Лесоинженерное дело', 'инженер-технолог');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ТОВ', '1-48 01 02', 'Химическая технология органических веществ, материалов и изделий', 'инженер-химик-технолог');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ТОВ', '1-48 01 05', 'Химическая технология переработки древесины', 'инженер-химик-технолог');
INSERT Profession (Faculty, Profession, [Profession name], Qualification)
VALUES ('ТОВ', '1-54 01 03', 'Физико-химические методы и приборы контроля качества продукции', 'инженер по сертификации');
GO

CREATE TABLE Pulpit
(
Pulpit nchar(10) CONSTRAINT PULPIT_PK PRIMARY KEY,
[Pulpit name] nchar(100) NOT NULL, 
Faculty nchar(10) CONSTRAINT PULPIT_FACULTY_FK FOREIGN KEY REFERENCES Faculty(Faculty)
);
GO

INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ХТЭПиМЭЕ', '?', 'ХТиТ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ТНХСиППМ', '?', 'ИЭФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ОВ', '?', 'ТОВ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ИСиТ', 'Инфорационных систем и технологий', 'ИТ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ПОиСОИ', 'Полиграфического оборудования и систем обработки информации', 'ИДиП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('БФ', 'Белорусской филологии', 'ИДиП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('РИТ', 'Редакционно-издательских тенологий', 'ИДиП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ПП', 'Полиграфических производств', 'ИДиП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЛВ', 'Лесоводства', 'ЛХФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЛУ', 'Лесоустройства', 'ЛХФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЛЗиДВ', 'Лесозащиты и древесиноведения', 'ЛХФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЛКиП', 'Лесных культур и почвоведения', 'ЛХФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ТиП', 'Туризма и природопользования', 'ЛХФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЛПиСПС', 'Ландшафтного проектирования и садово-паркового строительства', 'ЛХФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ТЛ', 'Транспорта леса', 'ТТЛП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЛМиЛЗ', 'Лесных машин и технологии лесозаготовок', 'ТТЛП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ТДП', 'Технологий деревообрабатывающих производств', 'ТТЛП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ТиДИД', 'Технологии и дизайна изделий из древесины', 'ТТЛП');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ОХ', 'Органической химии', 'ТОВ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ХПД', 'Химической переработки древесины', 'ТОВ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ТНВиОХТ', 'Технологии неорганических веществ и общей химической технологии ', 'ХТиТ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ПиАХП', 'Процессов и аппаратов химических производств', 'ХТиТ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('ЭТиМ', 'Экономической теории и маркетинга', 'ИЭФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('МиЭП', 'Менеджмента и экономики природопользования', 'ИЭФ');
INSERT Pulpit (Pulpit, [Pulpit name], Faculty)
VALUES ('СБУАиА', 'Статистики, бухгалтерского учета, анализа и аудита', 'ИЭФ');
GO

CREATE TABLE Teacher
(
Teacher nchar(10) CONSTRAINT TEACHER_PK PRIMARY KEY,
[Teacher name] nchar(100) NOT NULL,
Gender nchar(1) CHECK (Gender in ('м', 'ж')) NOT NULL,
Pulpit nchar(10) CONSTRAINT TEACHER_PULPIT_FK FOREIGN KEY REFERENCES Pulpit(Pulpit)
);
GO

INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('СМЛВ', 'Смелов Владимир Владиславович', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('АКНВЧ', 'Акунович Станислав Иванович', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('КЛСНВ', 'Колесников Виталий Леонидович', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('БРКВЧ', 'Бракович Андрей Игоревич', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('ДТК', 'Дятко Александр Аркадьевич', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('УРБ', 'Урбанович Павел Павлович', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('ГРН', 'Гурин Николай Иванович', 'м', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('ЖЛК', 'Жиляк Надежда Александровна', 'ж', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('МРЗ', 'Мороз Елена Станиславовна', 'ж', 'ИСиТ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('БРТШВЧ', 'Барташевич Святослав Александрович', 'м', 'ПОиСОИ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('АРС', 'Арсентьев Виталий Арсентьевич', 'м', 'ПОиСОИ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('БРНВСК', 'Барановский Станислав Иванович', 'м', 'ЭТиМ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('НВРВ', 'Неверов Александр Васильевич', 'м', 'МиЭП');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('РВКЧ', 'Ровкач Андрей Иванович', 'м', 'ОВ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('ДМДК', 'Демидко Марина Николаевна', 'ж', 'ЛПиСПС');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('БРГ', 'Бурганская Татьяна Минаевна', 'ж', 'ЛПиСПС');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('РЖК', 'Рожков Леонид Николаевич ', 'м', 'ЛВ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('ЗВГЦВ', 'Звягинцев Вячеслав Борисович', 'м', 'ЛЗиДВ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('БЗБРДВ', 'Безбородов Владимир Степанович', 'м', 'ОХ');
INSERT Teacher (Teacher, [Teacher name], Gender, Pulpit)
VALUES ('НСКВЦ', 'Насковец Михаил Трофимович', 'м', 'ТЛ');
GO

CREATE TABLE [Subject]
(
[Subject] nchar(10) CONSTRAINT SUBJECT_PK PRIMARY KEY,
[Subject name] nchar(100) UNIQUE NOT NULL,
Pulpit nchar(10) CONSTRAINT SUBJECT_PULPIT_FK FOREIGN KEY REFERENCES Pulpit(Pulpit)
);
GO

INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('СУБД', 'Системы управления базами данных', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('БД', 'Базы данных', 'ИСиТ')
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ИНФ', 'Информационные технологии', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ОАиП', 'Основы алгоритмизации и программирования', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ПЗ', 'Представление знаний в компьютерных системах', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ПСП', 'Программирование сетевых приложений', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('МСОИ', 'Моделирование систем обработки информации', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ПИС', 'Проектирование информационных систем', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('КГ', 'Компьютерная геометрия ', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ПМАПЛ', 'Полиграф. машины, автоматы и поточные линии', 'ПОиСОИ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('КМС', 'Компьютерные мультимедийные системы', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ОПП', 'Организация полиграф. производства', 'ПОиСОИ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ДМ', 'Дискретная математика', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('МП', 'Математическое программирование', 'ИСиТ'); 
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ЛЭВМ', 'Логические основы ЭВМ', 'ИСиТ'); 
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ООП', 'Объектно-ориентированное программирование', 'ИСиТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ЭП', 'Экономика природопользования', 'МиЭП');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ЭТ', 'Экономическая теория', 'ЭТиМ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('БЛЗиПсOO', 'Биология лесных зверей и птиц с осн. охотов.', 'ОВ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ОСПиЛПХ', 'Основы садово-паркового и лесопаркового хозяйства', 'ЛПиСПС');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ИГ', 'Инженерная геодезия ', 'ЛУ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ЛВ', 'Лесоводство', 'ЛЗиДВ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ОХ', 'Органическая химия', 'ОХ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ТРИ', 'Технология резиновых изделий', 'ТНХСиППМ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ВТЛ', 'Водный транспорт леса', 'ТЛ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ТиОЛ', 'Технология и оборудование лесозаготовок', 'ЛМиЛЗ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ТОПИ', 'Технология обогащения полезных ископаемых ', 'ТНВиОХТ');
INSERT [Subject] ([Subject], [Subject name], Pulpit)
VALUES ('ПЭХ', 'Прикладная электрохимия', 'ХТЭПиМЭЕ');
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
VALUES ('206-1', '206-1', 'ЛБ-К', 15);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('301-1', '301-1', 'ЛБ-К', 15);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('236-1', '236-1', 'ЛК', 60);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('313-1', '313-1', 'ЛК-К', 60);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('324-1', '324-1', 'ЛК-К', 50);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('413-1', '413-1', 'ЛБ-К', 15);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('423-1', '423-1', 'ЛБ-К', 90);
INSERT Auditorium (Auditorium, [Auditorium name], [Auditorium type], [Auditorium capacity])
VALUES ('408-2', '408-2', 'ЛК', 90);
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
('ИДиП', '1-40 01 02', 2013),--1 гр
('ИДиП', '1-40 01 02', 2012),
('ИДиП', '1-40 01 02', 2011),
('ИДиП', '1-40 01 02', 2010),
('ИДиП', '1-47 01 01', 2013),--5 гр
('ИДиП', '1-47 01 01', 2012),
('ИДиП', '1-47 01 01', 2011),
('ИДиП', '1-36 06 01', 2010),--8 гр
('ИДиП', '1-36 06 01', 2013),
('ИДиП', '1-36 06 01', 2012),
('ИДиП', '1-36 06 01', 2011),
('ХТиТ', '1-36 01 08', 2013),--12 гр
('ХТиТ', '1-36 01 08', 2012),
('ХТиТ', '1-36 07 01', 2011),
('ХТиТ', '1-36 07 01', 2010),
('ТОВ', '1-48 01 02', 2012),--16 гр
('ТОВ', '1-48 01 02', 2011),
('ТОВ', '1-48 01 05', 2013),
('ТОВ', '1-54 01 03', 2012),
('ЛХФ', '1-75 01 01', 2013),--20 гр
('ЛХФ', '1-75 02 01', 2012),
('ЛХФ', '1-75 02 01', 2011),
('ЛХФ', '1-89 02 02', 2012),
('ЛХФ', '1-89 02 02', 2011),
('ТТЛП', '1-36 05 01', 2013),
('ТТЛП', '1-36 05 01', 2012),
('ТТЛП', '1-46 01 01', 2012),--27 гр
('ИЭФ', '1-25 01 07', 2013),
('ИЭФ', '1-25 01 07', 2012),
('ИЭФ', '1-25 01 07', 2010),
('ИЭФ', '1-25 01 08', 2013),
('ИЭФ', '1-25 01 08', 2012);--32 гр
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
(1, 'Хартанович Екатерина Александровна', '11.03.1995'),
(1, 'Горбач Елизавета Юрьевна', '07.12.1995'),
(1, 'Зыкова Кристина Дмитриевна', '12.10.1995'),
(1, 'Шенец Екатерина Сергеевна', '08.01.1995'),
(1, 'Шитик Алина Игоревна', '02.08.1995');

INSERT Student (GroupID, [Name], Bday)
VALUES 
(2, 'Силюк Валерия Ивановна', '12.07.1994'),
(2, 'Сергель Виолетта Николаевна', '06.03.1994'),
(2, 'Добродей Ольга Анатольевна', '09.11.1994'),
(2, 'Подоляк Мария Сергеевна', '04.10.1994'),
(2, 'Никитенко Екатерина Дмитриевна', '08.01.1994'),
(3, 'Яцкевич Галина Иосифовна', '02.08.1993'),
(3, 'Осадчая Эла Васильевна', '07.12.1993'),
(3, 'Акулова Елена Геннадьевна', '02.12.1993'),
(4, 'Плешкун Милана Анатольевна', '08.03.1992'),
(4, 'Буянова Мария Александровна', '02.06.1992'),
(4, 'Харченко Елена Геннадьевна', '11.12.1992'),
(4, 'Крученок Евгений Александрович', '11.05.1992'),
(4, 'Бороховский Виталий Петрович', '09.11.1992'),
(4, 'Мацкевич Надежда Валерьевна', '01.11.1992'),
(5, 'Логинова Мария Вячеславовна', '08.07.1995'),
(5, 'Белько Наталья Николаевна', '02.11.1995'),
(5, 'Селило Екатерина Геннадьевна', '07.05.1995'),
(5, 'Дрозд Анастасия Андреевна', '04.08.1995'),
(6, 'Козловская Елена Евгеньевна', '08.11.1994'),
(6, 'Потапнин Кирилл Олегович', '02.03.1994'),
(6, 'Равковская Ольга Николаевна', '04.06.1994'),
(6, 'Ходоронок Александра Вадимовна', '09.11.1994'),
(6, 'Рамук Владислав Юрьевич', '04.07.1994'),
(7, 'Неруганенок Мария Владимировна', '03.01.1993'),
(7, 'Цыганок Анна Петровна', '12.09.1993'),
(7, 'Масилевич Оксана Игоревна', '12.06.1993'),
(7, 'Алексиевич Елизавета Викторовна', '09.02.1993'),
(7, 'Ватолин Максим Андреевич', '04.07.1993'),
(8, 'Синица Валерия Андреевна', '08.01.1992'),
(8, 'Кудряшова Алина Николаевна', '12.05.1992'),
(8, 'Мигулина Елена Леонидовна', '08.11.1992'),
(8, 'Шпиленя Алексей Сергеевич', '12.03.1992'),
(9, 'Астафьев Игорь Александрович', '10.08.1995'),
(9, 'Гайтюкевич Андрей Игоревич', '02.05.1995'),
(9, 'Рученя Наталья Александровна', '08.01.1995'),
(9, 'Тарасевич Анастасия Ивановна', '11.09.1995'),
(10, 'Жоглин Николай Владимирович', '08.01.1994'),
(10, 'Санько Андрей Дмитриевич', '11.09.1994'),
(10, 'Пещур Анна Александровна', '06.04.1994'),
(10, 'Бучалис Никита Леонидович', '12.08.1994');

INSERT Student (GroupID, [Name], Bday)
VALUES 
(11, 'Лавренчук Владислав Николаевич', '07.11.1993'),
(11, 'Власик Евгения Викторовна', '04.06.1993'),
(11, 'Абрамов Денис Дмитриевич', '10.12.1993'),
(11, 'Оленчик Сергей Николаевич', '04.07.1993'),
(11, 'Савинко Павел Андреевич', '08.01.1993'),
(11, 'Бакун Алексей Викторович', '02.09.1993'),
(12, 'Бань Сергей Анатольевич', '11.12.1995'),
(12, 'Сечейко Илья Александрович', '10.06.1995'),
(12, 'Кузмичева Анна Андреевна', '09.08.1995'),
(12, 'Бурко Диана Францевна', '04.07.1995'),
(12, 'Даниленко Максим Васильевич', '08.03.1995'),
(12, 'Зизюк Ольга Олеговна', '12.09.1995'),
(13, 'Шарапо Мария Владимировна', '08.10.1994'),
(13, 'Касперович Вадим Викторович', '10.02.1994'),
(13, 'Чупрыгин Арсений Александрович', '11.11.1994'),
(13, 'Воеводская Ольга Леонидовна', '10.02.1994'),
(13, 'Метушевский Денис Игоревич', '12.01.1994'),
(14, 'Ловецкая Валерия Александровна', '11.09.1993'),
(14, 'Дворак Антонина Николаевна', '01.12.1993'),
(14, 'Щука Татьяна Николаевна', '09.06.1993'),
(14, 'Коблинец Александра Евгеньевна', '05.01.1993'),
(14, 'Фомичевская Елена Эрнестовна', '01.07.1993'),
(15, 'Бесараб Маргарита Вадимовна', '07.04.1992'),
(15, 'Бадуро Виктория Сергеевна', '10.12.1992'),
(15, 'Тарасенко Ольга Викторовна', '05.05.1992'),
(15, 'Афанасенко Ольга Владимировна', '11.01.1992'),
(15, 'Чуйкевич Ирина Дмитриевна', '04.06.1992'),
(16, 'Брель Алеся Алексеевна', '08.01.1994'),
(16, 'Кузнецова Анастасия Андреевна', '07.02.1994'),
(16, 'Томина Карина Геннадьевна', '12.06.1994'),
(16, 'Дуброва Павел Игоревич', '03.07.1994'),
(16, 'Шпаков Виктор Андреевич', '04.07.1994'),
(17, 'Шнейдер Анастасия Дмитриевна', '08.11.1993'),
(17, 'Шыгина Елена Викторовна', '02.04.1993'),
(17, 'Клюева Анна Ивановна', '03.06.1993'),
(17, 'Доморад Марина Андреевна', '05.11.1993'),
(17, 'Линчук Михаил Александрович', '03.07.1993'),
(18, 'Васильева Дарья Олеговна', '08.01.1995'),
(18, 'Щигельская Екатерина Андреевна', '06.09.1995'),
(18, 'Сазонова Екатерина Дмитриевна', '08.03.1995'),
(18, 'Бакунович Алина Олеговна', '07.08.1995');
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
('ОАиП', 1000, '01.10.2013', 6),
('ОАиП', 1001, '01.10.2013', 8),
('ОАиП', 1002, '01.10.2013', 7),
('ОАиП', 1003, '01.10.2013', 5),
('ОАиП', 1005, '01.10.2013', 4);

INSERT INTO PROGRESS ([Subject], StudentID, [Date], NOTE)
VALUES 
('СУБД', 1014, '01.12.2013', 5),
('СУБД', 1015, '01.12.2013', 9),
('СУБД', 1016, '01.12.2013', 5),
('СУБД', 1017, '01.12.2013', 4);

INSERT INTO PROGRESS ([Subject], StudentID, [Date], NOTE)
VALUES 
('КГ', 1018, '06.05.2013', 4),
('КГ', 1019, '06.05.2013', 7),
('КГ', 1020, '06.05.2013', 7),
('КГ', 1021, '06.05.2013', 9),
('КГ', 1022, '06.05.2013', 5),
('КГ', 1023, '06.05.2013', 6);
GO
use Exercise

CREATE TABLE classroom
(
building varchar (20),
room_number varchar (10),
capacity int check (capacity>0),
primary key (building, room_number)
);


INSERT INTO classroom (building, room_number, capacity) 
VALUES ('Packard', '101', 500),
       ('Painter', '514', 10),
       ('Taylor', '3128', 70),
	   ('Watson', '100', 30),
	   ('Watson', '120', 50)



CREATE TABLE department
(
dept_name varchar (20),
building varchar (15),
budget int check (budget > 0),
primary key (dept_name)
);


INSERT INTO department (dept_name, building, budget) 
VALUES ('Biology', 'Watson', 90000),
       ('Comp. Sci.', 'Taylor', 100000),
       ('Elec. Eng.', 'Taylor', 85000),
	   ('Finance', 'Painter', 120000),
	   ('History', 'Painter', 50000),
	   ('Music', 'Packard', 80000),
       ('Physics', 'Watson', 70000)


CREATE TABLE course
(
course_id varchar (15),
title varchar (30),
dept_name varchar (20),
credits float check (credits > 0 and credits <= 5),
primary key (course_id),
foreign key (dept_name) references department
);


INSERT INTO course (course_id, title, dept_name, credits) 
VALUES ('BIO-101', 'Intro. to Biology', 'Biology', 4),
	   ('BIO-301', 'Genetics', 'Biology', 4),
	   ('BIO-399', 'Computational Biology', 'Biology', 3),
	   ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
	   ('CS-190', 'Game Design', 'Comp. Sci.', 4),
	   ('CS-315', 'Robotics', 'Comp. Sci.', 3),
	   ('CS-319', 'Image Processing', 'Comp. Sci.', 3),
	   ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
       ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
	   ('FIN-201', 'Investment Banking', 'Finance', 3),
	   ('HIS-351', 'World History', 'History', 3),
	   ('MU-199', 'Music Video Production', 'Music', 3),
	   ('PHY-101', 'Physical Principles', 'Physics', 4)




CREATE TABLE prereq
(
course_id varchar(15),
prereq_id varchar(15),
primary key (course_id, prereq_id),
foreign key (course_id) references course,
foreign key (prereq_id) references course
);


INSERT INTO prereq (course_id, prereq_id) 
VALUES ('BIO-301', 'BIO-101'),
	   ('BIO-399', 'BIO-101'),
	   ('CS-190', 'CS-101'),
	   ('CS-315', 'CS-101'),
	   ('CS-319', 'CS-101'),
	   ('CS-347', 'CS-101'),
	   ('EE-181', 'PHY-101')


CREATE TABLE student
(
ID varchar (10),
name varchar (20) ,
dept_name varchar (20),
tot_cred float check (tot_cred >= 0),
primary key (ID),
foreign key (dept_name) references department
);


INSERT INTO student (ID, name, dept_name, tot_cred) 
VALUES ('00128', 'Zhang', 'Comp. Sci.', 102),
	   ('12345', 'Shankar', 'Comp. Sci.', 32),
	   ('19991', 'Brandt', 'History', 80),
	   ('23121', 'Chavez', 'Finance', 110),
	   ('44553', 'Peltier', 'Physics', 56),
	   ('45678', 'Levy', 'Physics', 46),
	   ('54321', 'Williams', 'Comp. Sci.', 54),
	   ('55739', 'Sanchez', 'Music', 38),
	   ('70557', 'Snow', 'Physics', 0),
	   ('76543', 'Brown', 'Comp. Sci.', 58),
	   ('76653', 'Aoi', 'Elec. Eng.', 60),
	   ('98765', 'Bourikas', 'Elec. Eng.', 98),
	   ('98988', 'Tanaka', 'Biology', 120)



CREATE TABLE instructor
(
ID varchar (10),
name varchar (20),
dept_name varchar (20),
salary int check (salary > 30000),
primary key (ID),
foreign key (dept_name) references department
);

INSERT INTO instructor (ID, name, dept_name, salary) 
VALUES ('10101', 'Srinivasan', 'Comp. Sci.', 65000),
	   ('12121', 'Wu', 'Finance', 90000),
	   ('15151', 'Mozart', 'Music', 40000),
	   ('22222', 'Einstein', 'Physics', 95000),
	   ('32343', 'El Said', 'History', 60000),
	   ('33456', 'Gold', 'Physics', 87000),
	   ('45565', 'Katz', 'Comp. Sci.', 75000),
	   ('58583', 'Califieri', 'History', 62000),
	   ('76543', 'Singh', 'Finance', 80000),
	   ('76766', 'Crick', 'Biology', 72000),
	   ('83821', 'Brandt', 'Comp. Sci.', 92000),
	   ('98345', 'Kim', 'Elec. Eng.', 80000)


CREATE TABLE advisor
(
s_ID varchar (10),
i_ID varchar (10),
primary key (s_ID),
foreign key (i_ID) references instructor (ID),
foreign key (s_ID) references student (ID)
);

INSERT INTO advisor (s_ID, i_ID) 
VALUES ('00128', '45565'),
	   ('12345', '10101'),
	   ('23121', '76543'),
	   ('44553', '22222'),
	   ('45678', '22222'),
	   ('76543', '45565'),
	   ('76653', '98345'),
	   ('98765', '98345'),
       ('98988', '76766')


CREATE TABLE timeslot
(
time_slot_id varchar (4),
day varchar (1) check (day in ('M', 'T', 'W', 'R', 'F', 'S', 'U')),
start_time time,
end_time time,
primary key (time_slot_id, day, start_time)
);

INSERT INTO timeslot (time_slot_id, day, start_time, end_time) 
VALUES ('A', 'M', '8:00', '8:50'),
	   ('A', 'W', '8:00', '8:50'),
	   ('A', 'F', '8:00', '8:50'),
	   ('B', 'M', '9:00', '9:50'),
	   ('B', 'W', '9:00', '9:50'),
	   ('B', 'F', '9:00', '9:50'),
	   ('C', 'M', '11:00', '11:50'),
	   ('C', 'W', '11:00', '11:50'),
	   ('C', 'F', '11:00', '11:50'),
	   ('D', 'M', '13:00', '13:50'),
	   ('D', 'W', '13:00', '13:50'),
	   ('D', 'F', '13:00', '13:50'),
	   ('E', 'T', '10:30', '11:45'),
	   ('E', 'R', '10:30', '11:45'),
	   ('F', 'T', '14:30', '15:45'),
	   ('F', 'R', '14:30', '15:45'),
	   ('G', 'M', '16:00', '16:50'),
	   ('G', 'W', '16:00', '16:50'),
	   ('G', 'F', '16:00', '16:50'),
	   ('H', 'W', '10:00', '12:30')


CREATE TABLE section
(
course_id varchar (15),
sec_id varchar (8),
semester varchar (6) check (semester in ('Fall', 'Winter', 'Spring', 'Summer')),
year int check (year > 1701 and year < 2100),
building varchar (20),
room_number varchar (10),
time_slot_id varchar (4),
primary key (course_id, sec_id, semester, year),
foreign key (course_id) references course,
foreign key (building, room_number) references classroom
);

INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) 
VALUES ('BIO-101', '1', 'Summer', 2009, 'Painter', '514', 'B'),
	   ('BIO-301', '1', 'Summer', 2010, 'Painter', '514', 'A'),
	   ('CS-101', '1', 'Fall', 2009, 'Packard', '101', 'H'),
	   ('CS-101', '1', 'Spring', 2010, 'Packard', '101', 'F'),
	   ('CS-190', '1', 'Spring', 2009, 'Taylor', '3128', 'E'),
	   ('CS-190', '2', 'Spring', 2009, 'Taylor', '3128', 'A'),
	   ('CS-315', '1', 'Spring', 2010, 'Watson', '120', 'D'),
	   ('CS-319', '1', 'Spring', 2010, 'Watson', '100', 'B'),
	   ('CS-319', '2', 'Spring', 2010, 'Taylor', '3128', 'C'),
	   ('CS-347', '1', 'Fall', 2009, 'Taylor', '3128', 'A'),
	   ('EE-181', '1', 'Spring', 2009, 'Taylor', '3128', 'C'),
	   ('FIN-201', '1', 'Spring', 2010, 'Packard', '101', 'B'),
	   ('HIS-351', '1', 'Spring', 2010, 'Painter', '514', 'C'),
	   ('MU-199', '1', 'Spring', 2010, 'Packard', '101', 'D'),
	   ('PHY-101', '1', 'Fall', 2009, 'Watson', '100', 'A')




CREATE TABLE teaches
(
ID varchar (10),
course_id varchar (15),
sec_id varchar (8),
semester varchar (6),
year int,
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section
on delete cascade,
foreign key (ID) references instructor
on delete cascade
);

INSERT INTO teaches (ID, course_id, sec_id, semester, year) 
VALUES ('10101', 'CS-101', '1', 'Fall', 2009),
	   ('10101', 'CS-315', '1', 'Spring', 2010),
	   ('10101', 'CS-347', '1', 'Fall', 2009),
	   ('12121', 'FIN-201', '1', 'Spring', 2010),
	   ('15151', 'MU-199', '1', 'Spring', 2010),
	   ('22222', 'PHY-101', '1', 'Fall', 2009),
	   ('32343', 'HIS-351', '1', 'Spring', 2010),
	   ('45565', 'CS-101', '1', 'Spring', 2010),
	   ('45565', 'CS-319', '1', 'Spring', 2010),
	   ('76766', 'BIO-101', '1', 'Summer', 2009),
	   ('76766', 'BIO-301', '1', 'Summer', 2010),
	   ('83821', 'CS-190', '1', 'Spring', 2009),
	   ('83821', 'CS-190', '2', 'Spring', 2009),
	   ('83821', 'CS-319', '2', 'Spring', 2010),
	   ('98345', 'EE-181', '1', 'Spring', 2009)



CREATE TABLE takes
(
ID varchar (10),
course_id varchar (15),
sec_id varchar (8),
semester varchar (6),
year int,
grade varchar (2),
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section
on delete cascade,
foreign key (ID) references student
on delete cascade
);

INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) 
VALUES ('00128', 'CS-101', '1', 'Fall', 2009, 'A'),
	   ('00128', 'CS-347', '1', 'Fall', 2009, 'A-'),
	   ('12345', 'CS-101', '1', 'Fall', 2009, 'C'),
	   ('12345', 'CS-190', '2', 'Spring', 2009, 'A'),
	   ('12345', 'CS-315', '1', 'Spring', 2010, 'A'),
	   ('12345', 'CS-347', '1', 'Fall', 2009, 'A'),
	   ('19991', 'HIS-351', '1', 'Spring', 2010, 'B'),
	   ('23121', 'FIN-201', '1', 'Spring', 2010, 'C+'),
	   ('44553', 'PHY-101', '1', 'Fall', 2009, 'B-'),
	   ('45678', 'CS-101', '1', 'Fall', 2009, 'F'),
	   ('45678', 'CS-101', '1', 'Spring', 2010, 'B+'),
	   ('45678', 'CS-319', '1', 'Spring', 2010, 'B'),
	   ('54321', 'CS-101', '1', 'Fall', 2009, 'A-'),
	   ('54321', 'CS-190', '2', 'Spring', 2009, 'B+'),
	   ('55739', 'MU-199', '1', 'Spring', 2010, 'A-'),
	   ('76543', 'CS-101', '1', 'Fall', 2009, 'A'),
	   ('76543', 'CS-319', '2', 'Spring', 2010, 'A'),
	   ('76653', 'EE-181', '1', 'Spring', 2009, 'C'),
	   ('98765', 'CS-101', '1', 'Fall', 2009, 'C-'),
	   ('98765', 'CS-315', '1', 'Spring', 2010, 'B'),
	   ('98988', 'BIO-101', '1', 'Summer', 2009, 'A'),
	   ('98988', 'BIO-301', '1', 'Summer', 2010, null)






--6
select distinct t.name from instructor as t inner join instructor as s
on t.salary > (Select MIN(ss.salary) from instructor as ss where ss.dept_name = 'biology')


--11
select  i.name, t.course_id, c.title from instructor as i inner join teaches as t
 on (i.dept_name = 'Biology' and t.ID = i.ID) inner join course as c on 
 c.course_id = t.course_id




--12
select c.title from course as c inner join teaches as t
on t.course_id = c.course_id where (t.year='2009' and t.semester = 'Fall')


--pdf answer
select course.title from course
inner join section on section.course_id = course.course_id
where (section.semester = 'fall' and section.year = 2009) 


--also works
select distinct course.course_id from course
inner join section on section.course_id = course.course_id
where (section.semester = 'fall' and section.year = 2009) OR ((section.semester = 'Spring' and section.year = 2010))


--13
(select c.course_id from course as c inner join teaches as t
on t.course_id = c.course_id where (t.year='2009' and t.semester = 'Fall'))
union
(select c.course_id from course as c inner join teaches as t
on t.course_id = c.course_id where (t.year='2010' and t.semester = 'Spring'))


--pdf answer
(select course_id from section where semester = 'fall' and year= 2009)
union
(select course_id from section where semester = 'spring' and year= 2010);


--14
select s1.course_id from section as s1 inner join section as s2
on s1.course_id = s2.course_id 
where (s1.semester = 'Fall' and s1.year='2009') and 
(s2.semester = 'Spring' and s2.year='2010')


(select course_id from section where semester = 'fall' and year= 2009)
intersect
(select course_id from section where semester = 'spring' and year= 2010)



--15
select distinct s1.course_id from section as s1 inner join section as s2
on s1.course_id != s2.course_id 
where (s1.semester = 'Fall' and s1.year='2009') and 
(s2.semester = 'Spring' and s2.year='2010')


(select course_id from section where semester = 'fall' and year= 2009)
except
(select course_id from section where semester = 'spring' and year= 2010)





--18
-- i think wrong answer in pdf because one instructor may have more than one courses
-- and according to the pdf solution, if one instructor is teaching more than one 
--courses, it might show a wrong result



--18
SELECT COUNT (DISTINCT course_id) from teaches where semester = 'spring' and year = '2010'

--20

-- my solution
select c.dept_name, COUNT(c.course_id) from course as c inner join teaches as t
on c.course_id = t.course_id
where (t.semester = 'spring' and t.year = '2010') group by c.dept_name

-- pdf solution
select dept_name, count (distinct instructor.id) as instr_count
from instructor inner join teaches on instructor.ID = teaches.ID
where semester = 'spring' and year = 2010 group by dept_name


--21
SELECT dept_name, AVG(Salary) FROM instructor GROUP BY dept_name HAVING AVG(Salary) >= 42000



--22


--23
SELECT s1.course_id from section as s1 inner join section as s2
on s1.course_id = s2.course_id 
where ((s1.year = '2009' and s1.semester='Fall')
and (s2.year = '2010' and s2.semester='Spring'))

-- pdf solution of this is wrong, doesn't match with question


--24
SELECT s1.course_id from section as s1 inner join section as s2
on s1.course_id = s2.course_id 
where ((s1.year = '2009' and s1.semester='Fall')
and (s2.year != '2010' and s2.semester!='Spring'))

select s1.course_id from section as s1 where (s1.year = '2009' and s1.semester='Fall')

--pdf solution
(select course_id from section where semester = 'fall' and year= 2009)
except
(select course_id from section where semester = 'spring' and year= 2010)


SELECT name from instructor where NAME NOT IN ('MOZART','EINSTEIN')


--26
select count(distinct took.id) from takes as took inner join teaches as teach
on teach.course_id = took.course_id 
where ( (teach.semester = took.semester)
and (teach.year= took.year)
)

select distinct teach.course_id, teach.ID,took.ID,teach.year,took.semester from takes as took inner join teaches as teach
on teach.course_id = took.course_id 
where ( (teach.semester = took.semester)
and (teach.year= took.year)
)

--pdf soluition shows error
select count (distinct id) from takes
where (course_id, sec_id, semester, year) in (select course_id, sec_id, semester, year
from teaches where teaches.id= 10101)





---27
select distinct t.id, t.name from instructor as t, instructor as s
where t.salary > s.salary and s.dept_name = 'history';


select name from instructor where salary > ANY (select salary from instructor
where dept_name = 'history');



--31
select distinct takes.ID from takes Inner join course 
on course.course_id = takes.course_id 
where course.dept_name like '%bio%'


--31
select distinct student.name, takes.ID from takes Inner join course 
on course.course_id = takes.course_id 
Inner join student on student.ID = takes.ID 
where course.dept_name like '%bio%'



--37
select student.id from student 
inner join takes on student.id = takes.id
inner join section on takes.course_id = section.course_id
where building = 'watson'


select  i.name, t.course_id, c.title from instructor as i inner join teaches as t
on (i.dept_name = 'Biology' and t.ID = i.ID) inner join course as c on 
c.course_id = t.course_id


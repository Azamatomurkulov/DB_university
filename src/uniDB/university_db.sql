create database university_db;

CREATE TABLE public.student
(
    id integer NOT NULL,
    student_name character varying NOT NULL,
    group_id integer,
    date_of_birth integer,
    PRIMARY KEY (id)
);

CREATE TABLE public."group"
(
    id integer NOT NULL,
    faculty_id integer,
    group_code character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public.faculty
(
    id integer NOT NULL,
    faculty_name character varying,
    university_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.university
(
    id integer NOT NULL,
    university_name character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public.subject
(
    id integer NOT NULL,
    subject_name character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public.grade
(
    id integer NOT NULL,
    student_id integer,
    grade integer,
    subject_id integer,
    PRIMARY KEY (id)
);

alter table student
    add foreign key (group_id)
        references public.group(id);

alter table public.group
    add foreign key (faculty_id)
        references faculty(id);

alter table public.group
    add foreign key (faculty_id)
        references faculty(id);

alter table grade
    add foreign key (student_id)
        references student(id);

alter table grade
    add foreign key (subject_id)
        references subject(id);

insert into university
values (1,'KRSU');

insert into university
values (2,'AUCA');

insert into faculty
values (1,'Information Technologies',1);

insert into faculty
values (2,'Architecture',1);

insert into faculty
values (3,'Machine Learning',2);

insert into "group"
values (1,1,'IT23');

insert into "group"
values (2,2,'AR22');

insert into "group"
values (3,3,'ML22');

insert into student
values (1,'Jack',1,22.1990);

insert into student
values (2,'Nick',2,1989);

insert into student
values (3,'Louis',3,1992);

insert into subject
values (1,'Python');

insert into subject
values (2,'Design');

select avg(grade) as Average_grade from grade
where student_id = 2;

insert into grade
values (1,1,90,1);

insert into grade
values (2,2,60,2);

insert into grade
values (3,3,73,1);

insert into grade
values (4,2,89,1);

select avg(grade) as Average_grade from grade
where student_id = 2;


select student.student_name, "group".group_code,faculty.faculty_name,university.university_name
from student
         join "group" on student.group_id = "group".id
         join faculty on "group".faculty_id = faculty.id
         join university on faculty.university_id = university.id;
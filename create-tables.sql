drop table if exists groups;

create table groups (
  id serial primary key,
  name Varchar(50) not null
);

drop table if exists students;
create table students (
  id serial primary key,
  fullname Varchar(150) not null,
  group_id integer references groups(id)
    on delete cascade
);

drop table if exists teachers;
create table teachers (
  id serial primary key,
  fullname Varchar(150) not null
);

drop table if exists subjects;
create table subjects (
  id serial primary key,
  name Varchar(175) not null,
  teacher_id integer references teachers(id)
    on delete cascade
);

drop table if exists grades;
create table grades (
  id serial primary key,
  student_id integer references students(id)
    on delete cascade,
  subject_id integer references subjects(id)
    on delete cascade,
  grade integer check (grade >= 0 and grade <= 100),
  grade_date date not null
);
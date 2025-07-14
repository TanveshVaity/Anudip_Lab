-- Create a new database
mysql> create database lab3;
Query OK, 1 row affected (0.07 sec)

-- Switch to the lab3 database
mysql> use lab3;
Database changed

-- Create the student table
mysql> create table student( 
    stud_id varchar(10) primary key, 
    first_name varchar(20) not null, 
    last_name varchar(20) not null
    );
Query OK, 0 rows affected (0.17 sec)

--describe structure of student table
mysql> desc student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| stud_id    | varchar(10) | NO   | PRI | NULL    |       |
| first_name | varchar(20) | NO   |     | NULL    |       |
| last_name  | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

-- Create the enrollment table
mysql> create table enrollment( 
    enrollment_id varchar(10) not null, 
    course_id varchar(10) not null, 
    stud_id varchar(10) not null, 
    course_name varchar(30) not null, 
    primary key(enrollment_id), 
    foreign key(stud_id) references student(stud_id)
    );
Query OK, 0 rows affected (0.05 sec)

--describe structure of enrollment table
mysql> desc enrollment;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| enrollment_id | varchar(10) | NO   | PRI | NULL    |       |
| course_id     | varchar(10) | NO   |     | NULL    |       |
| stud_id       | varchar(10) | NO   | MUL | NULL    |       |
| course_name   | varchar(30) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

-- Insert records into student table
mysql> INSERT INTO Student (stud_id, first_name, last_name) VALUES 
    ('S1', 'Aarav', 'Sharma'), 
    ('S2', 'Priya', 'Verma'), 
    ('S3', 'Raj', 'Iyer'), 
    ('S4', 'Sneha', 'Reddy');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

-- Retrieve all records from the student table
mysql> select * from student;
+---------+------------+-----------+
| stud_id | first_name | last_name |
+---------+------------+-----------+
| S1      | Aarav      | Sharma    |
| S2      | Priya      | Verma     |
| S3      | Raj        | Iyer      |
| S4      | Sneha      | Reddy     |
+---------+------------+-----------+
4 rows in set (0.00 sec)

-- Insert records into enrollment table
mysql> INSERT INTO Enrollment (enrollment_id, course_id, stud_id, course_name) VALUES 
    ('E201', 'CS101', 'S1', 'Programming'), 
    ('E202', 'CS102', 'S1', 'Data Structures'), 
    ('E203', 'CS101', 'S2', 'Programming'), 
    ('E204', 'CS103', 'S2', 'Computer Networks'), 
    ('E205', 'CS102', 'S3', 'Data Structures'), 
    ('E206', 'CS104', 'S4', 'Operating Systems');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

-- Retrieve all records from the enrollment table
mysql> select * from enrollment;
+---------------+-----------+---------+-----------------------------+
| enrollment_id | course_id | stud_id | course_name                 |
+---------------+-----------+---------+-----------------------------+
| E201          | CS101     | S1      | Programming                 |
| E202          | CS102     | S1      | Data Structures             |
| E203          | CS101     | S2      | Programming                 |
| E204          | CS103     | S2      | Computer Networks           |
| E205          | CS102     | S3      | Data Structures             |
| E206          | CS104     | S4      | Operating Systems           |
+---------------+-----------+---------+-----------------------------+
6 rows in set (0.00 sec)

-- Perform an INNER JOIN between student and enrollment to get full details of students along with their enrollment records
mysql> select s.stud_id, s.first_name, s.last_name, e.enrollment_id, e.course_id, e.course_name from student s 
    join enrollment e 
    on s.stud_id = e.stud_id;
+---------+------------+-----------+---------------+-----------+-----------------------------+
| stud_id | first_name | last_name | enrollment_id | course_id | course_name                 |
+---------+------------+-----------+---------------+-----------+-----------------------------+
| S1      | Aarav      | Sharma    | E201          | CS101     | Programming                 |
| S1      | Aarav      | Sharma    | E202          | CS102     | Data Structures             |
| S2      | Priya      | Verma     | E203          | CS101     | Programming                 |
| S2      | Priya      | Verma     | E204          | CS103     | Computer Networks           |
| S3      | Raj        | Iyer      | E205          | CS102     | Data Structures             |
| S4      | Sneha      | Reddy     | E206          | CS104     | Operating Systems           |
+---------+------------+-----------+---------------+-----------+-----------------------------+
6 rows in set (0.00 sec)
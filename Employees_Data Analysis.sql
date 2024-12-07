CREATE DATABASE EMPLOYEES;
USE EMPLOYEES;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)   ,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
) ; 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) ;


INSERT INTO `departments` VALUES 
('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development'),
('d006','Quality Management'),
('d007','Sales'),
('d008','Research'),
('d009','Customer Service');

INSERT INTO `dept_emp` VALUES (10001,'d005','1986-06-26','9999-01-01'),
(10002,'d007','1996-08-03','9999-01-01'),
(10003,'d004','1995-12-03','9999-01-01'),
(10004,'d004','1986-12-01','9999-01-01'),
(10005,'d003','1989-09-12','9999-01-01'),
(10006,'d005','1990-08-05','9999-01-01'),
(10007,'d008','1989-02-10','9999-01-01'),
(10008,'d005','1998-03-11','2000-07-31'),
(10009,'d006','1985-02-18','9999-01-01'),
(10010,'d004','1996-11-24','2000-06-26'),
(10010,'d006','2000-06-26','9999-01-01'),
(10011,'d009','1990-01-22','1996-11-09'),
(10012,'d005','1992-12-18','9999-01-01'),
(10013,'d003','1985-10-20','9999-01-01'),
(10014,'d005','1993-12-29','9999-01-01'),
(10015,'d008','1992-09-19','1993-08-22'),
(10016,'d007','1998-02-11','9999-01-01'),
(10017,'d001','1993-08-03','9999-01-01'),
(10018,'d004','1992-07-29','9999-01-01'),
(10018,'d005','1987-04-03','1992-07-29'),
(10019,'d008','1999-04-30','9999-01-01'),
(10020,'d004','1997-12-30','9999-01-01'),
(10021,'d005','1988-02-10','2002-07-15'),
(10022,'d005','1999-09-03','9999-01-01'),
(10023,'d005','1999-09-27','9999-01-01'),
(10024,'d004','1998-06-14','9999-01-01'),
(10025,'d005','1987-08-17','1997-10-15'),
(10026,'d004','1995-03-20','9999-01-01'),
(10027,'d005','1995-04-02','9999-01-01'),
(10028,'d005','1991-10-22','1998-04-06'),
(10029,'d004','1991-09-18','1999-07-08'),
(10029,'d006','1999-07-08','9999-01-01');

INSERT INTO `dept_manager` VALUES 
(110022,'d001','1985-01-01','1991-10-01'),
(110039,'d001','1991-10-01','9999-01-01'),
(110085,'d002','1985-01-01','1989-12-17'),
(110114,'d002','1989-12-17','9999-01-01'),
(110183,'d003','1985-01-01','1992-03-21'),
(110228,'d003','1992-03-21','9999-01-01'),
(110303,'d004','1985-01-01','1988-09-09'),
(110344,'d004','1988-09-09','1992-08-02'),
(110386,'d004','1992-08-02','1996-08-30'),
(110420,'d004','1996-08-30','9999-01-01'),
(110511,'d005','1985-01-01','1992-04-25'),
(110567,'d005','1992-04-25','9999-01-01'),
(110725,'d006','1985-01-01','1989-05-06'),
(110765,'d006','1989-05-06','1991-09-12'),
(110800,'d006','1991-09-12','1994-06-28'),
(110854,'d006','1994-06-28','9999-01-01'),
(111035,'d007','1985-01-01','1991-03-07'),
(111133,'d007','1991-03-07','9999-01-01'),
(111400,'d008','1985-01-01','1991-04-08'),
(111534,'d008','1991-04-08','9999-01-01'),
(111692,'d009','1985-01-01','1988-10-17'),
(111784,'d009','1988-10-17','1992-09-08'),
(111877,'d009','1992-09-08','1996-01-03'),
(111939,'d009','1996-01-03','9999-01-01');

INSERT INTO `employees` VALUES (10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),
(10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
(10003,'1959-12-03','Parto','Bamford','M','1986-08-28'),
(10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01'),
(10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
(10006,'1953-04-20','Anneke','Preusig','F','1989-06-02'),
(10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10'),
(10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15'),
(10009,'1952-04-19','Sumant','Peac','F','1985-02-18'),
(10010,'1963-06-01','Duangkaew','Piveteau','F','1989-08-24'),
(10011,'1953-11-07','Mary','Sluis','F','1990-01-22'),
(10012,'1960-10-04','Patricio','Bridgland','M','1992-12-18'),
(10013,'1963-06-07','Eberhardt','Terkki','M','1985-10-20'),
(10014,'1956-02-12','Berni','Genin','M','1987-03-11'),
(10015,'1959-08-19','Guoxiang','Nooteboom','M','1987-07-02'),
(10016,'1961-05-02','Kazuhito','Cappelletti','M','1995-01-27'),
(10017,'1958-07-06','Cristinel','Bouloucos','F','1993-08-03'),
(10018,'1954-06-19','Kazuhide','Peha','F','1987-04-03'),
(10019,'1953-01-23','Lillian','Haddadi','M','1999-04-30'),
(10020,'1952-12-24','Mayuko','Warwick','M','1991-01-26'),
(10021,'1960-02-20','Ramzi','Erde','M','1988-02-10'),
(10022,'1952-07-08','Shahaf','Famili','M','1995-08-22'),
(10023,'1953-09-29','Bojan','Montemayor','F','1989-12-17'),
(10024,'1958-09-05','Suzette','Pettey','F','1997-05-19'),
(10025,'1958-10-31','Prasadram','Heyers','M','1987-08-17'),
(10026,'1953-04-03','Yongqiao','Berztiss','M','1995-03-20'),
(10027,'1962-07-10','Divier','Reistad','F','1989-07-07'),
(10028,'1963-11-26','Domenick','Tempesti','M','1991-10-22'),
(10029,'1956-12-13','Otmar','Herbst','M','1985-11-20'),
(10030,'1958-07-14','Elvis','Demeyer','M','1994-02-17');

INSERT INTO `salaries` VALUES (10001,60117,'1986-06-26','1987-06-26'),
(10001,62102,'1987-06-26','1988-06-25'),
(10001,66074,'1988-06-25','1989-06-25'),
(10001,66596,'1989-06-25','1990-06-25'),
(10001,66961,'1990-06-25','1991-06-25'),
(10001,71046,'1991-06-25','1992-06-24'),
(10001,74333,'1992-06-24','1993-06-24'),
(10001,75286,'1993-06-24','1994-06-24'),
(10001,75994,'1994-06-24','1995-06-24'),
(10001,76884,'1995-06-24','1996-06-23'),
(10001,80013,'1996-06-23','1997-06-23'),
(10001,81025,'1997-06-23','1998-06-23'),
(10001,81097,'1998-06-23','1999-06-23'),
(10001,84917,'1999-06-23','2000-06-22'),
(10001,85112,'2000-06-22','2001-06-22'),
(10001,85097,'2001-06-22','2002-06-22'),
(10001,88958,'2002-06-22','9999-01-01'),
(10002,65828,'1996-08-03','1997-08-03'),
(10002,65909,'1997-08-03','1998-08-03'),
(10002,67534,'1998-08-03','1999-08-03'),
(10002,69366,'1999-08-03','2000-08-02'),
(10002,71963,'2000-08-02','2001-08-02'),
(10002,72527,'2001-08-02','9999-01-01'),
(10003,40006,'1995-12-03','1996-12-02'),
(10003,43616,'1996-12-02','1997-12-02'),
(10003,43466,'1997-12-02','1998-12-02'),
(10003,43636,'1998-12-02','1999-12-02'),
(10003,43478,'1999-12-02','2000-12-01'),
(10003,43699,'2000-12-01','2001-12-01'),
(10003,43311,'2001-12-01','9999-01-01'),
(10004,40054,'1986-12-01','1987-12-01'),
(10004,42283,'1987-12-01','1988-11-30'),
(10004,42542,'1988-11-30','1989-11-30'),
(10004,46065,'1989-11-30','1990-11-30'),
(10004,48271,'1990-11-30','1991-11-30'),
(10004,50594,'1991-11-30','1992-11-29'),
(10004,52119,'1992-11-29','1993-11-29');

INSERT INTO titles VALUES (10001,'Senior Engineer','1986-06-26','9999-01-01'),
(10002,'Staff','1996-08-03','9999-01-01'),
(10003,'Senior Engineer','1995-12-03','9999-01-01'),
(10004,'Engineer','1986-12-01','1995-12-01'),
(10004,'Senior Engineer','1995-12-01','9999-01-01'),
(10005,'Senior Staff','1996-09-12','9999-01-01'),
(10005,'Staff','1989-09-12','1996-09-12'),
(10006,'Senior Engineer','1990-08-05','9999-01-01'),
(10007,'Senior Staff','1996-02-11','9999-01-01'),
(10007,'Staff','1989-02-10','1996-02-11'),
(10008,'Assistant Engineer','1998-03-11','2000-07-31'),
(10009,'Assistant Engineer','1985-02-18','1990-02-18'),
(10009,'Engineer','1990-02-18','1995-02-18'),
(10009,'Senior Engineer','1995-02-18','9999-01-01'),
(10010,'Engineer','1996-11-24','9999-01-01'),
(10011,'Staff','1990-01-22','1996-11-09'),
(10012,'Engineer','1992-12-18','2000-12-18'),
(10012,'Senior Engineer','2000-12-18','9999-01-01'),
(10013,'Senior Staff','1985-10-20','9999-01-01'),
(10014,'Engineer','1993-12-29','9999-01-01'),
(10015,'Senior Staff','1992-09-19','1993-08-22'),
(10016,'Staff','1998-02-11','9999-01-01'),
(10017,'Senior Staff','2000-08-03','9999-01-01'),
(10017,'Staff','1993-08-03','2000-08-03'),
(10018,'Engineer','1987-04-03','1995-04-03'),
(10018,'Senior Engineer','1995-04-03','9999-01-01'),
(10019,'Staff','1999-04-30','9999-01-01'),
(10020,'Engineer','1997-12-30','9999-01-01'),
(10021,'Technique Leader','1988-02-10','2002-07-15'),
(10022,'Engineer','1999-09-03','9999-01-01'),
(10023,'Engineer','1999-09-27','9999-01-01'),
(10024,'Assistant Engineer','1998-06-14','9999-01-01'),
(10025,'Technique Leader','1987-08-17','1997-10-15'),
(10026,'Engineer','1995-03-20','2001-03-19'),
(10026,'Senior Engineer','2001-03-19','9999-01-01'),
(10027,'Engineer','1995-04-02','2001-04-01'),
(10027,'Senior Engineer','2001-04-01','9999-01-01'),
(10028,'Engineer','1991-10-22','1998-04-06'),
(10029,'Engineer','1991-09-18','2000-09-17'),
(10029,'Senior Engineer','2000-09-17','9999-01-01'),
(10030,'Engineer','1994-02-17','2001-02-17'),
(10030,'Senior Engineer','2001-02-17','9999-01-01');



SELECT * FROM employees;

-- 1. List of Employees by Department
-- Question: Write a query to list all employees along with their respective department names. Include employee number, first name, last name, department number, and department name.

SELECT e.emp_no,e.first_name,e.last_name,d.dept_no,d.dept_name FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no;



-- 2. Current and Past Salaries of an Employee
-- Question: Write a query to retrieve all the salary records of a given employee (by employee number). Include employee number, salary, from_date, and to_date.

SELECT * FROM salaries
WHERE emp_no = '10003' order by salary desc 
LIMIT 1;



-- 3. Employees with Specific Titles
-- Question: Write a query to find all employees who have held a specific title (e.g., 'Engineer'). Include employee number, first name, last name, and title.

SELECT e.emp_no,first_name,last_name,title FROM employees as e
JOIN titles  as t
ON e.emp_no = t.emp_no 
where t.title = 'Engineer';



-- 4. Departments with Their Managers
-- Question: Write a query to list all departments along with their current managers. Include department number, department name, manager's employee number, first name, and last name.

SELECT d.dept_no,d.dept_name,e.emp_no,e.first_name,e.last_name FROM departments as d
JOIN dept_manager as dm 
ON d.dept_no = dm.dept_no
JOIN employees as e 
ON e.emp_no = dm.emp_no;



-- 5. Employee Count by Department
-- Question: Write a query to count the number of employees in each department. Include department number, department name, and employee count.

SELECT d.dept_no,dept_name,count(de.emp_no) as emp_count FROM departments as d 
JOIN dept_emp as de 
ON d.dept_no = de.dept_no
GROUP BY dept_no,dept_name;



--  6. Employees' Birthdates in a Given Year
-- Question: Write a query to find all employees born in a specific year (e.g., 1953). Include employee number, first name, last name, and birth date.

SELECT emp_no,first_name,last_name,birth_date FROM employees
WHERE year(birth_date) = 1953;



-- 7. Employees Hired in the Last 5 Years
-- Question: Write a query to find all employees hired in the last 50 years. Include employee number, first name, last name, and hire date.

SELECT emp_no,first_name,last_name,hire_date FROM employees
WHERE hire_date >= date_sub(curdate(),INTERVAL 50 YEAR);




-- 8. Average Salary by Department
-- Question: Write a query to calculate the average salary for each department. Include department number, department name, and average salary.

SELECT d.dept_no,d.dept_name,avg(s.salary)  as avg_salary FROM departments as d
JOIN dept_emp as de
ON de.dept_no = d.dept_no
JOIN salaries as s ON de.emp_no = s.emp_no
GROUP BY d.dept_no,d.dept_name;




-- 9.Gender Distribution in Each Department
-- Question: Write a query to find the gender distribution (number of males and females) in each department. Include department number, department name, count of males, and count of females.


SELECT d.dept_no,d.dept_name,
SUM(CASE when e.gender = 'M' THEN 1 ELSE 0 END ) as male_count,
 SUM(CASE when e.gender = 'F' THEN 1 ELSE 0 END ) as female_count
 FROM  departments as d
JOIN dept_emp as de ON de.dept_no = d.dept_no
JOIN employees as e on de.emp_no = e.emp_no
GROUP by d.dept_no,d.dept_name;



-- 10. Longest Serving Employees
-- Question: Write a query to find the employees who have served the longest in the company. Include employee number, first name, last name, and number of years served.

SELECT emp_no,first_name,last_name,
timestampdiff(YEAR,hire_date,CUrdate()) as year_served
 FROM employees
 ORDER By year_served desc
 LIMIT 10;
 
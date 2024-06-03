--DROP DATABASES TO RUN AGAIN
--DROP TABLE IF EXISTS departments;
--DROP TABLE IF EXISTS  dept_emp;
--DROP TABLE IF EXISTS  dept_manager;
--DROP TABLE IF EXISTS  employees;
--DROP TABLE IF EXISTS  salaries;
--DROP TABLE IF EXISTS  titles;
--ROLLBACK

--CREATE TABLES
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


# sql_challenge

Homework 9
Inside Starter Code 

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


--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/13';

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT (first_name, last_name, sex) 
FROM employees
WHERE first_name LIKE 'Hercules' 
AND last_name LIKE 'B%'; 

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT (salary,salaries.emp_no,first_name,last_name,sex) 
FROM salaries 
LEFT JOIN employees 
ON (salaries.emp_no = employees.emp_no)

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT (employees.emp_no,employees.first_name,employees.last_name, dept_manager.dept_no, departments.dept_name) 
FROM employees
INNER JOIN dept_manager
ON (dept_manager.emp_no = employees.emp_no)
JOIN departments
ON (dept_manager.dept_no = departments.dept_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT (employees.emp_no,employees.first_name,employees.last_name, dept_emp.dept_no, departments.dept_name) 
FROM employees
INNER JOIN dept_emp
ON (dept_emp.emp_no = employees.emp_no)
JOIN departments
ON (dept_emp.dept_no = departments.dept_no);

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT (employees.emp_no,employees.first_name,employees.last_name) 
FROM employees
INNER JOIN dept_emp
ON (dept_emp.emp_no = employees.emp_no)
WHERE dept_emp.dept_no LIKE 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT (employees.emp_no,employees.first_name,employees.last_name, dept_emp.dept_no, departments.dept_name) 
FROM employees
INNER JOIN dept_emp
ON (dept_emp.emp_no = employees.emp_no)
JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE'Development';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT COUNT(last_name) AS frequency, last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;




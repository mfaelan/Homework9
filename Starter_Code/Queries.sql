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


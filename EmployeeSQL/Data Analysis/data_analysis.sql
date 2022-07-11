--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp_no,last_name, first_name, sex, salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.sal_emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE TO_DATE(employees.hire_date,'MM/DD/YYYY') >= '1986-01-01'
AND TO_DATE(employees.hire_date,'MM/DD/YYYY') <= '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT e.last_name AS "Last Name", e.first_name AS "First Name", e.emp_no AS "Employee Number", dm.dept_no AS "Department Number", d.dept_name AS "Department Name"
FROM Employees AS e
INNER JOIN dept_managers AS dm
ON e.emp_no=dm.emp_no
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM Employees AS e
INNER JOIN Dept_Employees AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM Employees AS e
INNER JOIN Dept_Employees AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM Employees AS e
INNER JOIN Dept_Employees AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;


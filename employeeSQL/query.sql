-- salaries by employees
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

SELECT * FROM employees;

-- employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- managers of each dept.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name
FROM dept_manager
INNER JOIN employees ON
employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON
departments.dept_no=dept_manager.dept_no;

-- dept of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no;

--employees who's first name is "hercules" and the last names begin with "b"
SELECT first_name, last_name, sex, birth_date
FROM employees
WHERE first_name = 'Hercules' AND
last_name LIKE 'B%';

--employees in the sales dept.
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--employees in sales and development
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--employees grouped by last name
SELECT last_name,
COUNT (last_name)
FROM employees
GROUP BY last_name;

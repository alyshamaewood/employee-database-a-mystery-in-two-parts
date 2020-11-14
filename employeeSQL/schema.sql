DROP TABLE IF EXISTS title;
CREATE TABLE title(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY(dept_no)
);

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);

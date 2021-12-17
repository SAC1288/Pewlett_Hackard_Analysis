-- Creating tables for PH-EmployeeDB
--Drop Table departments
Update departments (
	dept_no VARCHAR() NOT NULL,
	dept_name VARCHAR() NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

SELECT * FROM departments
DELETE FROM departments

--Creating employees table for PH-EmployeeDB
Create Table employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
SELECT * FROM employees;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1/1/1952' AND '12/31/1955';

--Number of employees retiring.
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1/1/1952' AND '12/31/1955')
AND (hire_date BETWEEN '1/1/1985' AND '12/31/1988');

SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1/1/1952' AND '12/31/1955')
AND (hire_date BETWEEN '1/1/1985' AND '12/31/1988');



--Creating Department Manager table for PH-EmployeeDB
Create Table dept_manager (
	dept_no VARCHAR() NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);
ALTER TABLE dept_manager ALTER COLUMN dept_no TYPE VARCHAR;
DELETE FROM dept_manager;

SELECT * FROM dept_manager;


--Creating salaries table for PH-EmployeesDB.
Create Table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
SELECT * FROM salaries;


--Creating Dept_Employee table for PH-EmployeesDB.
Create Table Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
SELECT * FROM dept_emp;

--Creating titles table for PH-EmployeesDB.
Create Table titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM titles;

DROP TABLE IF EXISTS titles;

--Creating new table for retiring employees with emp_no.
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1/1/1952' AND '12/31/1955')
AND (hire_date BETWEEN '1/1/1985' AND '12/31/1988');
--check the retirement table.
SELECT * FROM retirement_info;

DROP TABLE retirement_info;

--Joining departments and departments manager tables.
SELECT departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

--Joining retirement_info and dept_emp tables.
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_emp.to_date
INTO current_emp
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date = ('1/1/9999');

--Employee count by department number.
SELECT COUNT(current_emp.emp_no), dept_emp.dept_no
INTO dept_emp_count
FROM current_emp
LEFT JOIN  dept_emp
ON current_emp.emp_no = dept_emp.emp_no
GROUP BY dept_emp.dept_no
ORDER BY dept_emp.dept_no;

--Checking dates from salaries table.
SELECT * FROM salaries
ORDER BY to_date DESC;

--Creating new employee info table.
SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.gender,
	salaries.salary,
	dept_emp.to_date
INTO emp_info
FROM employees
INNER JOIN salaries
ON (employees.emp_no = salaries.emp_no)
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
WHERE (employees.birth_date BETWEEN '1/1/1952' AND '12/31/1955')
AND (employees.hire_date BETWEEN '1/1/1985' AND '12/31/1988')
AND (dept_emp.to_date = '1/1/9999');

-- List of managers per department
SELECT  dept_manager.dept_no,
        departments.dept_name,
        dept_manager.emp_no,
        current_emp.last_name,
        current_emp.first_name,
        dept_manager.from_date,
        dept_manager.to_date
--INTO manager_info
FROM dept_manager
    INNER JOIN departments
        ON (dept_manager.dept_no = departments.dept_no)
    INNER JOIN current_emp
        ON (dept_manager.emp_no = current_emp.emp_no);

--Having the departments added to the current_emp table.
SELECT current_emp.emp_no,
	current_emp.first_name,
	current_emp.last_name,
	departments.dept_name
--INTO dept_info
FROM current_emp
INNER JOIN dept_emp
ON (current_emp.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no);
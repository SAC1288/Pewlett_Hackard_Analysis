--Module 7 Challenge Queries

--Deliverable 1
--Creating retirement table
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1/1/1952' AND '12/31/1955')
ORDER BY employees.emp_no;


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('1/1/9999')
ORDER BY emp_no, to_date DESC;

--DROP TABLE unique_titles;


--Retrieving the number of employees by their most recent job title who are baout to retire.
SELECT count(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;


--Deliverable 2
--Writing Query to Determine Mentorship Eligibility table.
SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1/1/1965' AND '12/31/1965')
AND (dept_emp.to_date = '1/1/9999')
ORDER BY emp_no;

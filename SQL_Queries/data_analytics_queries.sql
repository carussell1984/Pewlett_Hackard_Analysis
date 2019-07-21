--DATA ANALYSIS SQL SCRIPT--
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary --
	-- two table that I would like are: employees & salaries
	-- employees: emp no, last, name, gender, 
	-- salaries
CREATE VIEW employee_salary AS
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
FULL OUTER JOIN salaries s
ON e.emp_no = s.emp_no;

SELECT * FROM employee_salary

-- 2. List employees hired in 1986 -- 
	-- tables needed: employees
	--  columns from employees: employee no, last_name, first_name, hire_date = 1986

SELECT * FROM employees


CREATE VIEW employees_hired_1986 AS
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date>='1986-01-01' 
AND hire_date <='1986-12-31';

SELECT * FROM employees_hired_1986

--3. List the manager of each department with the following inforamtion: department number, department name
--   the manager's employee number, last name, first_name and start and end of employee_dates
	-- Tables needed: employees, dept_manager, department
		-- from employees: last_name, first_name
		-- dept_manager: dept_no, emp_no, from_date, to_date
		-- department: dept_name
		

CREATE VIEW department_manager_information AS
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM employees AS e
  RIGHT JOIN dept_manager AS dm
  ON (e.emp_no = dm.emp_no)
    LEFT JOIN department AS d
	ON (dm.dept_no = d.dept_no)
	
SELECT * FROM department_manager_information

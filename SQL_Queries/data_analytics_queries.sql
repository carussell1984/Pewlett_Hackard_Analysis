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

--4.List the department of each employee with the following information: employee number,
-- last name, first name, and department name.
	-- need three tables: department, emoloyees
	-- department: dept_name 
	-- employee: last_name, first_name, emp.no


CREATE VIEW employees_depts AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
  JOIN dept_manager AS dm
  ON (e.emp_no = dm.emp_no)
    JOIN department AS d
    ON (d.dept_no = dm.dept_no);
	
SELECT * FROM employees_depts;

--5. List all employees whose first name is "Hercules" and last names begin with "B".

SELECT emp_no, last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
-- The tables that are needed are employees, department, dept_emp
----depatment: dept_name
----employees: emp_no, last_name, first_name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
  FULL JOIN dept_emp AS de
  ON (e.emp_no = de.emp_no)
    FULL JOIN department AS d
    ON (d.dept_no = de.dept_no)
	  WHERE d.dept_name = 'Sales';
	

	
-- 7. List all employees in the Sales and Development department, including their employee number, last name, first name, and department name
-- The tables that are needed are employees, department, dept_emp
----depatment: dept_name
----employees: emp_no, last_name, first_name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
  FULL JOIN dept_emp AS de
  ON (e.emp_no = de.emp_no)
    FULL JOIN department AS d
    ON (d.dept_no = de.dept_no)
	  WHERE d.dept_name = 'Sales'
	  OR d.dept_name = 'Development';	

-- 8. In descending order, list the frequency count of employee last names; i.e. how many employees share each last name

SELECT last_name, COUNT(last_name) AS frequency_count_last_name
FROM employees
GROUP BY last_name
ORDER BY frequency_count_last_name DESC;
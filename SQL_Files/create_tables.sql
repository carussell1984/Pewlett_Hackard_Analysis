-- create 6 different tables --
CREATE TABLE department(
  dept_no VARCHAR(10) Primary Key,
  dept_name VARCHAR(30) 
);

CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  birth_date DATE,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  gender CHAR(1),
  hire_date DATE
);

CREATE TABLE dept_emp (
  id_dept_emp_table INT PRIMARY KEY,
  emp_no INT,
  dept_no VARCHAR(10),
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

CREATE TABLE salaries(
  salary_id INT PRIMARY KEY,
  emp_no INT,
  salary INT,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
  dept_manager_id INT PRIMARY KEY,
  dept_no VARCHAR(10),
  emp_no INT,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (dept_no) REFERENCES department(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
  titles_id INT PRIMARY KEY,
  emp_no INT,
  title VARCHAR(25),
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


/**************************************************************
*  RUT-SOM-DATA-PT-06-2020-U-C                   Douglas High *
*   >SQL-Challenge                            August 10, 2020 *
*                    TABLE QUERIES                            *
***************************************************************
*/
/*  NOTE: Corresponding csv files in '/Data.' need to be imported if tables are empty.
  The first three must be titles, employees, and departments, in that order  */
  
-- uncomment below lines to verify table contain data  
--SELECT * FROM titles;
--SELECT * FROM employees;
--SELECT * FROM departments;
--SELECT * FROM dept_emp;
--SELECT * FROM dept_manager;
--SELECT * FROM salaries;

--01 each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
       salaries.salary  
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--02 first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date  
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date, emp_no;

--03 manager of each department: department number, department name,
--								 manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no,
	   employees.last_name, employees.first_name 	
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees   ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_no;

--04 department of each employee: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM employees
INNER JOIN dept_emp     ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY emp_no;

--05  first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
SELECT first_name, last_name, sex  
FROM employees
Where first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;

--06  all employees in Sales department: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_emp    ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007'
ORDER BY emp_no;

--07 List all employees in Sales & Development departments: employee number, last name, first name, department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_emp    ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd005' OR dept_emp.dept_no = 'd007'
ORDER BY emp_no;

--08 descending order, frequency count of employee last names.
SELECT COUNT(last_name),  last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;







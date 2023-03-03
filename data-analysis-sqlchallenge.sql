--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" as e
INNER JOIN "Salaries" as s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

-- 2. List employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date 
FROM "Employees" 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT d.dept_no,d.dept_name,e.title_id,e.last_name,e.first_name
FROM "Dept_Emp" as de
LEFT JOIN "Employees" as e
ON e.emp_no = de.emp_no
LEFT JOIN "Departments" as d
ON d.dept_no = de.dept_no
WHERE e.title_id LIKE 'm%'
;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name

CREATE VIEW All_Employees AS 
SELECT e.emp_no,e.title_id, e.birth_date, e.last_name, e.first_name, e.sex, e.hire_date, d.dept_name, d.dept_no
FROM "Dept_Emp" as de
LEFT JOIN "Employees" as e
ON e.emp_no = de.emp_no
LEFT JOIN "Departments" as d
ON d.dept_no = de.dept_no
;

SELECT emp_no, last_name, first_name, dept_name
FROM All_Employees
;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT e.last_name, e.first_name
FROM "Employees" as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'b%'
ORDER BY e.last_name;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
CREATE VIEW Sales_Table as
SELECT emp_no,last_name, first_name, dept_name
FROM All_Employees
;

SELECT * FROM Sales_Table
WHERE dept_name = 'Sales'
;  

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp_no, last_name, first_name, dept_name FROM All_Employees
WHERE dept_name IN ('Sales', 'Development')
;
-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) as Frequency 
FROM "Employees" 
GROUP BY last_name
ORDER BY frequency DESC;
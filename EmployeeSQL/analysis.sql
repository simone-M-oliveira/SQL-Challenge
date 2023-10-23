-- List the employee number, last name, first name, sex, and salary of each employee

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM
	employees AS emp
INNER JOIN
	salaries as sal
ON sal.emp_no = emp.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986

--List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT
	dept.dept_no,
	dept.dept_name,
	emp.emp_no,
	emp.last_name AS "Mgr. Last Name",
	emp.first_name AS "Mgr. First Name"
FROM
	departments AS dept
INNER JOIN
	dept_manager AS dept_mgr
ON
	dept_mgr.dept_no = dept.dept_no
INNER JOIN
	employees AS emp
ON
	emp.emp_no = dept_mgr.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT
	dept.dept_no,
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM
	departments AS dept
INNER JOIN
	dept_emp AS dept_emp
ON 
	dept_emp.dept_no = dept.dept_no
INNER JOIN
	employees AS emp
ON
	emp.emp_no = dept_emp.emp_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT
	first_name,
	last_name,
	sex
FROM
	employees
WHERE
	first_name = 'Hercules' AND
	last_name LIKE 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name
FROM
	employees AS emp
INNER JOIN
	dept_emp AS dept_emp
ON
	dept_emp.emp_no = emp.emp_no
INNER JOIN
	departments AS dept
ON
	dept.dept_no = dept_emp.dept_no
WHERE
	dept.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM
	employees AS emp
INNER JOIN
	dept_emp AS dept_emp
ON
	dept_emp.emp_no = emp.emp_no
INNER JOIN
	departments AS dept
ON
	dept.dept_no = dept_emp.dept_no
WHERE
	dept.dept_name IN ('Sales', 'Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT
	last_name,
	COUNT(last_name) AS "Name Count"
FROM
	employees
GROUP BY last_name
ORDER BY "Name Count" DESC

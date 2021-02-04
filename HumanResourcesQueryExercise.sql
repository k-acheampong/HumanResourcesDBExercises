/*
Author: Kwame Acheampong
Description: Performing query excercises using an HR database
Date: 2021.01.29
*/

USE HR_DB;

--1. Find the 3 employees with the lowest salaries
SELECT TOP 3
	employee_id, first_name, last_name, salary
FROM employees
ORDER BY 
	salary ASC;

--2. Find the employee withe the 2nd highest salary who has a phone number that begins with '515'
SELECT 
	*
FROM 
	employees
WHERE
	phone_number LIKE '515%'
ORDER BY 
	salary DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;

--3. Find the name, salary, and hire date of all employees hired before 1995 and a salary over $10000
SELECT 
	first_name, last_name, salary, hire_date
FROM
	employees
WHERE
	hire_date < '1995-01-01' 
	AND salary > 10000;

--4. Get all the unique salaries in the employee table
SELECT DISTINCT
	salary
FROM
	employees;

--5. List each unique salary and how many people make that salary
SELECT DISTINCT
	salary,
	COUNT(employee_id) AS '# of employees'
FROM
	employees
GROUP BY
	salary;

--6. Group employes by department id, find the average salary of each department. Order them from lowest salary to highest
SELECT
	department_id,
	AVG(salary) AS 'average department salary'
FROM
	employees
GROUP BY
	department_id
ORDER BY AVG(salary) ASC;	

/*
--7. Find all employees hired between 1995 - 1997
	a. Order the employees by their department id and hire date
	b. Using OVER & PARTITION BY, list the average for their department next to each row
*/
--a.
SELECT
	first_name, last_name, salary, department_id, hire_date
FROM
	employees
WHERE
	hire_date BETWEEN'1995-01-01' AND '1997-01-01'
ORDER BY
	department_id, hire_date
--b.
SELECT
	first_name, last_name, salary, department_id, hire_date,
	AVG(salary) OVER(PARTITION BY hire_date) AS 'average department salary'
FROM
	employees
WHERE
	hire_date BETWEEN'1995-01-01' AND '1997-01-01'
ORDER BY
	department_id, hire_date

--8. Select the average salary of an employee per department, if it is odd when rounded, don't include it
SELECT
	department_id,
	AVG(salary) AS 'average department salary'
FROM
	employees
GROUP BY 
	department_id
HAVING AVG(salary) % 2 = 0;
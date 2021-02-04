/*
Name: Kwame Acheampong
Date: 2021.02.01
Description: Joins, Set Operations, & Subqueries Excercies
*/

USE HR_DB;
GO

--1. Select the first name, last name, job title, and department name for every employee using a join
SELECT
	first_name,
	last_name,
	job_title,
	department_name
FROM
	employees emp
LEFT JOIN
	departments dep
ON
	emp.department_id = dep.department_id
LEFT JOIN
	jobs job
ON 
	emp.job_id = job.job_id;

--2. Select the first name, last name, and email of all the employees who have a dependant using a join and then the subquery
--JOIN
SELECT
	emp.first_name,
	emp.last_name,
	email
FROM
	employees emp
INNER JOIN
	dependents depend
ON
	emp.employee_id = depend.employee_id;
--SUBQUERY
SELECT
	first_name,
	last_name,
	email
FROM
	employees
WHERE
	employee_id IN(
		SELECT 
			employee_id
		FROM
			dependents
	)
	ORDER BY
		employee_id;
/*
3. Create a query that selects the state/province and city from the locations table 
and the number of employees in each of those locations ordered from highest to lowest
*/
SELECT DISTINCT
	city,
	state_province,
	COUNT(employee_id) OVER(PARTITION BY state_province) AS 'employee count'
FROM
	locations l
INNER JOIN
	departments d
		ON l.location_id = d.location_id
INNER JOIN
	employees e
		ON d.department_id = e.department_id

--4. Create a query to get the first and last names of all employees and dependents using UNION
SELECT first_name, last_name FROM employees
	UNION
SELECT first_name, last_name FROM dependents;

/*
--5. Using EXCEPT select employees who make above the average salary for all employees and remove 
any employees who are managers
*/
SELECT 
    first_name,
    last_name,
    salary
FROM employees emp1
WHERE 
    salary > (
        SELECT 
            AVG(salary)
        FROM
            employees
    )
EXCEPT
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE
    employee_id IN (
        SELECT DISTINCT
            manager_id
        FROM
            employees
    );

-- 6. Get the job title, the amount of people with that job title, and the average salary for that job title.
SELECT 
    job_title,
    COUNT(employee_id) AS 'employee count',
    AVG(salary) AS 'average salary'
FROM 
	jobs j 
LEFT JOIN dbo.employees e 
    ON j.job_id = e.job_id
GROUP BY
    job_title;
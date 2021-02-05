This repository contains SQL queries that build a Human Resources database and perform complex SELECT statements based on exercises provided by Cognixia's JUMP program.
 
The diagram for the database is included in the repository as the pdf file HumanResourcesDbDiagram.pdf.

HumanResourcesDB.sql builds the database.

HumanResourcesDBExercises provides data for the following exercises:
1. Find the 3 employees with the lowest salaries.
2. Find the employee withe the 2nd highest salary who has a phone number that begins with '515'.
3. Find the name, salary, and hire date of all employees hired before 1995 and a salary over $10000.
4. Get all the unique salaries in the employee table.
5. List each unique salary and how many people make that salary.
6. Group employes by department id, find the average salary of each department. Order them from lowest salary to highest.
7. Find all employees hired between 1995 - 1997.
  a. Order the employees by their department id and hire date.
  b. Using OVER & PARTITION BY, list the average for their department next to each row.
8. Select the average salary of an employee per department, if it is odd when rounded, don't include it.

JoinsSetsSubsExcercise.sql contains complex SQL statements that utilize JOINs, subqueries, and set operators to provide data for the following exercises:
1. Select the first name, last name, job title, and department name for every employee using a JOIN.
2. Select the first name, last name, and email of all the employees who have a dependant using a JOIN and then using a subquery.
3. Create a query that selects the city/province and state from the locations table and the number of employees in each of those locations ordered from highest to lowest.
4. Create a query to get the first and last names of all employees and dependents using UNION.
5. Using EXCEPT select employees who make above the average salary for all employees and remove any employees who are managers.
6. Get the job title, the amount of people with that job title, and the average salary for that job title.

create database employees;
use employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 30, 'HR', 50000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 45, 'Finance', 75000.00, '2018-07-23'),
(3, 'Michael', 'Brown', 29, 'IT', 60000.00, '2019-04-01'),
(4, 'Emily', 'Davis', 35, 'IT', 65000.00, '2021-05-19'),
(5, 'James', 'Wilson', 42, 'Finance', 80000.00, '2017-11-02'),
(6, 'Anna', 'Taylor', 31, 'HR', 52000.00, '2021-09-17'),
(7, 'Robert', 'Anderson', 50, 'Management', 120000.00, '2016-03-10'),
(8, 'Laura', 'Thomas', 28, 'IT', 59000.00, '2022-01-25'),
(9, 'Daniel', 'White', 33, 'Marketing', 45000.00, '2020-06-14'),
(10, 'Sarah', 'Hall', 26, 'Marketing', 42000.00, '2021-10-30');

/* column name=>(EmployeeID, FirstName, LastName, Age, Department, Salary, HireDate)*/
/* Q1. Retrieve all records from the Employees table.*/

select * from Employees;

/* Q2. Find all employees who work in the 'IT' department.*/

select * from Employees where Department="IT";

/* Q3. List all employees sorted by their salary in descending order.*/

select * from Employees order by (salary) DESC;

/* Q4 Find the average salary for each department. */

select Department, avg(Salary)
from Employees
Group By Department;

/* Q5 Retrieve the names and salaries of employees who are older than 30 years, sorted by their age in ascending order.*/

Select FirstName, Salary
From Employees 
Where Age > 30 
Order By (Age) ASC;

/* Q6 Find departments with an average salary greater than $60,000.*/

Select Department, avg(Salary)
From Employees
Where Salary > 60000
Group By Department;

/* Q7 Retrieve the first and last names of all employees.*/

Select FirstName, LastName
From Employees;

/* Q8. Find employees who are in the 'HR' department and have a salary greater than $50,000.*/

Select * From Employees
Where Department = "HR" and Salary > 50000;

/* Q9. List all employees sorted by department and then by age within each department.*/

Select * From Employees
Order By Department, Age ASC;

/* Q10. Count the number of employees in each department.*/

Select Department, count(EmployeeID)
From Employees
Group By Department;

/* Q11. Find all employees who were hired after January 1, 2020.*/

Select FirstName, HireDate
From Employees
Where HireDate > '2020-01-01';

/* Q12. Find the total salary expenditure for each department*/

Select Department, Sum(Salary)
From Employees
Group By Department;

/* Q13. Retrieve the names of employees in the 'Marketing' department, sorted by their hire date */

Select FirstName, Department, HireDate
From Employees 
Where Department= "Marketing"
Order By HireDate ASC;

/* Q14. Find departments with more than 2 employees and show the total number of employees in those departments.*/

Select Department, count(EmployeeID) As Total_Number_Of_Employee
From Employees
Group By Department
Having count(EmployeeID) > 2;

/* Q15. Find employees whose last name starts with 'D'.*/

Select * From Employees
Where LastName Like 'D%';

/* Q16. Find employees who are in the 'IT' or 'Marketing' department.*/

Select * From Employees
Where Department in ('IT', 'Marketing');

/* Q17. Retrieve the first and last names of employees who have a salary less than $50,000.*/

Select FirstName, LastName, Salary
From Employees
Where Salary < 50000;

/* Q18. Find the employee with the highest salary.*/

Select * From Employees
Order By Salary DESC
LIMIT 1;

/* Q19. Retrieve the full details of employees whose age is between 25 and 35.*/

Select * From Employees
Where Age Between 25 and 35;

/* Q20. List all employees sorted by their hire date in ascending order.*/

Select * From Employees
Order By HireDate ASC;









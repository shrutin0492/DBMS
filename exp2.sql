-- Retrieve firstname, date of birth, and salary of female employees
SELECT Fname, Bdate, Salary
FROM EMPLOYEE
WHERE Sex = 'F';

-- Retrieve name, SSN, and address of employees whose salary is greater than 50000
SELECT Fname, Lname, SSN, Address
FROM EMPLOYEE
WHERE Salary > 50000;

-- Retrieve name, SSN, and address of male employees whose salary is less than 30000
SELECT Fname, Lname, SSN, Address
FROM EMPLOYEE
WHERE Sex = 'M' AND Salary < 30000;

-- Retrieve SSN values of all employees
SELECT SSN
FROM EMPLOYEE;

-- Retrieve all information from employees and department who work in Department No 5
SELECT E.*, D.*
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.Dnumber
WHERE D.Dnumber = 5;

-- Retrieve birthday and address of employee whose name is ‘Rahul M Singh’
SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname = 'Rahul' AND Minit = 'M' AND Lname = 'Singh';

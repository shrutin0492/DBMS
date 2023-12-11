-- Find sum, maximum, minimum, and average salary of all employees
SELECT 
    SUM(Salary) AS TotalSalary,
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary,
    AVG(Salary) AS AvgSalary
FROM EMPLOYEE;

-- Find sum, maximum, minimum, and average salary of employees in the 'Research' department
SELECT 
    SUM(E.Salary) AS TotalSalary,
    MAX(E.Salary) AS MaxSalary,
    MIN(E.Salary) AS MinSalary, 
    AVG(E.Salary) AS AvgSalary
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.Dnumber
WHERE D.Dname = 'Research';

-- Retrieve total number of employees in the 'Research Department'
SELECT COUNT(*) AS TotalEmployees
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.Dnumber
WHERE D.Dname = 'Research';

-- Count number of distinct salary values in the database
SELECT COUNT(DISTINCT Salary) AS DistinctSalaryCount
FROM EMPLOYEE;

-- Retrieve names of all employees who have two or more dependents
SELECT DISTINCT E.Fname, E.Lname
FROM EMPLOYEE E
JOIN DEPENDENT D ON E.SSN = D.ESSN
GROUP BY E.SSN
HAVING COUNT(DISTINCT D.Dname) >= 2;

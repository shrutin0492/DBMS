-- Retrieve all employees whose address is in Bangalore
SELECT *
FROM EMPLOYEE
WHERE Address LIKE '%Bangalore%';

-- Retrieve all employees who were born during the 1950s
SELECT *
FROM EMPLOYEE
WHERE Bdate BETWEEN '1950-01-01' AND '1959-12-31';

-- Show the effect of giving 10% raise to all employees who work on the 'DBMS' project
UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE SSN IN (SELECT ESSN FROM WORKS_ON WHERE Pno = (SELECT Pnumber FROM PROJECT WHERE Pname = 'DBMS'));

-- Retrieve a list of employees and their projects in which they work, ordered by the employee's department
SELECT E.Fname, E.Lname, P.Pname
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.SSN = W.ESSN
JOIN PROJECT P ON W.Pno = P.Pnumber
ORDER BY E.DNO;

-- Change location and controlling department number of employees from ‘Bangalore’ to 'Bellaire' and project number 10 to 5 respectively
UPDATE DEPT_LOCATION
SET Dlocation = 'Bellaire'
WHERE Dnumber IN (SELECT DNO FROM EMPLOYEE WHERE Address LIKE '%Bangalore%');

UPDATE PROJECT
SET Dnum = 5
WHERE Pnumber = 10;

-- Retrieve all information from employee and department who work in Research department
SELECT E.*, D.*
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.Dnumber
WHERE D.Dname = 'Research';

-- Retrieve name and address of employees who work in research department
SELECT Fname, Lname, Address
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.Dnumber
WHERE D.Dname = 'Research';

-- Retrieve details of employees who work in department 5 and salary is between 30,000 and 40,000
SELECT *
FROM EMPLOYEE
WHERE DNO = 5 AND Salary BETWEEN 30000 AND 40000;

-- For every project located in ‘Bangalore’, list project number, controlling department number, department manager's lastname, address, and birthdate
SELECT P.Pnumber, P.Dnum, D.mgrssn, E.Lname AS ManagerLastName, E.Address AS ManagerAddress, E.Bdate AS ManagerBirthdate
FROM PROJECT P
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
JOIN EMPLOYEE E ON D.mgrssn = E.SSN
WHERE P.Plocation = 'Bangalore';

-- Retrieve name of employees who have no dependents
SELECT DISTINCT E.Fname, E.Lname
FROM EMPLOYEE E
LEFT JOIN DEPENDENT D ON E.SSN = D.ESSN
WHERE D.ESSN IS NULL;

-- Retrieve social security number of all employees who work on project number 1, 2, or 3
SELECT E.SSN
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.SSN = W.ESSN
WHERE W.Pno IN (1, 2, 3);

-- Retrieve name of all employees who do not have supervisors
SELECT Fname, Lname
FROM EMPLOYEE
WHERE SUPERSSN IS NULL;

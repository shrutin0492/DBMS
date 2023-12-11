-- Create tables for the database
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Minit VARCHAR(50),
    SSN CHAR(9),
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    SuperSSN CHAR(10),
    DNO NUMBER,
    PRIMARY KEY (SSN)
);

CREATE TABLE DEPARTMENT (
    Dept_name VARCHAR(50),
    Dnumber NUMBER,
    mgrssn CHAR(9),
    mgrstartdate DATE,
    PRIMARY KEY (Dnumber),
    FOREIGN KEY (mgrssn) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE DEPT_LOCATION (
    Dnumber NUMBER,
    Dlocation VARCHAR(50),
    PRIMARY KEY (Dnumber)
);

CREATE TABLE PROJECT (
    Pname VARCHAR(50),
    Pnumber NUMBER,
    Plocation VARCHAR(50),
    Dnum NUMBER,
    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON (
    ESSN CHAR(9),
    Pno INT,
    Hours DECIMAL(5, 2),
    PRIMARY KEY (ESSN, Pno)
);

CREATE TABLE DEPENDENT (
    ESSN CHAR(9),
    Dname VARCHAR(50),
    Sex CHAR(1),
    Relationship VARCHAR(20),
    PRIMARY KEY (ESSN, Dname)
);

-- Add columns to the EMPLOYEE table
ALTER TABLE EMPLOYEE ADD COLUMN Lname VARCHAR(50);
ALTER TABLE EMPLOYEE ADD COLUMN Minit VARCHAR(50);

-- Rename table EMPLOYEE to EMP
ALTER TABLE EMPLOYEE RENAME TO EMP;

-- Rename column MSSN to SuperSSN in the EMP table
ALTER TABLE EMP RENAME COLUMN MSSN TO SuperSSN;

-- Insert relevant records in all the tables
INSERT INTO EMP (Fname, SSN, Bdate, Address, Sex, Salary, SuperSSN, DNO)
VALUES ('John', '123', '1990-02-05', '123 Main St', 'M', 60000.00, '987-65-4321', 1);

-- Insert into DEPARTMENT table
INSERT INTO DEPARTMENT (Dept_name, Dnumber, mgrssn, mgrstartdate)
VALUES ('HR', 1, '987-65-4321', '2001-03-03');

-- Insert into DEPT_LOCATION table
INSERT INTO DEPT_LOCATION (Dnumber, Dlocation)
VALUES (1, 'Building A');

-- Insert into PROJECT table
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('Employee Management', 1, 'Floor 3', 1);

-- Insert into WORKS_ON table
INSERT INTO WORKS_ON (ESSN, Pno, Hours)
VALUES ('123-45-6789', 1, 40.0);

-- Insert into DEPENDENT table
INSERT INTO DEPENDENT (ESSN, Dname, Sex, Relationship)
VALUES ('123-45-6789', 'Jane Doe', 'F', 'Spouse');

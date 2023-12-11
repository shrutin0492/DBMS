-- Trigger to calculate commission for new employees in department 30 before insertion
CREATE OR REPLACE TRIGGER EMP_COMM_TRIG
BEFORE INSERT ON EMP
FOR EACH ROW
BEGIN
    IF :NEW.DEPTNO = 30 THEN
        :NEW.COMM := :NEW.SAL * 0.1; -- Assuming commission is 10% of salary
    ELSE
        :NEW.COMM := NULL;
    END IF;
END;
/

-- Trigger to add a row to the EMPCHGLOG table when an employee row is deleted
CREATE OR REPLACE TRIGGER EMP_DEL_TRIG
AFTER DELETE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO EMPCHGLOG (SYSDATE, EMPNO, ACTION)
    VALUES (SYSDATE, :OLD.EMPNO, 'Employee deleted');
END;
/

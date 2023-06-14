-- 1
SELECT *
From dept;
-- 2
SELECT empno, ename, job, hiredate
FROM emp;
-- 3
SELECT DISTINCT job
FROM emp;
-- 4
SELECT EMPNO AS "Emp#", ENAME AS Employee, JOB AS Job, HIREDATE AS "Hire Date"
FROM emp;
-- 5
SELECT concat(ENAME,', ', JOB) "Employee and Title"
FROM emp;
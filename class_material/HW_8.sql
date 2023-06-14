-- 1. 利用下列資料來新建 DEPARTMENT 資料表。
CREATE TABLE DEPARTMENT
( id INT NOT NULL,
  name VARCHAR(24) NOT NULL
);

-- 2. 利用DEPT資料表中的資料,將資料新增至DEPARTMENT 資料表中(只新增相對的資料欄)。
INSERT INTO DEPARTMENT(id, name)
	SELECT deptno, dname
    FROM dept;

-- 3. 利用下列資料來新建 EMPLOYEE資料表。
CREATE TABLE EMPLOYEE
( id INT NOT NULL,
  last_name VARCHAR(24) NOT NULL,
  first_name VARCHAR(24),
  dept_id INT
);

-- 4. 將EMPLOYEE資料表中last_name欄位的資料型態更改為 varchar(40)。
ALTER TABLE EMPLOYEE
MODIFY COLUMN last_name varchar(40);

-- 5. 使用EMP資料表的結構中之EMPNO, ENAME,and DEPTNO之定義來新建EMPLOYEE2資料表並將欄位名稱設定為 ID, LAST_NAME, and DEPT_ID 。
CREATE TABLE EMPLOYEE2
	AS
    SELECT EMPNO AS ID, ENAME AS 'LAST_NAME', DEPTNO AS 'DEPT_ID'
		FROM emp;

-- 6. 刪除整個EMPLOYEE資料表。
DROP TABLE EMPLOYEE;

-- 7. 將EMPLOYEE2資料表改名為EMPLOYEE。
ALTER TABLE EMPLOYEE2
RENAME TO EMPLOYEE;

-- 8. 將EMPLOYEE資料表中的LAST_NAME欄位刪除。
ALTER TABLE EMPLOYEE
DROP COLUMN LAST_NAME;

-- 9. 修改EMPLOYEE資料表,新增一個欄位 SALARY 資料型態為 INT。
ALTER TABLE EMPLOYEE
ADD COLUMN SALARY INT;

-- 10. 修改EMPLOYEE資料表,使用ID 欄位新增一個Primary key的限制條件(constraint),並為他命名。
ALTER TABLE EMPLOYEE
	ADD CONSTRAINT PK_EMPLOYEE_ID PRIMARY KEY(ID);

-- 11. 在EMPLOYEE資料表新增一個外來鍵(foreign key)以確保員工不會被分派到一個不存在的部門。
ALTER TABLE EMPLOYEE
	ADD CONSTRAINT FK_EMPLOYEE_DEPT_ID FOREIGN KEY(DEPT_ID) REFERENCES dept(deptno);


-- 11. 在EMPLOYEE資料表新增一個外來鍵(foreign key)以確保員工不會被分派到一個不存在的部門。



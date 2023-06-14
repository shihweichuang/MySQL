-- 1. 使用EMP資料表中的員工編號(empno),姓名(ename)及部門編號(deptno)來建立一個EMP_VU view,並將姓名(ename)欄位名稱改成EMPLOYEE。
CREATE VIEW EMP_VU
AS
	SELECT empno, ename AS employee, deptno
    FROM emp;

-- 2. 顯示EMP_VU view中的資料內容。
SELECT *
FROM emp_vu;

-- 3. 使用EMP_VU view來顯示所有員工之姓名及部門編號。
SELECT employee, deptno
FROM emp_vu;

-- 4. 新建一個名為 DEPT20的view, 包含在部門20的所有員工之員工編號，員工姓名，及部門編號。將View中的資料項目命名為 EMPLOYEE_ID, EMPLOYEE, and DEPARTMENT_ID。並設定不允許使用者透過 DEPT20 來更改員工所屬的部門編號。
CREATE VIEW DEPT20
AS
	SELECT empno AS employee_id, ename AS employee, deptno AS department_id
    FROM emp
    WHERE deptno = 20
    WITH CHECK OPTION;

-- 5. 顯示DEPT20 view的欄位定義資料(結構)及其所有資料內容。
DESC dept20;
SELECT *
FROM dept20;

-- 6. 試試看利用DEPT20 view將 Smith 轉調到部門30。
UPDATE dept20
SET department_id = 30
WHERE employee = 'smith';

-- 7. 新建一個名為 SALARY_VU的view，包含所有員工之姓名，部門名稱，薪資和薪資等級。將View中的資料項目分別命名為 Employee, Department, Salary, Grade。
CREATE VIEW salary_vu
AS
	SELECT e.ename AS Employee, d.dname AS Department, sal AS Salary, s.grade AS Grade 
	FROM dept d JOIN emp e ON (d.deptno = e.deptno)
				JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal);

-- 8. 在EMP資料表中利用ename欄位建立一個non-unique index 命名為idx_emp_ename。
CREATE INDEX idx_emp_ename
ON emp(ename);
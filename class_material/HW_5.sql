-- 1. 顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。
SELECT e.ename, e.deptno, d.dname, d.loc
FROM dept d JOIN emp e on d.deptno = e.deptno;

-- 2. 顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。
SELECT e.ename, e.comm, d.dname, d.loc
FROM dept d JOIN emp e on d.deptno = e.deptno
WHERE e.comm > 0;

-- 3. 顯示姓名中包含有”A”的員工之姓名及部門名稱。
SELECT e.ename, d.dname
FROM dept d JOIN emp e on d.deptno = e.deptno
WHERE e.ename LIKE '%A%';

-- 4. 顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱
SELECT e.ename, e.job, d.deptno, d.dname
FROM dept d JOIN emp e on d.deptno = e.deptno
WHERE d.loc = 'DALLAS';


-- 5. 顯示出表頭名為: Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名,員工編號,主管姓名, 主管的員工編號。
SELECT a.ename AS Employee, a.empno AS 'Emp#', b.ename AS Manager, b.empno AS'Mgr#'
FROM emp a JOIN emp b ON a.mgr = b.empno;

-- 6. 顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪資等級。
SELECT e.ename, e.job, d.dname, e.sal, s.grade 
FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal) 
           JOIN dept d ON e.deptno = d.deptno;

-- 7. 顯示出表頭名為: Employee, Emp Hiredate, Manager, Mgr Hiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。
SELECT e.ename AS Employee, e.hiredate AS 'Emp Hiredate', b.ename AS Manager, b.hiredate AS 'Mgr Hiredate'
FROM emp e JOIN emp b ON e.mgr = b.empno
WHERE e.hiredate < b.hiredate;
            

-- 8. 顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部門所在地點,部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。
SELECT d.dname AS dname, d.loc AS loc, COUNT(e.ename) AS 'Number of People', ROUND(AVG(e.sal), 2) AS Salary
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname, d.loc;

-- 9. 顯示所有部門之編號、名稱及部門員工人數(Emp#)，包含沒有員工的部門。
SELECT d.deptno AS deptno, d.dname AS dname, COUNT(e.ename) AS 'emp#' 
FROM emp e RIGHT JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptno, d.dname;
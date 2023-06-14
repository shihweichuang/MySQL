-- 1. 將下列的資料新增至MY_EMP 資料表中,不要列舉欄位。
INSERT INTO my_emp
VALUES(1, 'Patel', 'Ralph', 'rpatel', 795);

-- 2. 使用列舉欄位方式,將下列的資料新增至 MY_EMP資料表中。
INSERT INTO my_emp(ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
VALUES(2, 'Dancs', 'Betty', 'bdancs', 860);

-- 3. 將下列的資料新增至 MY_EMP資料表中。
INSERT INTO my_emp
VALUES(3, 'Biri', 'Ben', 'bbiri', 1100),
      (4, 'Newman', 'Chad', 'cnewman', 750);

-- 4. 將員工編號為3的名字(last name)更改為 Drexler 。
SET SQL_SAFE_UPDATES = 0;
UPDATE my_emp
SET LAST_NAME = 'Drexler'
WHERE ID = 3;


-- 5. 將薪資低於900元的所有員工薪資調整為1000元。
UPDATE my_emp
SET SALARY = 1000
WHERE SALARY < 900;

-- 6. 刪除 Betty Dancs 的資料。
DELETE FROM my_emp
WHERE FIRST_NAME = 'Betty' AND LAST_NAME = 'Dancs';

-- 7. 啟動一個資料庫交易，
-- 將所有員工的薪資調升10%
-- 設定一個交易儲存點
-- 刪除所有MY_EMP資料表中的資料，確認資料已被你刪光了
-- 放棄刪除資料的動作，確認交易
SET AUTOCOMMIT = 0;
START TRANSACTION;
update my_emp 
set salary = salary * (1 + 0.1);
savepoint SP1;
delete from my_emp;
select * 
from my_emp;
rollback to SP1;
commit;
select * 
from my_emp;
SET AUTOCOMMIT = 1;
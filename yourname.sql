/* Using Database yourname */
USE yourname;

/* Creating Table Workers */
CREATE TABLE Workers(
Worker_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY integer,
JOINING_DATE timestamp,
DEPATMENT VARCHAR(25)
);

/* Inserting Values in Table Workers */
INSERT INTO Workers 
VALUES (001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR');

INSERT INTO Workers 
VALUES (002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin');

INSERT INTO Workers 
VALUES (003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR');

INSERT INTO Workers 
VALUES (004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin');

INSERT INTO Workers 
VALUES (005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin');

INSERT INTO Workers 
VALUES (006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Accountant');

INSERT INTO Workers 
VALUES (007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Accoutant');

INSERT INTO Workers 
VALUES (008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

/* Creating Table Bonus */
CREATE TABLE Bonus(
Worker_REF_ID INT,
FOREIGN KEY(Worker_REF_ID) REFERENCES Workers (Worker_ID),
BONUS_AMOUNT INTEGER,
BONUS_DATE TIMESTAMP
);

/* Inserting Values in Table Bonus */
INSERT INTO Bonus
VALUES (1, 5000, '2016-06-20 00:0:00');

INSERT INTO Bonus
VALUES (2, 3000, '2016-06-11 00:0:00');

INSERT INTO Bonus
VALUES (3, 4000, '2016-02-20 00:0:00');

INSERT INTO Bonus
VALUES (1, 4500, '2016-02-20 00:0:00');

INSERT INTO Bonus
VALUES (2, 3500, '2016-06-11 00:0:00');

/* Creating Table Titles */
CREATE TABLE Titles(
WORK_REF_ID INT,
FOREIGN KEY (WORK_REF_ID) REFERENCES Worker(Worker_ID),
Worker_TITLE VARCHAR(25),
AFFECTED_FROM TIMESTAMP
);

/* Inserting Values in Table Titles */
INSERT INTO Titles
VALUES (1, 'Manager', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (2, 'Executive', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (8, 'Executive', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (5, 'Manager', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (4, 'Asst. Manager', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (7, 'Executive', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (6, 'Lead', '2016-06-11 00:00:00');

INSERT INTO Titles
VALUES (3, 'Lead', '2016-06-11 00:00:00');

/* ANSWERS */

/* Q-1 */
SELECT FIRST_NAME AS Worker_NAME FROM Workers;

/* Q-2 */
SELECT UPPER(FIRST_NAME) FROM Workers;

/* Q-3 */
SELECT DISTINCT DEPATMENT FROM Workers;

/* Q-4 */
SELECT substring(FIRST_NAME, 1,3) FROM Workers;

/* Q-5 */
SELECT INSTR(FIRST_NAME, BINARY'a') from Workers where FIRST_NAME = 'Amitabh';

/* Q-6 */
SELECT RTRIM(FIRST_NAME) FROM Workers;

/* Q-7 */
SELECT LTRIM(FIRST_NAME) FROM Workers;

/* Q-8 */
SELECT DISTINCT length(DEPATMENT) from Workers;

/* Q-9 */
Select REPLACE(FIRST_NAME,'a','A') from Workers;

/* Q-10 */
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Workers;

/* Q-11 */
Select * from Workers order by FIRST_NAME asc;

/* Q-12*/
Select * from Workers order by FIRST_NAME asc,DEPATMENT desc;

/* Q-13 */
Select * from Workers where FIRST_NAME in ('Vipul','Satish');

/* Q-14 */
Select * from Workers where FIRST_NAME not in ('Vipul','Satish');

/* Q-15 */
Select * from Workers where DEPATMENT like 'Admin%';

/* Q-16 */
Select * from Workers where FIRST_NAME like '%a%';

/* Q-17 */
Select * from Workers where FIRST_NAME like '%a';

/* Q-18 */
Select * from Workers where FIRST_NAME like '_____h';

/* Q-19 */
Select * from Workers where SALARY between 100000 and 500000;

/* Q-20 */
Select * from Workers where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

/* Q-21 */
SELECT COUNT(*) FROM Workers WHERE DEPATMENT = 'Admin';

/* Q-22 */
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Workers_Name, Salary
FROM Workers 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM Workers 
WHERE Salary BETWEEN 50000 AND 100000);

/* Q-23 */
SELECT DEPATMENT, count(WORKER_ID) No_Of_Workers 
FROM Workers 
GROUP BY DEPATMENT 
ORDER BY No_Of_Workers DESC;

/* Q-24 */
SELECT DISTINCT W.FIRST_NAME, T.Workers_TITLE
FROM Workers W
INNER JOIN Title T
ON W.WORKER_ID = T.Workers_REF_ID
AND T.Workers_TITLE in ('Manager');

/* Q-25 */
SELECT Workers_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY Workers_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

/* Q-26 */
SELECT * FROM Workers WHERE MOD (WORKER_ID, 2) <> 0;

/* Q-27*/
SELECT * FROM Workers WHERE MOD (WORKER_ID, 2) = 0;

/* Q-28 */
SELECT * INTO WorkersClone FROM Workers;

/* Q-29 */
SELECT * FROM Workers
INNER JOIN
(SELECT * FROM WorkersClone);

/* Q-30 */
SELECT * FROM Workers
NOT IN
SELECT * FROM Title;

/* Q-31 */
SELECT CURDATE();

/* Q-32 */
SELECT * FROM Workers ORDER BY Salary DESC LIMIT 10;

/* Q-33 */
SELECT Salary FROM Workers ORDER BY Salary DESC LIMIT n-1, 1;

/* Q-34 */
SELECT Salary
FROM Workers W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Workers W2
 WHERE W2.Salary >= W1.Salary
 );
 

/* Q-35 */
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Workers W, Workers W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

/* Q-36 */
Select max(Salary) from Workers 
where Salary not in (Select max(Salary) from Workers);

/* Q-37 */
select FIRST_NAME, DEPATMENT from Workers W where W.DEPATMENT='HR' 
union all 
select FIRST_NAME, DEPATMENT from Workers W1 where W1.DEPATMENT='HR';

/* Q-38 */
SELECT * FROM Workers
INNER JOIN
(SELECT * FROM Bonus);

/* Q-39 */
SELECT *
FROM Workers
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Workers);

/* Q-40 */
SELECT DEPATMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Workers GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

/* Q-41 */
SELECT DEPATMENT, COUNT(DEPATMENT) as 'Number of Workers' FROM Workers GROUP BY DEPARTMENT;

/* Q-42*/
Select * from Workers where WORKER_ID = (SELECT max(WORKER_ID) from Workers);

/* Q-43 */
Select * from Workers where WORKER_ID = (SELECT min(WORKER_ID) from Workers);

/* Q-44 */
SELECT * FROM Workers WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Workers W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;

/* Q-45 */
SELECT t.DEPATMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Workers group by DEPARTMENT) as TempNew 
Inner Join Workers t on TempNew.DEPATMENT=t.DEPATMENT 
 and TempNew.TotalSalary=t.Salary;
 
/* Q-46 */
SELECT distinct Salary from Workers a WHERE 3 >= (SELECT count(distinct Salary) from Workers b WHERE a.Salary <= b.Salary) order by a.Salary desc;

/* Q-47 */
SELECT distinct Salary from Workers a WHERE 3 >= (SELECT count(distinct Salary) from Workers b WHERE a.Salary >= b.Salary) order by a.Salary desc;

/* Q-48 */
SELECT distinct Salary from Workers a WHERE n >= (SELECT count(distinct Salary) from Workers b WHERE a.Salary <= b.Salary) order by a.Salary desc;

/* Q-49 */
 SELECT DEPATMENT, sum(Salary) from Workers group by DEPATMENT;

/* Q-50 */
SELECT FIRST_NAME, SALARY from Workers WHERE SALARY=(SELECT max(SALARY) from Workers);

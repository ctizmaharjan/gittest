CREATE SCHEMA Suyeshsingh;
USE Suyeshsingh;

CREATE TABLE SuyeshsinghWorker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO SuyeshsinghWorker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE SuyeshsinghBonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES SuyeshsinghWorker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO SuyeshsinghBonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE SuyeshsinghTitle (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES SuyeshsinghWorker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO SuyeshsinghTitle 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
/*Answers*/
/*Q1*/

Select FIRST_NAME AS WORKER_NAME from SuyeshsinghWorker;

/*Q2*/

Select upper(FIRST_NAME) from SuyeshsinghWorker;

/*Q3*/


Select distinct DEPARTMENT from SuyeshsinghWorker;

/*Q4*/

Select substring(FIRST_NAME,1,3) from SuyeshsinghWorker;

/*Q5*/

Select INSTR(FIRST_NAME, BINARY'a') from SuyeshsinghWorker where FIRST_NAME = 'Amitabh';

/*Q6*/

Select RTRIM(FIRST_NAME) from SuyeshsinghWorker;

/*Q7*/

Select LTRIM(DEPARTMENT) from SuyeshsinghWorker;

/*Q8*/

Select distinct length(DEPARTMENT) from SuyeshsinghWorker;

/*Q9*/

Select REPLACE(FIRST_NAME,'a','A') from SuyeshsinghWorker;

/*Q10*/

Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from SuyeshsinghWorker;

/*Q11*/

Select * from SuyeshsinghWorker order by FIRST_NAME asc;

/*Q12*/

Select * from SuyeshsinghWorker order by FIRST_NAME asc,DEPARTMENT desc;

/*Q13*/

Select * from SuyeshsinghWorker where FIRST_NAME in ('Vipul','Satish');

/*Q14*/

Select * from SuyeshsinghWorker where FIRST_NAME not in ('Vipul','Satish');

/*Q15*/

Select * from SuyeshsinghWorker where DEPARTMENT like 'Admin%';

/*Q16*/

Select * from SuyeshsinghWorker where FIRST_NAME like '%a%';

/*Q17*/

Select * from SuyeshsinghWorker where FIRST_NAME like '%a';

/*Q18*/

Select * from SuyeshsinghWorker where FIRST_NAME like '_____h';

/*Q19*/

Select * from SuyeshsinghWorker where SALARY between 100000 and 500000;

/*Q20*/

Select * from SuyeshsinghWorker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

/*Q21*/

SELECT COUNT(*) FROM SuyeshsinghWorker WHERE DEPARTMENT = 'Admin';

/*Q22*/

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM SuyeshsinghWorker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM SuyeshsinghWorker 
WHERE Salary BETWEEN 50000 AND 100000);

/*Q23*/

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM SuyeshsinghWorker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

/*Q24*/

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM SuyeshsinghWorker W
INNER JOIN SuyeshsinghTitle T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

/*Q25*/

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM SuyeshsinghTitle
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

/*Q26*/

SELECT * FROM SuyeshsinghWorker WHERE MOD (WORKER_ID, 2) <> 0;

/*Q27*/

SELECT * FROM SuyeshsinghWorker WHERE MOD (WORKER_ID, 2) = 0;

/*Q28*/

CREATE TABLE SuyeshsinghWorkerClone LIKE SuyeshsinghWorker;

/*Q29*/

/*Q30*/

SELECT * FROM SuyeshsinghWorkerClone where WORKER_ID not in
(select SuyeshsinghWorker.WORKER_ID from SuyeshsinghWorker
left join SuyeshsinghWorkerClone on 
SuyeshsinghWorker.WORKER_ID = SuyeshsinghWorkerClone.WORKER_ID);

/*Q31*/

SELECT now();

/*Q32*/

SELECT * FROM SuyeshsinghWorker ORDER BY Salary DESC LIMIT 10;

/*Q33*/

/*SELECT MAX(SALARY) as 'highest salary' from SuyeshsinghWorker 
where SALARY not in (select distinct TOP 4 SALARY from SuyeshsinghWorker
order by SALARY desc);*/

/*Q34*/

SELECT Salary
FROM SuyeshsinghWorker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM SuyeshsinghWorker W2
 WHERE W2.Salary >= W1.Salary
 );
 
/*Q35*/

Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from SuyeshsinghWorker W, SuyeshsinghWorker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

/*Q36*/

Select max(Salary) from SuyeshsinghWorker 
where Salary not in (Select max(Salary) from SuyeshsinghWorker);

/*Q37*/

select FIRST_NAME, DEPARTMENT from SuyeshsinghWorker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from SuyeshsinghWorker W1 where W1.DEPARTMENT='HR';

/*Q38*/

/*Q39*/

SELECT *
FROM SuyeshsinghWorker
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from SuyeshsinghWorker);

/*Q40*/

SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM SuyeshsinghWorker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

/*Q41*/

SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM SuyeshsinghWorker GROUP BY DEPARTMENT;

/*Q42*/

Select * from SuyeshsinghWorker where WORKER_ID = 
(SELECT max(WORKER_ID) from SuyeshsinghWorker);

/*Q43*/

Select * from SuyeshsinghWorker where WORKER_ID = (SELECT min(WORKER_ID) from SuyeshsinghWorker);

/*Q44*/

SELECT * FROM SuyeshsinghWorker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM SuyeshsinghWorker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;

/*Q45*/

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from SuyeshsinghWorker group by DEPARTMENT) as TempNew 
Inner Join SuyeshsinghWorker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;
 
/*Q46*/

SELECT distinct Salary from SuyeshsinghWorker a WHERE 3 >= 
(SELECT count(distinct Salary) from SuyeshsinghWorker b WHERE a.Salary <= b.Salary) 
order by a.Salary desc;

/*Q47*/

SELECT distinct Salary from SuyeshsinghWorker a WHERE 3 >= 
(SELECT count(distinct Salary) from SuyeshsinghWorker b WHERE a.Salary >= b.Salary) 
order by a.Salary desc;

/*Q48*/

/*Q49*/

SELECT DEPARTMENT, sum(Salary) from SuyeshsinghWorker group by DEPARTMENT;

/*Q50*/

SELECT FIRST_NAME, SALARY from SuyeshsinghWorker WHERE SALARY=(SELECT max(SALARY) from SuyeshsinghWorker);
 
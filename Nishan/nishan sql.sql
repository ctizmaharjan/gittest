Create database Nishan;
Use Nishan;
create table nishan.workers(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INTEGER,
JOINING_DATE TIMESTAMP,
DEPARTMENT VARCHAR(25)
);

insert into nishan.workers values
('001','Monika','Arora','100000','2014-02-20 09:00:00','HR'),
('002','Niharika','Verma','80000','2014-06-11 09:00:00','Admin'),
('003','Vishal','Singhal','300000','2014-02-20 09:00:00','HR'),
('004','Amitabh','Singh','500000','2014-02-20 09:00:00','Admin'),
('005','Vivek','Bhati','500000','2014-06-11 09:00:00','Admin'),
('006','Vipul','Diwan','200000','2014-06-11 09:00:00','Account'),
('007','Satish','Kumar','75000','2014-01-20 09:00:00','Account'),
('008','Geetika','Chauhan','90000','2014-04-11 09:00:00','Admin');


create table Nishan.Bonus(
WORKER_REF_ID INT,
FOREIGN KEY(WORKER_REF_ID) REFERENCES Nishan.Workers(WORKER_ID),
BONUS_DATE TIMESTAMP,
BONUS_AMOUNT INTEGER
);

insert into Nishan.Bonus values('1','2016-02-20 00:00:00','5000'),
('2','2016-06-11 00:00:00','3000'),
('3','2016-02-20 00:00:00','4000'),
('1','2016-02-20 00:00:00','4500'),
('2','2016-06-11 00:00:00','3500');


create table Nishan.Title(
WORKER_REF_ID INT,
FOREIGN KEY(WORKER_REF_ID) REFERENCES Nishan.Workers(WORKER_ID),
WORKER_TITLE VARCHAR(25),
AFFECTED_FROM TIMESTAMP
);

insert into Nishan.Titles values('1','Manager','2016-02-20 00:00:00'),
('2','Executive','2016-06-11 00:00:00'),
('8','Executive','2016-06-11 00:00:00'),
('5','Manager','2016-06-11 00:00:00'),
('4','Asst. Manager','2016-06-11 00:00:00'),
('7','Executive','2016-06-11 00:00:00'),
('6','Lead','2016-06-11 00:00:00'),
('3','Lead','2016-06-11 00:00:00');


/*Answers*/
/*Q1*/
select FIRST_NAME as WORKER_NAME from nishan.workers;
/*Q2*/
select UPPER(FIRST_NAME) FROM nishan.workers;
/*Q3*/
select distinct department FROM Nishan.workers;
/*Q4*/
SELECT SUBSTRING(FIRST_NAME,1,3) FROM nishan.workers;
/*Q5*/
select instr(FIRST_NAME, BINARY’a’) from Nishan.workers where FIRST_NAME = ‘Amitabh’;
/*Q6*/
select RTRIM(FIRST_NAME) from nishan.workers;
/*Q7*/
select LTRIM(DEPARTMENT) from nishan.workers;
/*Q8*/
select distinct length(DEPARTMENT) from Nishan.workers;
/*Q9*/
select replace(FIRST_NAME,’a’,’A’ ) from nishan.workers;
/*Q10*/
select concat(FIRST_NAME,’ ‘, LAST_NAME) AS ‘COMPLETE_NAME’ from Nishan.workers;
/*Q11*/
select * from Nishan.workers order by FIRST_NAME asc;
/*Q12*/
select * from Nishan.workers order by FIRST_NAME asc,DEPARTMENT desc;
/*Q13*/
select * from Nishan.workers where FIRST_NAME in(‘Vipul’,’Satish’);
/*Q14*/
select * from Nishan.workers where FIRST_NAME not in (‘Vipul’,’Satish’);
/*Q15*/
select * from Nishan.workers where DEPARTMENT like ‘Admin’;
/*Q16*/
Select * from Nishan.Workers where FIRST_NAME like '%a%';
/*Q17*/
Select * from Nishan.Workers where FIRST_NAME like '%a';
/*Q18*/
Select * from nishan.Workers where FIRST_NAME like '_____h';
/*Q19*/
Select * from nishan.Workers where SALARY between 100000 and 500000;
/*Q20*/
Select * from nishan.Workers where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
/*Q21*/
SELECT COUNT(*) FROM nishan.workers WHERE DEPARTMENT = 'Admin';
/*Q22*/
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM nishan.workers 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM nishan.workers
WHERE Salary BETWEEN 50000 AND 100000);
/*Q23*/
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM nishan.workers 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;
/*Q24*/
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM nishan.Workers W
INNER JOIN nishan.Titles T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');
/*Q25*/
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM nishan.Titles
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;
/*Q26*/
SELECT * FROM nishan.Workers WHERE MOD (WORKER_ID, 2) <> 0;
/*Q27*/
SELECT * FROM nishan.Workers WHERE MOD (WORKER_ID, 2) = 0;
/*Q28*/
CREATE TABLE nishan.WorkersClone LIKE nishan.Workers;
/*Q29*/
(SELECT * FROM nishan.workers)
JOIN
(SELECT * FROM nishan.WorkerClone);
/*Q30*/
SELECT * FROM nishan.Workers
MINUS
SELECT * FROM nishan.Titles;
/*Q31*/
SELECT NOW();
/*Q32*/
SELECT * FROM nishan.Workers ORDER BY Salary DESC LIMIT 10;
/*Q33*/
SELECT TOP 1 Salary
FROM (
SELECT DISTINCT TOP n Salary
FROM nishan.Workers 
ORDER BY Salary DESC
)
ORDER BY Salary ASC;
/*Q34*/
SELECT Salary
FROM nishan.workers W1
WHERE n-1 = (
SELECT COUNT( DISTINCT ( W2.Salary ) )
FROM nishan.workers W2
WHERE W2.Salary >= W1.Salary
);
/*Q35*/
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from nishan.Workers W, nishan.Workers W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;
/*Q36*/
Select max(Salary) from nishan.Workers 
where Salary not in (Select max(Salary) from nishan.Workers);
/*Q37*/
select FIRST_NAME, DEPARTMENT from nishan.workers W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from nishan.Workers W1 where W1.DEPARTMENT='HR';
/*Q38*/
(SELECT * FROM nishan.workers)
JOIN
(SELECT * FROM nishan.WorkersClone);
/*Q39*/
SELECT * FROM nishan.workers
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from nishan.Workers);
/*Q40*/
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM nishan.workers GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;
/*Q41*/
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM nishan.workers GROUP BY DEPARTMENT;
/*Q42*/
Select * from nishan.workers where WORKER_ID = (SELECT max(WORKER_ID) from nishan.workers);
/*Q43*/
Select * from nishan.workers where WORKER_ID = (SELECT min(WORKER_ID) from nishan.workers);
/*Q44*/
SELECT * FROM nishan.workers WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM nishan.workers W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;
/*Q45*/
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from nishan.workers group by DEPARTMENT) as TempNew 
Inner Join nishan.workers t on TempNew.DEPARTMENT=t.DEPARTMENT 
and TempNew.TotalSalary=t.Salary;
/*Q46*/
SELECT distinct Salary from nishan.workers a WHERE 3 >= (SELECT count(distinct Salary) from nishan.workers b WHERE a.Salary <= b.Salary) order by a.Salary desc;
/*Q47*/
SELECT distinct Salary from nishan.workers a WHERE 3 >= (SELECT count(distinct Salary) from nishan.workers b WHERE a.Salary >= b.Salary) order by a.Salary desc;
/*Q48*/
SELECT distinct Salary from nishan.workers a WHERE n >= (SELECT count(distinct Salary) from nishan.workers b WHERE a.Salary <= b.Salary) order by a.Salary desc;
/*Q49*/
SELECT DEPARTMENT, sum(Salary) from nishan.workers group by DEPARTMENT;
/*Q50*/
SELECT FIRST_NAME, SALARY from nishan.workers WHERE SALARY=(SELECT max(SALARY) from nishan.workers);











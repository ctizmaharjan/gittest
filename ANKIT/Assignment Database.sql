Create database Ankit;
Use Ankit;
create table Ankit.workers(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INTEGER,
JOINING_DATE TIMESTAMP,
DEPARTMENT VARCHAR(25)
);

insert into Ankit.workers values
('001','Monika','Arora','100000','2014-02-20 09:00:00','HR'),
('002','Niharika','Verma','80000','2014-06-11 09:00:00','Admin'),
('003','Vishal','Singhal','300000','2014-02-20 09:00:00','HR'),
('004','Amitabh','Singh','500000','2014-02-20 09:00:00','Admin'),
('005','Vivek','Bhati','500000','2014-06-11 09:00:00','Admin'),
('006','Vipul','Diwan','200000','2014-06-11 09:00:00','Account'),
('007','Satish','Kumar','75000','2014-01-20 09:00:00','Account'),
('008','Geetika','Chauhan','90000','2014-04-11 09:00:00','Admin');


create table Ankit.Bonus(
WORKER_REF_ID INT,
FOREIGN KEY(WORKER_REF_ID) REFERENCES Ankit.Workers(WORKER_ID),
BONUS_DATE TIMESTAMP,
BONUS_AMOUNT INTEGER
);

insert into Ankit.Bonus values('1','2016-02-20 00:00:00','5000'),
('2','2016-06-11 00:00:00','3000'),
('3','2016-02-20 00:00:00','4000'),
('1','2016-02-20 00:00:00','4500'),
('2','2016-06-11 00:00:00','3500');


create table Ankit.Title(
WORKER_REF_ID INT,
FOREIGN KEY(WORKER_REF_ID) REFERENCES Ankit.Workers(WORKER_ID),
WORKER_TITLE VARCHAR(25),
AFFECTED_FROM TIMESTAMP
);

insert into Ankit.Title values('1','Manager','2016-02-20 00:00:00'),
('2','Executive','2016-06-11 00:00:00'),
('8','Executive','2016-06-11 00:00:00'),
('5','Manager','2016-06-11 00:00:00'),
('4','Asst. Manager','2016-06-11 00:00:00'),
('7','Executive','2016-06-11 00:00:00'),
('6','Lead','2016-06-11 00:00:00'),
('3','Lead','2016-06-11 00:00:00');


#Answers

#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>. 
select FIRST_NAME as WORKER_NAME from Ankit.workers;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(FIRST_NAME) FROM Ankit.workers;

#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department FROM Ankit.workers;

#Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM Ankit.workers;

##Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select instr(FIRST_NAME, BINARY’a’) from Ankit.workers where FIRST_NAME = ‘Amitabh’;

#Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME) from Ankit.workers;

#Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(DEPARTMENT) from Ankit.workers;

#Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(DEPARTMENT) from Ankit.workers;

##Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(FIRST_NAME,’a’,’A’ ) from Ankit.workers;

##Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(FIRST_NAME,’ ‘, LAST_NAME) AS ‘COMPLETE_NAME’ from Ankit.workers;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Ankit.workers order by FIRST_NAME asc;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Ankit.workers order by FIRST_NAME asc,DEPARTMENT desc;

##Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table. 
select * from Ankit.workers where FIRST_NAME in(‘Vipul’,’Satish’);

##Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table. 
select * from Ankit.workers where FIRST_NAME not in (‘Vipul’,’Satish’);

##Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from Ankit.workers where DEPARTMENT like ‘Admin’;

#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select * from Ankit.Workers where FIRST_NAME like '%a%';

#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select * from Ankit.Workers where FIRST_NAME like '%a';

#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
Select * from Ankit.Workers where FIRST_NAME like '_____h';

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
Select * from Ankit.Workers where SALARY between 100000 and 500000;

#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
Select * from Ankit.Workers where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM Ankit.workers WHERE DEPARTMENT = 'Admin';

#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM Ankit.workers 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM Ankit.workers
WHERE Salary BETWEEN 50000 AND 100000);

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM Ankit.workers 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

##Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Ankit.Workers W
INNER JOIN Ankit.Titles T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

##Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Ankit.Titles
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;


#Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Ankit.Workers WHERE MOD (WORKER_ID, 2) <> 0;

#Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Ankit.Workers WHERE MOD (WORKER_ID, 2) = 0;

#Q-28. Write an SQL query to clone a new table from another table. 
CREATE TABLE Ankit.WorkersClone LIKE Ankit.Workers;

##Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Ankit.workers)
JOIN
(SELECT * FROM Ankit.WorkerClone);
##Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Ankit.Workers
MINUS
SELECT * FROM Ankit.Titles;

#Q-31. Write an SQL query to show the current date and time.
SELECT NOW();

#Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT * FROM Ankit.Workers ORDER BY Salary DESC LIMIT 10;

##Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT TOP 1 Salary
FROM (
SELECT DISTINCT TOP n Salary
FROM Ankit.Workers 
ORDER BY Salary DESC
)
ORDER BY Salary ASC;
##Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method. 
SELECT Salary
FROM Ankit.workers W1
WHERE n-1 = (
SELECT COUNT( DISTINCT ( W2.Salary ) )
FROM Ankit.workers W2
WHERE W2.Salary >= W1.Salary
);

#Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Ankit.Workers W, Ankit.Workers W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;
#Q-36. Write an SQL query to show the second highest salary from a table.
Select max(Salary) from Ankit.Workers 
where Salary not in (Select max(Salary) from Ankit.Workers);
#Q-37. Write an SQL query to show one row twice in results from a table.
select FIRST_NAME, DEPARTMENT from Ankit.workers W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Ankit.Workers W1 where W1.DEPARTMENT='HR';
##Q-38. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Ankit.workers)
JOIN
(SELECT * FROM Ankit.WorkersClone);

#Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Ankit.workers
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Ankit.Workers);
#Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Ankit.workers GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;


#Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Ankit.workers GROUP BY DEPARTMENT;
#Q-42. Write an SQL query to show the last record from a table.
Select * from Ankit.workers where WORKER_ID = (SELECT max(WORKER_ID) from Ankit.workers);

#Q-43. Write an SQL query to fetch the first row of a table.
Select * from Ankit.workers where WORKER_ID = (SELECT min(WORKER_ID) from Ankit.workers);

#Q-44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM Ankit.workers WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Ankit.workers W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;

#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Ankit.workers group by DEPARTMENT) as TempNew 
Inner Join Ankit.workers t on TempNew.DEPARTMENT=t.DEPARTMENT 
and TempNew.TotalSalary=t.Salary;

#Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from Ankit.workers a WHERE 3 >= (SELECT count(distinct Salary) from Ankit.workers b WHERE a.Salary <= b.Salary) order by a.Salary desc;

#Q-47. Write an SQL query to fetch three min salaries from a table. 
SELECT distinct Salary from Ankit.workers a WHERE 3 >= (SELECT count(distinct Salary) from Ankit.workers b WHERE a.Salary >= b.Salary) order by a.Salary desc;

#Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary from Ankit.workers a WHERE n >= (SELECT count(distinct Salary) from Ankit.workers b WHERE a.Salary <= b.Salary) order by a.Salary desc;

#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, sum(Salary) from Ankit.workers group by DEPARTMENT;

#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Ankit.workers WHERE SALARY=(SELECT max(SALARY) from Ankit.workers);

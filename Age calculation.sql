--Important to remember: when calculating an age is important to cast the date using  ‘date’ :

select age(date’1800/01/01’)
--Result 200 year....

 --To calculate the age difference:
select age(date'1992/11/13', date'1800/01/01')

--to calculate an age from a date you can extract,
-- meaning if ou want to calculate age from 1984-09-02


  --if you want to extract a day from the entire date, it will be:
select extract(day from date '1984-09-02') as day
--Result:2

 --if you want to extract a day from the entire month, it will be:
select extract(month from date '1984-09-02') as day
--Result:9

--if you want to extract a day from the entire year, it will be:
select extract(year from date '1984-09-02') as day
--Result:1984

--to round a date, use trunc (trancate) and it will set a date to the lowest possible value,
--to the first day of the date, so it will be 1992/11/01, so you can trancate the date when, for example,
--you need to see sales from the first date of the month and last day of the month

select date_trunc('month', date '1992/11/13')-- will be 1992/11/01

select date_trunc('year', date '1992/11/13')-- will be 1992/01/01

Examples:
 * DB: Employees
 * Table: employees
 
--Question 1:
Convert the date of birsth of employees to their age:
SELECT AGE(birth_date),*
FROM employees


--Question 2: Get me all the employees above 60, use the appropriate date functions
SELECT AGE(birth_date), * FROM employees
WHERE (
   EXTRACT (YEAR FROM AGE(birth_date))
) > 60 ;

--or alternative:
select count(birth_date)
from employees
WHERE birth_date<now() - interval '61years';

--Excersises:
--/*
* DB: Employees
* Table: employees
  
--Question: How many employees where hired in February?
SELECT count(emp_no) FROM employees
where EXTRACT (MONTH FROM hire_date) = 2;


--Question: How many employees were born in november?
select count(emp_no)
from employees
WHERE extract(month from birth_date)=11;


* Question: Who is the oldest employee?
SELECT MAX(AGE(birth_date)) FROM employees;


/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT COUNT(orderid)
FROM orders
WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01';








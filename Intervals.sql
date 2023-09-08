--30 days before given date
--It can store and manipulate a period of time in years, month, days, minutes,seconds, etc
--you can say 30 days, 30 month and so on

--Examples
interval '1 year 2 month 3 days'
interval '2 weeks ago'
interval '1 year 3 hours 20 minuts'

--Like 
select current_date + interval '2 weeks ago';

--Extract with interval:
select
extract(
  year
  from 
  interval '5 years 20 month'
  );

--Result 6

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

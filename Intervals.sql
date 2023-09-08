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
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT * FROM employees;

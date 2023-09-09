
--3 tables Inner Join

--Select all salaries of employees, but only the once that led to the new title
--(not including a regular year over year inflation pro-rating)
--So let's say we know that the title changes followes 2 days after the salary raise and title tab has several keys to jpin with the other tables


select a.emp_no, b.salary, b.from_date,c.title
from employees as a
inner join salaries as b on b.emp_no = a.emp_no
inner JOIN titles as c on c.emp_no = a.emp_no 
AND (b.from_date + INTERVAL'2 days') =c.from_date
order by a.emp_no ASC, b.from_date ASC;

/*
You want to know the original salary and also know the salary at a promotion
*/
--Firstly WRONG code, so you might think to do following:
select a.emp_no, b.salary, b.from_date,c.title
from employees as a
inner join salaries as b on b.emp_no = a.emp_no
inner JOIN titles as c on c.emp_no = a.emp_no 
AND (b.from_date) =c.from_date
AND (b.from_date + INTERVAL'2 days') =c.from_date
order by a.emp_no ASC, b.from_date ASC;

--But you will get 0 returns in this case
/*
NOTE:
basically we want it to be either equal date OR the dates 2 days after
*/

select a.emp_no, b.salary, b.from_date,c.title
from employees as a
inner join salaries as b on b.emp_no = a.emp_no
inner JOIN titles as c 
on c.emp_no = a.emp_no 
AND (
b.from_date =c.from_date
OR (b.from_date + INTERVAL'2 days') =c.from_date
)
order by a.emp_no ASC, b.from_date ASC;



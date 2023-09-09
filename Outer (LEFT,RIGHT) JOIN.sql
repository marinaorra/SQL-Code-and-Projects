/*
What is i also need the rows that don't match?
Outer joins add data that don't have a match
You have left join will add the table that doesn't have a match on a table A(which is located on the left side)

So left join will allow us to count everyone who is not a department manager
left join = inner join + any additional records in the table

*/

select*
from <table A> as a
left[OUTER] JOIN <table B> as b
on a.id = b.id

/*
So you say let me find evrth where a.id=b.id (the golden intersection between the tables)
but it also it will return the data when a.id!=b.id from table A (left side table),
some value might be NULL

Any value that doesn't match is made to be null
*/


--Example:
--Question 1: 
--You want to know how many employee aren't managers?

--Firstly let's see how the data will be returned if we choose all employess titles
select emp.emp_no, dep.emp_no
from employees as emp
LEFT JOIN dept_manager as dep on emp.emp_no = dep.emp_no;

--but if you want to see who are the managers:
select emp.emp_no, dep.emp_no
from employees as emp
LEFT JOIN dept_manager as dep on emp.emp_no = dep.emp_no
where dep.emp_no is not null;
--we will see 24 managers

-- but if we did @is null'- we will se who are not managers
from employees as emp
LEFT JOIN dept_manager as dep on emp.emp_no = dep.emp_no
where dep.emp_no is null;
--Result: 300000


--Question 2:
--You want to know every salary raise and also know which ones were a promotion
--so to include all the salaries that didn't account to the title change
select a.emp_no, b.salary, b.from_date,c.title
from employees as a
inner join salaries as b on b.emp_no = a.emp_no
LEFT JOIN titles as c 
on c.emp_no = a.emp_no 
AND (
b.from_date =c.from_date
OR (b.from_date + INTERVAL'2 days') =c.from_date
)
order by a.emp_no ASC, b.from_date ASC;

--In this case we will see all raises the persons had, but bunch of NULLs

so now we can coalsec the titles:
select a.emp_no, b.salary, COALESCE(c.title, 'no title change') as "Title change"
from employees as a
inner join salaries as b on b.emp_no = a.emp_no
LEFT JOIN titles as c 
on c.emp_no = a.emp_no 
AND (
b.from_date =c.from_date
OR (b.from_date + INTERVAL'2 days') =c.from_date
)
order by a.emp_no ASC, b.from_date ASC;











  



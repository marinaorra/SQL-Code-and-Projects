
--3 tables Inner Join

--Select all salaries of employees, but only the once that led to the new title
--(not including a regular year over year inflation pro-rating)
--So let's say we know that the title changes followes 2 days after the salary raise and title tab has several keys to jpin with the other tables

--Also "USING" keyword can be used instead of ON in simple joins to clean the code
(example is down)

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

Examples:
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
--Option 1:
select*
from orders as o 
inner JOIN customers as c on o.customerid = c.customerid
where c.state in ('OH','NY','OR')
order by o.orderid;

--Option 2:
select c.firstname, c.lastname, o.totalamount, c.state, o.orderid
from orders as o 
inner JOIN customers as c on o.customerid = c.customerid
where c.state in ('OH','NY','OR')
order by o.orderid;

/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
select p.prod_id,p.title, p.actor, p.price, i.quan_in_stock
from products as p
left join "public"."inventory" as i on p.prod_id = i.prod_id; --it was no NULL in inventory so inner join will give the same result

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/

--Option1:
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp as de on e.emp_no=de.emp_no
inner join departments as d on de.dept_no = d.dept_no;

--Option 2:
SELECT e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN departments AS dp ON dp.dept_no = de.dept_no

--Also the same with "USING" keyword
SELECT e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de USING (emp_no)
INNER JOIN departments AS dp using (dept_no);


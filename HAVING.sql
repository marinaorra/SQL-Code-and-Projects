--"Having" is used when you want to filter groups
--HAVING Keyword is used after Group by
--So the order is following:
from 
where 
group by
having
select
order

--Example:
select col1, count(col2)
from<table>
where col2 > X
group by col1
having col1 ===Y;

--So WHERE applies filters to the individual roles, 
--and HAVING applies filters to a group as a whole

Example:
/*
*  Show me all amount of female employees that work in the departments where number of employees >25000
*  Database: Employees
*/

SELECT d.dept_name, count(e.emp_no) as "amount of employess"
FROM employees as e
inner join dept_emp as de USING(emp_no)
inner join departments as d using(dept_no)
where e.gender='F'
group by  d.dept_name
having count(e.emp_no)>25000;


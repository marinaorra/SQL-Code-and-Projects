--Question:
/*
*  Show me all the femaile employees that work in the department different developments sorted by the highest amount number in the department;
*  Database: Employees
*/

SELECT d.dept_name, count(e.emp_no) as "amount of employess"
FROM employees as e
inner join dept_emp as de USING(emp_no)
inner join departments as d using(dept_no)
where e.gender='F'
group by  d.dept_name
order by dept_name, count(e.emp_no) desc;

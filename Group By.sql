--Group By splits data into groups, caunts same as a Pivot table
--Group by apply functions against the group rather than the entire table
--We Use group by almost Exclusively with aggregate Functions
--Group by utilizes a SPLIT-APPLY-COMBINE-STRATEGY
--Order of operations in SQL:
---From-Where-Group By-Select-Order

--Example:
--How many employees work for each department?

Code:
select dept_no, count(emp_no)
from dept_emp
Group by dept_no;


--Question 1:
/*
*  How many people were hired on did we hire on any given hire date?
*  Database: Employees
*  Table: Employees
*/
SELECT hire_date, count(emp_no) as amount
FROM employees
group by hire_date
order by "amount" desc;

--Question 2:
/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT e.emp_no, e.first_name, e.last_name, count(t.title) as "amount of positions"
FROM employees as e
inner JOIN titles as t using(emp_no)
where (
EXTRACT(year from hire_date)
>=1991
)
GROUP by emp_no
order by emp_no;

--Or another option:
SELECT e.emp_no, count(t.title) as "amount of titles"
FROM employees as e
JOIN titles as t USING(emp_no)
WHERE EXTRACT (YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
ORDER BY e.emp_no;

--Question 3:
/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/
--Option 1:
SELECT e.emp_no, de.from_date, de.to_date, d.dept_name
FROM employees as e
inner join dept_emp as de USING(emp_no)
inner join departments as d using(dept_no)
where dept_name='Development'
group by e.emp_no,de.from_date, de.to_date, d.dept_name
order by e.emp_no,de.to_date;

--Option 2:
SELECT e.emp_no, de.from_date, de.to_date
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no, de.from_date, de.to_date
ORDER BY e.emp_no, de.to_date;

--Question 4:
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

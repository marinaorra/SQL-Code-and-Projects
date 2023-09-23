--Key Purpose to execute some analitics within the given window 
--(like compare each salary within department vs max salary in the department)

--Window Functions create a new column based on functions performed on a subset or
--"window" of the data
--https://www.udemy.com/course/complete-sql-databases-bootcamp-zero-to-mastery/learn/lecture/21714378#content

/*
Example:
What if i want to show smth beside mt row based on the group calculation, like
If i like to make a calculation of the average salary in the department and right next to it to put my average salary to see
how far i am from the collegues?
*/

--Basic Sintacs of Window Functions
Window_function(arg1,arg2,..) OVER (  --takes arguments over the suset of data
  [partition by partition_expression]
  [order by sort_expression [asc/desc] [nulls {first/last}]];
--Window function applies against each row, so if you apply for 10 mil records 10 mil times it will be calculated

--Example 1:
--Let's see the maximum salary for each individual:
select
*,
MAX (salary) OVER()
From salaries; -- so this will show each and every salary per employee vs max salary

--To limit results we can apply a limit:
select
*,
MAX (salary) OVER()
From salaries
LIMIT 100;
--This will take the max salary from the entire data set and take only 100 first rows

--If you want to filter by smth, for example, where salaries <70000:
select
*,
MAX (salary) OVER()
From salaries
where salary<70000;
--this applies a filter of max salary to be 70,000 and show all employess who gets less

/*
If i like to make a calculation of the average salary in the department and right next to it to put my average salary to see
how far i am from the collegues?
*/
SELECT 
*,
avg(salary) over(
PARTITION by d.dept_name
)
from salaries
join dept_emp as de using(emp_no)
join departments as d using(dept_no);

--ORDER BY in the Window Function (it changes a frame in the window, so you say take evrth before me and myself)--
--Framing in Window Function:

--Example 1:
--Let's see the maximum salary for each individual:
SELECT emp_no, dept_name, salary,
max(salary) over(
PARTITION by d.dept_name
)
from salaries
join dept_emp as de using(emp_no)
join departments as d using(dept_no);

--Example 2:
--Let's see the current salary for each individual (assuming that the current salary not nessesaraly will be the max one):

select distinct e.emp_no, e.first_name, d.dept_name,
last_value(s.salary) OVER (
PARTITION by e. emp_no
order by s.from_date
range between unbounded preceding and UNBOUNDED following
) as "Current Salary"
from salaries as S
join employees as e using (emp_no)
join dept_emp as de using (emp_no)
JOIN departments as d using (dept_no)
order BY e.emp_no;






















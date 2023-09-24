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

--LAST_VALUE Function:
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

--Min/Max Function:
Example 3:
--Show how the current price of the prices states vs the cheapest price in the category itself:
select prod_id, price, category, 
min(price) over(PARTITION by category) as "Cheapest price"
from products;

--SUM Function:

SELECT 
o.orderid,
o.customerid,
o.netamount,
sum (o.netamount) over( PARTITION by o.customerid) as "cutomer sum"
from orders as o
order by o.customerid

--Or to get an acumulative sum of the previous row it will be:
SELECT 
o.orderid,
o.customerid,
o.netamount,
sum (o.netamount) over( PARTITION by o.customerid
order by o.orderid)
as "cutomer sum"
from orders as o
order by o.customerid


--Row_Number--
  --If i want to see what is the position of the product in my category i can use row number:
  
SELECT 
prod_id, price, category,
row_number() over(
PARTITION BY category
order by price
)
as "position in the category"
from products;

/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

--Option 1:
SELECT
  DISTINCT continent,
  SUM(population) OVER w1 as"continent population"
FROM country 
WINDOW w1 AS( PARTITION BY continent );




--Option 2:
select distinct continent,
sum(population) over (PARTITION BY continent)
as "total population"
from country;



/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

SELECT
  DISTINCT continent,
  SUM(population) OVER w1 as"continent population",
  CONCAT( 
      ROUND( 
          ( 
            SUM( population::float4 ) OVER w1 / 
            SUM( population::float4 ) OVER() 
          ) * 100    
      ),'%' ) as "percentage of population"
FROM country 
WINDOW w1 AS( PARTITION BY continent );

/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

SELECT 
DISTINCT r.id, 
r."name", 
COUNT(t.id) OVER (
    PARTITION BY r.id
    ORDER BY r."name"
) AS "# of towns"
FROM regions AS r
JOIN departments AS d ON r.code = d.region 
JOIN towns AS t ON d.code = t.department
ORDER BY r.id;














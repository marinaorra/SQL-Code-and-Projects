--https://www.udemy.com/course/complete-sql-databases-bootcamp-zero-to-mastery/learn/lecture/21714368#content
/*
https://www.udemy.com/course/complete-sql-databases-bootcamp-zero-to-mastery/learn/lecture/21714368#content
How can we combine different outcomes from groups?
UNION: -- to combine the results from one select set with another one
Select col1, SUM(col2)
FROM table
GROUP BY col1
UNION
SELECT SUM(col2)
FROM table
UNION ALL and UNION Difference:
UNION All doesn’t remove duplicates records
*/

--Example:
--Select the orders per each prodct id group including NULL product is values
(--or just for all of them but NULL values are present there so it's importnat to remember)!

--Option 1:
select null as "prod_id", sum(ol.quantity)
from orderlines as ol

UNION

select prod_id as "prod_id", sum(ol.quantity)
from orderlines as ol
GROUP by prod_id 
order by prod_id  desc;

--Option 2:--if you want to do the same in 1 quiry, you should use GROUP SET:
select prod_id as "prod_id", orderlineid, sum(ol.quantity)
from orderlines as ol
GROUP by 
GROUPING sets (
(),
(prod_id),
(orderlineid)

)
order by prod_id desc, orderlineid DESC;






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


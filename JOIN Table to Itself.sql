/*
Let's say you want to see who is a superviser to whom in a company with 500 employess and this data is representated 
in the same table
*/
--Solution:
--We will select from the same table from employee as a and as b
select a.id,a.name as "employee", b.name
as "supervisor name"
from employee as a, employee as b
where a.supervisorid = b.id;

--or we could do the same with inner join:
select a.id,a.name as "employee", b.name
as "supervisor name"
from employee as a
INNER JOIN employee as b
ON a.supervisorid = b.id;
--SELF JOIN basically the same as a self join, only in the self jpin if primary and 
--foreign key are the same key that references the same information

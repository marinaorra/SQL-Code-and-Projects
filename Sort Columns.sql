select*
from customers
order by<column> (ASC/DESC)-- to sort in ascendening or descending fashion

--ASC fashion:
select*
from customers
order by<name> ASC

--Multiple columns sorting:
--per say Postgre sorts in ASC fashion
-- to multiply few columns in DESC fashion you need to specify each column:
select first_name, last_name
from employess,
order by first_mane DESC, last_name DESC;


--To select by the length of the name for example:
select first_name,last_name
from employees
order by length(first_name) DESC;

--so any special keyword can be used like 'length' to sort in a way you need





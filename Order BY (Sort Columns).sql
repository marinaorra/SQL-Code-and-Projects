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

--Excersises:
--Question 1:
--Filter the emploeeys with age >60 and order it by age in desc manner:

select age(birth_date),first_name,last_name
from employees
where (
EXTRACT(year from age(birth_date))
)>60
order by age DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
SELECT * FROM employees
WHERE first_name ILIKE 'k%'
ORDER BY hire_date;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
SELECT * FROM employees
ORDER BY first_name ASC, last_name DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/
SELECT * FROM employees
ORDER BY birth_date;






--Select statement the name of one employee only
select first_name, last_name from employees
  --filter on the first name AND last name to limit the amount of data returned
  --and focus the filtering on single person

where first_name= 'Mayumi' and last_name='Schueller';--filter here on one employee
/*
filter on the first name AND last name to limit the amount of data returned
and focus the filtering on single person
*/

--Make multiple search criteria:
--Question 1:
--How many female customers do we have from the state of oregon (OR) and new york (NY)
SELECT firstname, lastname, gender from customers
where (state='OR' OR state='NY') AND gender='F';
/*
1. SQL executes the calculation in a specific order similar to linier algebra
Meaning that the same filtering will be aplied when "AND" function is used, but 
once "OR" is added, it will run a new filtering
2. So in order to apply "OR" filtering combing to the same "AND" request we should use ()
similar to algebra

Example: 
where (state='OR' OR state='NY') AND gender='F';
in this case gender F were asked to apply to the function in breckets
*/

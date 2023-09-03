--Select statement the name of one employee only
select first_name, last_name from employees
  --filter on the first name AND last name to limit the amount of data returned
  --and focus the filtering on single person

where first_name= 'Mayumi' and last_name='Schueller';--filter here on one employee
/*
filter on the first name AND last name to limit the amount of data returned
and focus the filtering on single person
*/

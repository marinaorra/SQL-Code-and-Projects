--Question 1: How many customers aren't 55?

SELECT firstname, lastname, gender from customers
where NOT age='55';

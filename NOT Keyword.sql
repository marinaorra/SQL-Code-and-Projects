--Question 1: How many customers aren't 55?

--Example 1:
SELECT firstname, lastname, gender from customers
where NOT age='55';

--Example 2:
SELECT firstname, lastname, gender from customers
where NOT age='55' and NOT age=54;

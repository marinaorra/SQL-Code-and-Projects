/*LIKE  and ILIKE (Insensitive Matching) Keyword (Partial Lookups (if you don’t know exactly what are you looking for to find 
part of information)), like all names starting with G end with R, all numbers with 2 and _ _ two other numbers after and so on
Like is case sensetive, if you wanna to make sure that all results will be shown better to use ILIKE which is not case sensitive
*/

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/
SELECT ..., EXTRACT (YEAR FROM AGE(birth_date)) as "age" FROM employees; --this will calculate the number of years till date 
from the date of birth date!!!!!!!!

--Correct Code:
SELECT first_name, last_name, EXTRACT (YEAR FROM AGE(birth_date)) as "age" FROM employees
where first_name ilike 'M%';

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/
--Correct Code:
select count (emp_no)
from employees
where first_name ilike'A%R';

                                                  
/* EXAMPLE WHERE NUMBER NEEDS TO BE CASTED TO TEXT (transformed)
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/
--Correct Code:
SELECT count(customerid) FROM customers
WHERE zip::text ilike'%2%';


/*EXAMPLE WHERE NUMBER NEEDS TO BE CASTED TO TEXT (transformed)
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/
--Correct Code:
SELECT count(customerid) FROM customers
WHERE zip::text ilike '2_1%'

/*EXAMPLE WHERE NUMBER NEEDS TO BE CASTED TO TEXT (transformed)
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/
--Correct Code:
select COALESCE(state, 'No state') as "state"
from customers
where phone::text ILIKE'302%'; 

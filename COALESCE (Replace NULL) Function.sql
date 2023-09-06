select coalesce (name, 'no name available'), last_name from student;

--Examples:
--Used DB: https://www.db-fiddle.com/f/21FVhjkm56zizVohQKMTQg/0

* Question: 
* Assuming a students minimum age for the class is 15, what is the average age of a student?
*
* 30.4000000000000000
SELECT avg(coalesce(age, 15)) FROM "Student";

/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Replace all empty first or last names with a default?
*/
SELECT id, coalesce(name, 'fallback'), coalesce(lastName, 'lastName'), age FROM "Student";

/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/Correct answer
SELECT COALESCE(address2, 'No Address')
FROM customers

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/Correct answer

SELECT *
FROM customers
WHERE address2 IS NOT null;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/Correct answer

SELECT coalesce(lastName, 'Empty'), * from customers
where (age IS NULL);

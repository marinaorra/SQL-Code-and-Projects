--Aggregative functions are for counting the total numbers like sum, count, avg, min, max

--Question 1: Count how many employes in total working in the company:
select count(emp_no) from employees;
--Result:
300024

--Question 2: Get the highest salary available:
select max(salary) from salaries;

--Question 3:Get the total amount of salaries paid:
select count(salary) from salaries;

--Question 4: What year was the youngest! person born in the company?
select max(birth_date) from employees;
--Result:
1965-02-01

--Question 5: How many towns are there in france?
select count('name') from towns;
--Result:
36684

-- Question 1: How many official languages are there?
-- Table: countrylanguage
-- Result: 238
select count(countrycode) from countrylanguage
where isofficial = true;

-- Question 2: What is the average life expectancy in the world?
-- Table: country
-- Result: 66.48603611164265
select avg(lifeexpectancy) from country;

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
-- Result: 185001
select AVG(population) from city
where countrycode = 'NLD';



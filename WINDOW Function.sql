--Window Functions create a new column based on functions performed on a subset or
--"window" of the data
--https://www.udemy.com/course/complete-sql-databases-bootcamp-zero-to-mastery/learn/lecture/21714378#content

/*
Example:
What if i want to show smth beside mt row based on the group calculation, like
If i like to make a calculation of the average salary in the department and right next to it to put my average salary to see
how far i am from the collegues?
*/

--Basic Sintacs of Window Functions
Window_function(arg1,arg2,..) OVER (  --takes arguments over the suset of data
  [partition by partition_expression]
  [order by sort_expression [asc/desc] [nulls {first/last}]];
--Window function applies against each row, so if you apply for 10 mil records 10 mil times it will be calculated

--Example 1:
--Let's see the maximum salary for each individual:




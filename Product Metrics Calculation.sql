--Basic quiry:
select*
from users
limit 5 -- to show only the first 5 columns

--Activation Rate- quntity of the activated users (e-mail with confirmation or any other)
column- is active in his table shows 1 or 0- meaning true or false who activated or noor

--to calculate all users who registered:
select count*
from users

--Who activated there accounts:
row is_active only 1 or 0, so 
select sum (is_active)/count(*)
from users

Result will be 0 because Postgre works only will full number
right code in %:
select sum (is_active)*100.0/count(*)
from users
or
right code in 0,888:
select sum (is_active)*1.0/count(*)
from users
or
select round(is_active)*100.0/count(*)
from users

--MAU Metric- how many UNIQUE users are using our platform
--It should be 1 number as a result

select*
from userentry
limit 5

--1. we need to take out information about the year and month, to define the period first

select to_char(entry_at, 'YYYY-MM') as YM, user_id
from userentry
limit 5

--2. we need to group the data in that table
select to_char(entry_at, 'YYYY-MM') as YM, count(distinct user_id) as cnt
from userentry
group by YM -- to sum up similar data (like pivot table combines the data and shows the sum)
order by 1 -- to sort on the first field
--As a result we will have a table, but result should be only 1 number

--3.As a result we will have a table, but result should be only 1 number


with pre_mau as(
select to_char(entry_at, 'YYYY-MM') as YM, count(distinct user_id) as cnt
from userentry
group by YM
)

--3 ways to calculate now MAU:
--1 Option:
select avg(cnt)
from pre_mau
--the data will not show the difference in year, like in 2020 less than in 2023
--2 Option:
for the last 5 month
with pre_mau as(
select to_char(entry_at, 'YYYY-MM') as YM, count(distinct user_id) as cnt
from userentry
group by YM
order by YM desc
limit 5 --to limit 5 month to see the unique limits
)
--3. Option 3
with pre_mau as(
select to_char(entry_at, 'YYYY-MM') as YM, count(distinct user_id) as cnt
from userentry
group by YM
order by YM desc
limit 1 --to limit last month to see the unique limits
)


--Option 4:
calculate mediana ( to take the middle number, like from the salary from 10 to 1000, it will take an average):

select percentle_cont(0.5) within group(order by cnt) as MAU --percent_cont is divide the number by the number mentioned
from pre_mau








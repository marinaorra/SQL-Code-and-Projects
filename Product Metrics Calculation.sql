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









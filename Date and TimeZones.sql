--in order to check the set timezone of the database run:
show timezone;

--To establish a timezone for your database to be used as a standard run:
alter USER postgres set timezone='UTC';

--Reconnect yourdata base and it should be changed to UTC

--insert into timezones Values(
--TIMESTAMP WITHOUT TIME ZONE '2000-01-01 10:00:00-05',
--TIMESTAMP WITH TIME ZONE '2000-01-01 10:00:00-05'
);


--To get the current date:
select NOW()::date;
or
select CURRENT_DATE;
--the date will be showen in a formated in ISO standart(yy-mm-dd) :1800/01/01


--format the way of the representaion of the current date format use: TO_CHAR
SELECT TO_CHAR(current_date, 'dd/mm/yyyyy');

--to get the current week:
SELECT TO_CHAR(current_date, 'WW');



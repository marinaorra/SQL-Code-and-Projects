--in order to check the set timezone of the database run:
show timezone;

--To establish a timezone for your database to be used as a standard run:
alter USER postgres set timezone='UTC';

--Reconnect yourdata base and it should be changed to UTC


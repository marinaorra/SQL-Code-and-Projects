-- If you want to see all orders by yeach year, month, day with totals, you can use ROLL UP:

select extract(year from orderdate) as "year",
       extract(MONTH from orderdate) as "month",
       extract(day from orderdate) as "day",
       sum(ol.quantity)
from orderlines as ol
group by 
    ROLLUP (
       extract(year from orderdate),
       extract(MONTH from orderdate),
       extract(day from orderdate)
    )

order by 
       extract(year from orderdate),
       extract(MONTH from orderdate),
       extract(day from orderdate)

--By Year and Month only (like year and month sales analytics i did):
select extract(year from orderdate) as "year",
       extract(MONTH from orderdate) as "month",
       sum(ol.quantity)
from orderlines as ol
group by 
    ROLLUP (
       extract(year from orderdate),
       extract(MONTH from orderdate)
    )

order by 
       extract(year from orderdate),
       extract(MONTH from orderdate);






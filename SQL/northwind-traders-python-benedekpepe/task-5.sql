SELECT  EXTRACT('year' from DATE_TRUNC('month',order_date)) as year,
        EXTRACT('month' from DATE_TRUNC('month',order_date)) as month
FROM orders
where order_date>='1997-01-01'::date and order_date <= '1997-12-31'::date 
group by DATE_TRUNC('month',order_date), DATE_TRUNC('year',order_date)
order by month asc
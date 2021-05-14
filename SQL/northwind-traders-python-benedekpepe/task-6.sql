select customers.company_name, count(customers.company_name) as orders, string_agg(orders.order_id::character varying, ',' ORDER BY orders.order_id) as order_ids
from customers
left join orders on customers.customer_id=orders.customer_id
where customers.country='USA'
group by customers.company_name
having count(customers.company_name) < 5
order by orders

select customers.customerName, count(orders.status)
from customers
right join orders on orders.customerNumber=customers.customerNumber
where orders.status in ("Shipped")
group by customers.customerName
having count(orders.status)>4
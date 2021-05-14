select customers.customerName, orders.orderNumber, sum(orderdetails.quantityOrdered*orderdetails.priceEach)
from customers
left join orders on orders.customerNumber=customers.customerNumber
left join orderdetails on orderdetails.orderNumber=orders.orderNumber
group by orders.orderNumber
order by sum(orderdetails.quantityOrdered*orderdetails.priceEach) desc limit 10
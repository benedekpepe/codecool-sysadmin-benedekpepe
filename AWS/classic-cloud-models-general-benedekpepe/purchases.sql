select products.productName, min(orders.orderDate), count(orderdetails.orderNumber)
from orders
right join orderdetails on orderdetails.orderNumber=orders.orderNumber
right join products on products.productCode=orderdetails.productCode
where orderdetails.quantityOrdered is not null
group by products.productName

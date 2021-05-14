select concat(employees.firstName, employees.lastName), customers.customerNumber, customers.customerName, orders.orderNumber
from customers
inner join employees on employees.employeeNumber=customers.salesRepEmployeeNumber
left join orders on orders.customerNumber=customers.customerNumber 
/* where customers.customerNumber not in (select customerNumber from orders) and concat(employees.firstName, employees.lastName) is not null */
where orders.orderNumber is null

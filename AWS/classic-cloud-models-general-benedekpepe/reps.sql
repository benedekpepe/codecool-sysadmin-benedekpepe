select customers.customerName, employees.lastName, employees.firstName
from customers
inner join employees on employees.employeeNumber=customers.salesRepEmployeeNumber
order by customers.customerName asc
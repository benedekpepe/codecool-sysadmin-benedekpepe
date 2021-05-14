SELECT country,
COUNT(customer_id) as number_of_customers 
FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5
ORDER BY number_of_customers desc
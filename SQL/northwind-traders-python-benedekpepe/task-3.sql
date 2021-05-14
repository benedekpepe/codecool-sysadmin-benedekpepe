SELECT product_name,
round(sum(order_details.unit_price * quantity * (1 - discount))) as sum
FROM products
LEFT JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_id
ORDER BY sum LIMIT 10

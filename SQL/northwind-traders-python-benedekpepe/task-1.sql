SELECT product_name AS product, company_name AS company
FROM suppliers
LEFT JOIN products ON suppliers.supplier_id = products.supplier_id
ORDER BY product_name
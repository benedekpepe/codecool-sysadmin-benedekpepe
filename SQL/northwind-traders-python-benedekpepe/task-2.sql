SELECT category_name AS category,
count(product_id) AS number_of_products
from categories
left join products on products.category_id = categories.category_id
group by categories.category_id
order by number_of_products desc
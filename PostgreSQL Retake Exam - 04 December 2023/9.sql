SELECT
	d.name as distributor_name,
	i.name as ingredient_name,
	p.name as product_name,
	AVG(rate) as avarage_rate
FROM
	ingredients i
	JOIN distributors d ON d.id = i.distributor_id
	JOIN products_ingredients pi ON pi.ingredient_id = i.id
	JOIN products p ON pi.product_id = p.id
	JOIN feedbacks f ON f.product_id = p.id
GROUP BY d.name,i.name,p.name
HAVING AVG(rate) BETWEEN 5 AND 8
ORDER BY distributor_name,ingredient_name, product_name
;
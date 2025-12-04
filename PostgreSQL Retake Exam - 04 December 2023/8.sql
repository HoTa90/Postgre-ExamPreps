SELECT
	i.name as ingredient_name,
	p.name as product_name,
	d.name as distributor_name
FROM
	ingredients i
	JOIN distributors d ON d.id = i.distributor_id
	JOIN products_ingredients pi ON pi.ingredient_id = i.id
	JOIN products p ON pi.product_id = p.id
WHERE i.name ILIKE '%mustard%' AND d.country_id = 16
ORDER BY
	product_name
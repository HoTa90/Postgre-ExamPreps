SELECT
	f.product_id,
	f.rate,
	f.description,
	c.id as customer_id,
	c.age,
	c.gender
FROM
	feedbacks f
JOIN customers c
	ON c.id = f.customer_id
WHERE f.rate < 5.0 AND (c.gender = 'F' and c.age > 30)
ORDER BY f.product_id DESC
;
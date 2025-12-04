UPDATE 
	products
SET 
	price = 1.1 * price
WHERE id IN
	(SELECT product_id from feedbacks WHERE rate > 8)
SELECT
	p.name as product_name,
	ROUND(AVG(p.price), 2) as average_price,
	Count(f.product_id) as total_feedbacks
from
	products p
	JOIN feedbacks f on p.id = f.product_id
WHERE
	p.price > 15 
GROUP BY
	p.name
HAVING 
	Count(f.product_id) > 1
ORDER BY
	total_feedbacks, average_price DESC
;
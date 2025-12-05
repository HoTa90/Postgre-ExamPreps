select
	p.id,
	p.title,
	pi.duration,
	ROUND(pi.budget, 1) as budget,
	TO_CHAR(pi.release_date, 'MM-YY') as release_date 
from
	productions p
	JOIN productions_info pi ON pi.id = p.production_info_id
WHERE EXTRACT(YEAR FROM pi.release_date) BETWEEN 2023 AND 2024
 	AND pi.budget > 1500000
ORDER BY budget, pi.duration DESC, p.id
LIMIT 3
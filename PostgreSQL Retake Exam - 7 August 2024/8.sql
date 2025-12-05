SELECT
	c.name,
	count(p.id) as productions_count,
	COALESCE(AVG(pi.budget), 0) as avg_budget
FROM
	countries c
	JOIN productions p ON p.country_id = c.id
	JOIN productions_Info pi ON pi.id = p.production_info_id
GROUP BY
	c.name
HAVING count(p.id) > 0
ORDER BY productions_count desc, c.name;
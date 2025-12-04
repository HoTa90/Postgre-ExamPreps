SELECT
	b.id,
	b.name,
	b.release_year,
	c.name as category_name
FROM 
	board_games b
JOIN 
	categories c
ON
	b.category_id = c.id
WHERE c.name in ('Strategy Games', 'Wargames')
ORDER BY
	b.release_year DESC
;
SELECT
	b.name,
	b.rating,
	c.name as category_name
FROM
	board_games b
JOIN
	categories c
		ON b.category_id = c.id
JOIN players_ranges p
		ON b.players_range_id = p.id
WHERE (b.rating > 7.00 AND b.name LIKE '%A%')
		OR (b.rating > 7.50 AND p.min_players >=2 AND p.max_players <=5)
ORDER BY 
	b.name, b.rating DESC
LIMIT 5
;
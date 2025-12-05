SELECT
	t.id as team_id,
	t.name as team_name,
	COUNT(p.id) as player_count,
	t.fan_base
FROM
	teams t
	LEFT JOIN players p ON p.team_id = t.id
GROUP BY
	t.id
HAVING
	fan_base > 30000
ORDER BY
	player_count DESC,
	fan_base DESC
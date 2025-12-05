
SELECT
	c.first_name || ' ' || c.last_name as coach_full_name,
	p.first_name || ' ' || p.last_name as player_full_name,
	t.name as team_name,
	s.passing,
	s.shooting,
	s.speed
FROM
	coaches c
JOIN players_coaches pc ON c.id = pc.coach_id
JOIN players p ON pc.player_id = p.id
JOIN teams t ON t.id = p.team_id
JOIN skills_data s ON s.id = p.skills_data_id
ORDER BY
	coach_full_name, player_full_name DESC;
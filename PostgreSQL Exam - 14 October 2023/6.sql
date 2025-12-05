SELECT
	p.id,
	CONCAT(p.first_name, ' ', p.last_name) as full_name,
	p.age,
	p.position,
	p.salary,
	s.pace,
	s.shooting
FROM
	players p
	JOIN skills_data s ON s.id = p.skills_data_id
WHERE
	p.team_id IS NULL
	AND p.position = 'A'
	AND s.pace + s.shooting > 130
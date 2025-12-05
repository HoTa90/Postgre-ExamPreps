INSERT INTO
	actors (
		first_name,
		last_name,
		birthdate,
		height,
		awards,
		country_id
	)
SELECT
	REVERSE(first_name),
	REVERSE(last_name),
	birthdate - INTERVAL '2 days' as birthdate,
	COALESCE(height + 10, 10) as height,
	country_id as awards,
	(
		SELECT
			id
		FROM
			countries
		where
			name = 'Armenia'
	) as country_id
FROM
	actors
WHERE
	id BETWEEN 10 AND 20
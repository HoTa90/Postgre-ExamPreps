SELECT 
	name, EXTRACT(YEAR FROM birthdate) as birth_year, animal_type
FROM
	animals as a
JOIN
	animal_types as at
		ON at.id = a.animal_type_id
WHERE
	at.animal_type <> 'Birds'
		AND 
	birthdate > ('2022-01-01'::date - INTERVAL '5 years')
		AND a.owner_id IS NULL
ORDER BY a.name
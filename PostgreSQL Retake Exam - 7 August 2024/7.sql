SELECT
	first_name || ' ' || last_name as full_name,
	LOWER(LEFT(first_name, 1)) || LOWER(RIGHT(last_name, 2)) || LENGTH(last_name) || '@sm-cast.com' as email,
	awards
from
	actors
WHERE
	id not in (
		select
			actor_id
		from
			productions_actors
	)
ORDER BY awards DESC, id
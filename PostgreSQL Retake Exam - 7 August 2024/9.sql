SELECT 
	p.title as title,
	CASE
		WHEN pi.rating <= 3.50 THEN 'poor'
		WHEN pi.rating <= 8.00 THEN 'good'
		ELSE 'excellent'
	END as rating,
	CASE
		WHEN pi.has_subtitles IS TRUE THEN 'Bulgarian'
		ELSE 'N/A'
	END as subtitles,
	COUNT(pa.actor_id) as actors_count
	
FROM productions p
JOIN productions_info pi ON p.production_info_id = pi.id
JOIN productions_actors pa ON pa.production_id = p.id
GROUP BY p.title, pi.rating, pi.has_subtitles
ORDER BY rating, actors_count DESC, title
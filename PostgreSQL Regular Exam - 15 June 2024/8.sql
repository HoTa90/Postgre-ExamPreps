SELECT
	p.id as photo_id,
	COUNT(DISTINCT l.id) AS likes_count,
	COUNT(DISTINCT c.id) AS comments_count
FROM
	photos p
	LEFT JOIN likes l ON l.photo_id = p.id
	LEFT JOIN comments c ON c.photo_id = p.id
GROUP BY
	p.id
ORDER BY
	likes_count DESC,
	comments_count DESC,
	photo_id ASC
;
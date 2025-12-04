SELECT p.id as photo_id, p.capture_date, p.description, COUNT(c.photo_id) as comments_count FROM photos p
JOIN comments c on c.photo_id = p.id
GROUP BY p.id
HAVING p.description IS NOT NULL
ORDER BY comments_count DESC, photo_id
LIMIT 3

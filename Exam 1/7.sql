SELECT o.name as owner, COUNT(*) as count_of_animals FROM animals as a
JOIN owners as o ON o.id = a.owner_id
GROUP BY o.name
ORDER BY count_of_animals DESC, o.name
LIMIT 5

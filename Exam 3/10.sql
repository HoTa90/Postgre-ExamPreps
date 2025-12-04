SELECT
    c.last_name,
    CEIL(AVG(bg.rating)) AS avarage_rating,
	p.name AS publisher_name
FROM creators c
 JOIN creators_board_games cbg ON cbg.creator_id = c.id
JOIN board_games bg ON cbg.board_game_id = bg.id
JOIN publishers p ON bg.publisher_id = p.id
GROUP BY c.last_name, p.name
HAVING p.name = 'Stonemaier Games'
ORDER BY avarage_rating DESC
;
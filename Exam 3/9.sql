SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.email,
    MAX(bg.rating) as rating
FROM creators c
JOIN creators_board_games cbg ON cbg.creator_id = c.id
JOIN board_games bg ON cbg.board_game_id = bg.id
GROUP BY
    c.first_name,
    c.last_name,
    c.email
HAVING
    c.email LIKE '%.com'
ORDER BY full_name
;
CREATE OR REPLACE FUNCTION fn_creator_with_board_games(creator_first_name VARCHAR(30))
RETURNS INT AS $$
DECLARE
   result_count INT;
BEGIN
	SELECT 
		COUNT(cbg.board_game_id) INTO result_count
	FROM 
		creators c
	LEFT JOIN
		creators_board_games cbg ON c.id = cbg.creator_id
	GROUP BY
		c.first_name
	HAVING c.first_name = creator_first_name;

    RETURN result_count;
END;
$$ LANGUAGE plpgsql;
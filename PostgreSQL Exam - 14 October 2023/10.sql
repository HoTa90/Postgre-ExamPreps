CREATE OR REPLACE PROCEDURE sp_players_team_name (
	IN player_name VARCHAR(50),
	OUT team_name VARCHAR(50)
) LANGUAGE plpgsql AS $$
DECLARE
	result VARCHAR(50);
BEGIN

	SELECT t.name into result FROM
	players p 
	LEFT JOIN teams t on p.team_id = t.id
	WHERE CONCAT(p.first_name, ' ', p.last_name) = player_name;

	IF result is NULL
	THEN team_name := 'The player currently has no team';
	ELSE
	 team_name := result;
	END IF;

END;
$$;
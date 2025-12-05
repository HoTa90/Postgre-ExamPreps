CREATE OR REPLACE PROCEDURE udp_awarded_production (
    IN production_title VARCHAR(70))
LANGUAGE plpgsql
AS $$
BEGIN

	UPDATE 
		actors
	SET 
		awards = awards + 1
	WHERE id IN (
		SELECT a.id from actors a
		LEFT JOIN productions_actors pa ON pa.actor_id = a.id
		LEFT JOIN productions p ON p.id=pa.production_id
		where p.title = production_title);
END;
$$
;
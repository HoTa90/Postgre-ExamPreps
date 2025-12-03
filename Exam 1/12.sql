CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    OUT result VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    owner_name VARCHAR;
BEGIN
    SELECT o.name INTO owner_name
    FROM animals a
    LEFT JOIN owners o ON o.id = a.owner_id
    WHERE a.name = animal_name;

    IF owner_name IS NULL THEN
        result := 'For adoption';
    ELSE
        result := owner_name;
    END IF;
END;
$$;
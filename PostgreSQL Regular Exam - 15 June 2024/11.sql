CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30)) 
LANGUAGE plpgsql
AS $$
DECLARE
    found_id INT;
BEGIN

    SELECT a.account_id
    INTO found_id
    FROM addresses a
    WHERE a.street = address_street
      AND a.town = address_town;


    IF found_id IS NOT NULL THEN
        UPDATE accounts
        SET job_title = '(Remote) ' || job_title
        WHERE id = found_id;
    END IF;

END;
$$
;
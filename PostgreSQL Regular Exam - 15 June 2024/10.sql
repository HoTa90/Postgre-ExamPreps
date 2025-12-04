CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT AS
$$
DECLARE
    result_count INT;
BEGIN
    SELECT COUNT(ap.photo_id)
    INTO result_count
    FROM accounts a
    LEFT JOIN accounts_photos ap ON ap.account_id = a.id
    WHERE a.username = account_username;

    RETURN result_count;
END;
$$ LANGUAGE plpgsql
;
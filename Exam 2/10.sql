CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT AS $$
DECLARE 
	courses_count INT;
BEGIN
	SELECT COUNT(co.id) INTO courses_count FROM clients c 
	JOIN courses co
		ON co.client_id = c.id
	WHERE c.phone_number = phone_num;
	
    RETURN courses_count;
END;
$$ LANGUAGE plpgsql
;
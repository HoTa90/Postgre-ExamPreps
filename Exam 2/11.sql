CREATE TABLE search_results (
	id SERIAL PRIMARY KEY,
    address_name   VARCHAR(50),
    full_name      VARCHAR(100),
    level_of_bill  VARCHAR(20),
    make           VARCHAR(30),
    condition      CHAR(1),
    category_name  VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(IN address_name VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
	TRUNCATE TABLE search_results;

    INSERT INTO search_results (
    address_name,
    full_name,
    level_of_bill,
    make,
    condition,
    category_name
)
	SELECT a.name, cl.full_name,
CASE
	WHEN co.bill <= 20 THEN 'Low'
	WHEN co.bill > 30 THEN 'High'
	ELSE 'Medium'
END as level_of_bill, c.make, c.condition, cat.name as category_name
FROM courses co
	JOIN addresses a ON co.from_address_id=a.id
	JOIN clients cl ON co.client_id = cl.id
	JOIN cars c ON co.car_id = c.id
	JOIN categories cat ON c.category_id = cat.id
WHERE a.name = address_name 
ORDER BY c.make, cl.full_name;
END;
$$;
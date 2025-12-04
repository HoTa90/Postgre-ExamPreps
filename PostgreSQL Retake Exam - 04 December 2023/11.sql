CREATE OR REPLACE PROCEDURE sp_customer_country_name(
    IN customer_full_name VARCHAR(50),
    OUT country_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN

 SELECT c.name INTO country_name FROM customers cu
JOIN countries c on cu.country_id = c.id
WHERE CONCAT(cu.first_name, ' ', cu.last_name) = customer_full_name;

END;
$$
;
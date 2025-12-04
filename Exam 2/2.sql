INSERT INTO clients (full_name, phone_number)
SELECT CONCAT(first_name, ' ', last_name) as full_name, CONCAT('(088) 9999', id*2) as phone_number
FROM drivers
WHERE id BETWEEN 10 AND 20
;
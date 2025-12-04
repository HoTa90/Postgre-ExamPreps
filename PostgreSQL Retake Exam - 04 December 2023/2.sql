CREATE TABLE IF NOT EXISTS gift_recipients(
id SERIAL PRIMARY KEY,
name VARCHAR(200),
country_id INT NOT NULL REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE,
gift_sent BOOLEAN DEFAULT FALSE NOT NULL
);


INSERT INTO gift_recipients (name, country_id, gift_sent)
SELECT first_name || ' ' || last_name, country_id,
CASE
	WHEN country_id IN (7, 8, 14, 17, 26) THEN TRUE
	ELSE FALSE
END
FROM customers
;
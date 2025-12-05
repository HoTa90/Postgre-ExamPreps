CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
RETURNS VARCHAR AS $$
DECLARE
   result_count INT;
BEGIN
	SELECT
		COUNT(cp.production_id) into result_count
	FROM
	categories c
	LEFT JOIN categories_productions cp on c.id = cp.category_id
	WHERE
	c.name = category_name;

	RETURN FORMAT('Found %s productions.', result_count);
	
END;
$$ LANGUAGE plpgsql;



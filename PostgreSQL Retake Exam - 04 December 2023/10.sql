CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(product_name VARCHAR(25))
RETURNS TABLE (
    customer_id INT,
    customer_name VARCHAR(75),
    feedback_description VARCHAR(255),
    feedback_rate NUMERIC(4, 2)
)
AS
$$
BEGIN
	RETURN QUERY
	SELECT
		f.customer_id, c.first_name as customer_name, f.description as feedback_description, f.rate as feedback_rate 
	FROM 
		feedbacks f
		JOIN customers c ON c.id = f.customer_id
		JOIN products p ON f.product_id = p.id
	WHERE p.name = product_name
	ORDER BY c.id;  
END;
$$ LANGUAGE plpgsql
;
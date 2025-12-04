DELETE FROM clients
WHERE id IN (
    SELECT c.id
    FROM clients c
    LEFT JOIN courses co ON c.id = co.client_id
    WHERE co.client_id IS NULL
      AND LENGTH(c.full_name) > 3
)
;
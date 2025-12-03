UPDATE animals
SET owner_id = (
SELECT id from owners
WHERE name = 'Kaloqn Stoqnov')
WHERE owner_id IS NULL
;
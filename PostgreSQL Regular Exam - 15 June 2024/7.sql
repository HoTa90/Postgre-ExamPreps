SELECT
	CONCAT(a.id, ' ', a.username) as id_username,
	a.email
FROM
	accounts a
	JOIN accounts_photos ap ON ap.account_id = a.id
WHERE
	ap.account_id = ap.photo_id
;
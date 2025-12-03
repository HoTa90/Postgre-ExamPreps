SELECT 
	name, phone_number, ltrim(split_part(v.address, ',', 2)) AS address
FROM 
	volunteers as v
JOIN 
	volunteers_departments as vd
		ON vd.id = v.department_id
WHERE
	vd.department_name = 'Education program assistant'
		AND v.address LIKE '%Sofia%'
ORDER BY v.name
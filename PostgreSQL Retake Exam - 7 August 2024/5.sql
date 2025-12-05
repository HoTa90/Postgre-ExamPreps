SELECT
	id,
	name,
	continent,
	currency
FROM
	countries
WHERE
	continent = 'South America'
	AND SUBSTRING(currency, 1, 1) IN ('P', 'U')
ORDER BY
	currency DESC, id
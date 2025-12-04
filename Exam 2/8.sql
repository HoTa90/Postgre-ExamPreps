SELECT c.full_name, COUNT(co.car_id) as count_of_cars, SUM(co.bill) as total_sum
FROM clients c JOIN courses co ON co.client_id = c.id
GROUP BY c.full_name
HAVING COUNT(co.car_id) > 1 AND SUBSTRING(c.full_name, 2, 1) = 'a'
ORDER BY c.full_name
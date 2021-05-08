SELECT COUNT(calisan_id), unvan_calisan FROM calisanlar 
INNER JOIN unvan ON calisan_id = unvan_calisan_id 
GROUP BY unvan_calisan HAVING COUNT(calisan_id) > 1


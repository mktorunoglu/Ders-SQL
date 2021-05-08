SELECT birim_ad, COUNT(calisan_id) FROM calisanlar
INNER JOIN birimler ON calisan_birim_id = birim_id GROUP BY birim_ad HAVING COUNT(calisan_id) > 2


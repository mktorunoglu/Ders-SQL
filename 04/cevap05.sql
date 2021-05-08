SELECT COUNT(calisan_id), birim_ad FROM calisanlar 
INNER JOIN birimler ON calisan_birim_id = birim_id GROUP BY birim_ad


SELECT COUNT(calisan_id) FROM calisanlar 
FULL OUTER JOIN ikramiye ON calisan_id = ikramiye_calisan_id WHERE ikramiye_calisan_id IS NULL


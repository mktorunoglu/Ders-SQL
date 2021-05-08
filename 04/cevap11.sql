SELECT ikramiye_calisan_id, SUM(ikramiye_ucret) FROM calisanlar 
INNER JOIN ikramiye ON calisan_id = ikramiye_calisan_id 
WHERE ikramiye_tarih BETWEEN '02.20.2016' AND '06.11.2016' GROUP BY ikramiye_calisan_id


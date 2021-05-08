SELECT ad, soyad, birim_ad, unvan_calisan, ikramiye_ucret FROM calisanlar 
INNER JOIN birimler ON calisan_birim_id = birim_id
INNER JOIN unvan ON calisan_id = unvan_calisan_id 
INNER JOIN ikramiye ON calisan_id = ikramiye_calisan_id


SELECT ad, soyad, maas FROM calisanlar WHERE calisan_birim_id 
IN (SELECT birim_id FROM birimler WHERE birim_ad IN('Yazılım', 'Donanım'))


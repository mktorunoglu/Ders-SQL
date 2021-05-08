SELECT ad, soyad, maas FROM calisanlar WHERE maas 
IN (SELECT MAX(maas) FROM calisanlar GROUP BY calisan_birim_id)


CREATE UNIQUE INDEX not_sistemi_index_asc ON NotSistemi(ogrenci_puan ASC)
CREATE NONCLUSTERED INDEX not_sistemi_index_desc ON NotSistemi(ogrenci_puan DESC)
CREATE INDEX not_sistemi_index_multi ON NotSistemi(ogrenci_no, ogrenci_puan ASC)

EXEC sp_helpindex 'NotSistemi'


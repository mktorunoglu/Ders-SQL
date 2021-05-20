CREATE TABLE Okul
(
	okul_id INT PRIMARY KEY NOT NULL,
	okul_adi nvarchar(50),
	okul_tip nvarchar(30) DEFAULT 'İlk Öğretim Okulu'
)

CREATE TABLE Ogrenci
(
	ogrenci_no INT UNIQUE NOT NULL,
	ogrenci_ad nvarchar(30),
	ogrenci_soyad nvarchar(20),
	ogrenci_yas INT CHECK (ogrenci_yas >= 7),
	ogrenci_cinsiyet nvarchar(5) DEFAULT 'Erkek',
	ogrenci_okul_id INT FOREIGN KEY REFERENCES Okul(okul_id)
)


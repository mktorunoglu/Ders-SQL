create table Oda
(
	odaNo int primary key not null,
	odaYatakSayi int not null,
	odaGecelikFiyat int not null
)

create table Hizmet
(
	hizmetNo int primary key not null,
	hizmetAd nvarchar(50) not null,
	hizmetUcret int not null
)

create table OdaServisi
(
	servisNo int primary key not null,
	servisAd nvarchar(50) not null,
	servisUcret int not null
)

create table Lokanta
(
	besinNo int primary key not null,
	besinAd nvarchar(50) not null,
	besinTur bit not null, -- 0 ise YİYECEK; 1 ise İÇECEK
	besinUcret int not null
)

create table Musteri
(
	musteriNo int primary key not null,
	musteriAd nvarchar(50) not null,
	musteriSoyad nvarchar(50) not null,
	musteriCinsiyet bit not null, -- 0 ise ERKEK; 1 ise KADIN
	musteriAdres nvarchar(200) not null,
	musteriGirisTarih datetime not null,
	musteriCıkısTarih datetime null,
	musteriMisafirSayi int not null
)

create table MisafirMusteri
(
	misafirNo int primary key not null,
	misafirAd nvarchar(50) not null,
	misafirSoyad nvarchar(50) not null,
	misafirCinsiyet bit not null, -- 0 ise ERKEK; 1 ise KADIN
	misafirSahipMusteriYakinlik nvarchar(100) not null,
	misafirSahipMusteri int foreign key references Musteri(musteriNo)
)

create table MusteriHesap
(
	musteriHesapNo int foreign key references Musteri(musteriNo),
	musteriHesapMisafirNo int foreign key references MisafirMusteri(misafirNo) null,
	musteriHesapOdaNo int foreign key references Oda(odaNo) null, -- Oda ücreti oda numarasından öğrenilecek
	musteriHesapHizmetNo int foreign key references Hizmet(hizmetNo) null, -- Hizmet ücreti hizmet numarasından öğrenilecek
	musteriHesapServisNo int foreign key references OdaServisi(servisNo) null, -- Oda servisi ücreti servis numarasından öğrenilecek
	musteriHesapBesinNo int foreign key references Lokanta(besinNo) null -- Lokanta ücreti besin numarasından öğrenilecek
)

create table AnlasmaliFirma
(
	firmaNo int primary key not null,
	firmaAd nvarchar(50) not null,
	firmaAdres nvarchar(200) not null,
	firmaIndirim int not null
)

create table FirmaHesap
(
	firmaHesapNo int foreign key references AnlasmaliFirma(firmaNo), -- Oda ücreti için indirim oranı firma numarasından öğrenilecek
	firmaHesapMusteriNo int foreign key references Musteri(musteriNo), 
	-- Hangi müşteri ve beraberindeki kaç misafir için, hangi tarihler arasında ne kadar ücret oluştuğu müşteri numarasından öğrenilecek
	firmaHesapOdaNo int foreign key references Oda(odaNo), -- Oda ücreti oda numarasından öğrenilecek
)


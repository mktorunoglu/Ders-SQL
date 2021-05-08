create table Sube
(
	subeID int primary key not null,
	subeAd nvarchar(50) not null,
	subeAdres nvarchar(200) not null
)

create table Calisan
(
	calisanID int primary key not null,
	calisanNumara nvarchar(11) not null,
	calisanAd nvarchar(50) not null,
	calisanSoyad nvarchar(50) not null,
	calisanMaas int not null,
	calisanAdres nvarchar(200) not null,
	calisanGorev nvarchar(100) not null,
	calisanYonetici bit not null, -- 1 ise YÖNETİCİ; 0 ise ÇALIŞAN
	calisanSube int foreign key references Sube(subeID)
)

create table Musteri
(
	musteriID int primary key not null,
	musteriAd nvarchar(50) not null,
	musteriSoyad nvarchar(50) not null,
	musteriAdres nvarchar(200) not null,
)

create table Hammadde
(
	hammaddeID int primary key not null,
	hammaddeAd nvarchar(50) not null,
	hammaddeMiktar int not null,
	hammaddeMiktarTuru bit not null -- 1 ise ADET; 0 ise GRAM
)

create table Recete
(
	receteID int primary key not null,
	receteHammaddeMiktar int not null,
	receteHammadde int foreign key references Hammadde(hammaddeID)
)

create table Urun
(
	urunID int primary key not null,
	urunFiyat int not null,
	urunRecete int foreign key references Recete(receteID),
	urunSube int foreign key references Sube(subeID)
)

create table Siparis
(
	siparisID int primary key not null,
	siparisTamamlandi bit not null, -- 1 ise TAMAMLANDI; 0 ise TAMAMLANMADI
	siparisMusteri int foreign key references Musteri(musteriID),
	siparisUrun int foreign key references Urun(urunID)
)


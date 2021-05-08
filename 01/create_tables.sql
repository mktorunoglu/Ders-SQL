create table Okul
(
	okulID int primary key not null,
	okulAdi nvarchar(100) not null,
	okulFotografi varbinary(MAX) null,
	ozelOkul bit null,
	okulKurulusTarihi datetime null
)

create table Ogretmen
(
	ogretmenID int primary key not null,
	ogretmenAdi nvarchar(20) not null,
	ogretmenSoyadi nvarchar(20) not null,
	ogretmenFotografi varbinary(MAX) not null,
	ogretmenCinsiyet bit not null,
	ogretmenKayitTarihi datetime null,
	okulID int foreign key references Okul(okulID)
)

create table Ogrenci
(
	ogrenciID int primary key not null,
	ogrenciAdi nvarchar(20) not null,
	ogrenciSoyadi nvarchar(20) not null,
	ogrenciFotografi varbinary(MAX) not null,
	ogrenciSinif int not null,
	ogrenciSube nvarchar(1) not null,
	ogrenciCinsiyet bit not null,
	ogrenciKayitTarihi datetime null,
	okulID int foreign key references Okul(okulID)
)

create table Ders
(
	dersID int primary key not null,
	dersAdi nvarchar(50) not null,
	zorunluDers bit not null,
	dersSembolu varbinary(MAX) null,
	dersTarihi datetime null,
	ogretmenID int foreign key references Ogretmen(ogretmenID)
)

create table NotBilgisi
(
	notID int primary key not null,
	notDegeri int not null,
	harfNotu nvarchar(2) not null,
	notGirisTarihi datetime not null,
	yeterliNot bit not null,
	notSembolu varbinary(MAX) null,
	ogrenciID int foreign key references Ogrenci(ogrenciID),
	dersID int foreign key references Ders(dersID)
)


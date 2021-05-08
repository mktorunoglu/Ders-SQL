create database VTYS on primary
(
	NAME = VTYSdata,
	FILENAME = 'C:\_FILES\_MEGA\Ders\Veri Tabanı Lab\Database\VTYSdata.mdf',
	SIZE = 8MB,
	MAXSIZE = unlimited,
	FILEGROWTH = 10%
)

log on
(
	NAME = VTYSlog,
	FILENAME = 'C:\_FILES\_MEGA\Ders\Veri Tabanı Lab\Database\VTYSlog.ldf',
	SIZE = 8MB,
	MAXSIZE = unlimited,
	FILEGROWTH = 10%
)


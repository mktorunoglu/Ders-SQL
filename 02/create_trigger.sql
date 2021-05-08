create trigger SiparisTrigger on Siparis
after insert
as begin

declare @urunID int
select @urunID = siparisUrun from inserted

declare @receteID int
select @receteID = urunRecete from Urun where urunID = @urunID

declare @hammaddeID int
select @hammaddeID = receteHammadde from Recete where receteID = @receteID

declare @hammaddeMiktar int
select @hammaddeMiktar = receteHammaddeMiktar from Recete where receteID = @receteID

update Hammadde
set hammaddeMiktar = hammaddeMiktar - @hammaddeMiktar
where hammaddeID = @hammaddeID

end
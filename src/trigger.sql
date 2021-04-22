drop trigger if exists ThanhToanBangTheTD;
delimiter $$
create trigger ThanhToanBangTheTD
    after update
    on ThanhToan
    for each row
begin
    if new.TrangThai = 'thành công' then
        delete
        from TheTinDung
        where HoaDon = old.HoaDon;
    end if;
end$$
delimiter ;


drop trigger if exists danhsachkhohangxuatkho;
drop table if exists xuatkho;
create table xuatkho
(
    makho              varchar(20),
    soluongxuatnhapkho int
);
delimiter $$
create trigger danhsachkhohangxuatkho
    after update
    on luutru
    for each row
begin
    if new.SoLuongBanIn < old.SoLuongBanIn then
        insert into xuatkho
        values (new.MaKho, old.SoLuongBanIn - new.SoLuongBanIn);
    end if;
end$$
delimiter ;


drop trigger if exists LoaiSachGiaoDich;
delimiter $$
create trigger LoaiSachGiaoDich
    after insert
    on GiaoDich
    for each row
begin
    if new.Loai = 'thuê' and new.LoaiSach = 'bản in' then
        signal sqlstate '45000' set message_text = 'Thuê chỉ được áp dụng cho sách điện tử';
    end if;
    if new.LoaiSach = 'bản in' and not exists(select * from BanIn where ISBN = new.ISBN) then
        signal sqlstate '45000' set message_text = 'Không có bản in';
    elseif new.LoaiSach = 'bản điện tử' and not exists(select* from BanDienTu where ISBN = new.ISBN) then
        signal sqlstate '45000' set message_text = 'Không có bản điện tử';
    end if;

end$$
delimiter ;



drop trigger if exists ThanhToanBangTheTD;
delimiter $$
create trigger ThanhToanBangTheTD
    after update
    on ThanhToan
    for each row
begin
    if new.TrangThai = 'thành công' then
        delete
        from TheTinDung
        where HoaDon = old.HoaDon;
    end if;
end$$
delimiter ;
alter table Kho
    add SID varchar(10) not null,
    add foreign key (SID) references NhanVien (SID) on delete cascade on update cascade;

alter table Sach
    add TenNhaXuatBan varchar(30) not null,
    add foreign key (TenNhaXuatBan) references NhaXuatBan (TenNhaXuatBan) on delete cascade on update cascade;

alter table TheTinDung
    add UID    varchar(10) not null,
    add foreign key (UID) references KhachHang (UID) on delete cascade on update cascade,
    add HoaDon varchar(20),
    add foreign key (HoaDon) references ThanhToanThe (HoaDon) on delete cascade on update cascade;

alter table GiaoDich
    add HoaDon varchar(20),
    add foreign key (HoaDon) references ThanhToan (HoaDon) on delete cascade on update cascade;
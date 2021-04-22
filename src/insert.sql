insert into TacGia
values ('A123456789', 'Conan Doyle', null, 1999);
insert into TacGia
values ('A987654321', 'Gosho Aoyama', null, 2000);

insert into NhaXuatBan
values ('KimDong');
insert into NhaXuatBan
values ('HCM');
insert into NhaXuatBan
values ('Hồng Đức');
insert into NhaXuatBan
values ('Siro');
insert into NhaXuatBan
values ('Phương Nam');
insert into NhaXuatBan
values ('Trẻ');

insert into Sach
values ('1111111111', 'CSDL', 50000, 'KimDong');
insert into Sach
values ('2222222222', 'HD qua mon', 100000, 'KimDong');
insert into Sach
values ('3333333333', 'VaTheLaHet', 100000, 'HCM');
insert into Sach
values ('4444444444', '5phLaDL', 100000, 'HCM');

insert into ThanhToan(HoaDon)
values ('ABC123');
insert into ThanhToan(HoaDon)
values ('DMS192');
insert into ThanhToan
values ('XYZ456', 'chưa thanh toán');
insert into ThanhToanThe(HoaDon, MaThanhToan)
values ('ABC123', 'XYZ123');
insert into ThanhToanThe(HoaDon, MaThanhToan)
values ('XYZ456', 'ABCDEF');



insert into TheTinDung
values ('XXX123456', 'toduyhung', 'ocb', null, 'U1', 'ABC123');
insert into TheTinDung
values ('XXX456789', 'toduyhung', 'bidv', null, 'U1', null);
insert into ChuyenKhoan
values ('XYZ456');
insert into ChuyenKhoan
values ('DMS192');

insert into QuanLy
values ('Kho1', 'S1', '1111111111');
insert into QuanLy
values ('Kho2', 'S2', '1111111111');

insert into BanIn
values ('1111111111');
insert into BanDienTu
values ('1111111111', 'XYZ');
insert into BanIn
values ('2222222222');
insert into BanDienTu
values ('2222222222', 'ABC');

insert into ThanhToan
values ('TDH166', null);


insert into GiaoDich
values ('U0', '1111111111', '2020-12-01', 'thuê', 'bản điện tử', 2, 'XYZ456');
insert into GiaoDich
values ('U0', '2222222222', '2020-12-01', 'mua', 'bản in', 1, 'ABC123');
insert into GiaoDich
values ('U1', '2222222222', '2020-12-01', 'thuê', 'bản điện tử', 1, 'DMS192');
insert into GiaoDich
values ('U0', '2222222222', '2020-12-02', 'mua', 'bản điện tử', 1, 'TDH166');
insert into GiaoDich
values ('U0', '1111111111', '2020-12-02', 'thuê', 'bản điện tử', 2, null);
insert into GiaoDich
values ('U1', '2222222222', '2020-12-03', 'mua', 'bản in', 1, null);
insert into GiaoDich
values ('U1', '1111111111', '2020-12-03', 'mua', 'bản in', 1, null);
insert into GiaoDich
values ('U1', '2222222222', '2020-12-04', 'thuê', 'bản điện tử', 1, null);


INSERT INTO linhvuc (ISBN, ALinhVuc) VALUES ('00000027', 'Tiểu thuyết')
INSERT INTO linhvuc (ISBN, ALinhVuc) VALUES ('00000028', 'Kỹ năng sống')
INSERT INTO linhvuc (ISBN, ALinhVuc) VALUES ('00000030', 'Deadline')
INSERT INTO linhvuc (ISBN, ALinhVuc) VALUES ('00000034', 'Deadline')


-- select * from GiaoDich;
insert into PhanHoi
values ('U1', '1111111111');
insert into PhanHoi
values ('U1', '2222222222');
insert into TinPhanHoi
values ('U1', '1111111111', '1990-01-01', 'sounds interesting');
insert into TinPhanHoi
values ('U0', '1111111111', '1990-01-03', 'love it');
insert into TinPhanHoi
values ('U0', '2222222222', '1991-12-10', 'cuuuuuu emmmm');
insert into Kho
values ('Kho1', 'S1');
insert into Kho
values ('Kho2', 'S2');

insert into LinhVuc
values ('1111111111', 'CNTT');
insert into LinhVuc
values ('1111111111', 'KHMT');
insert into LinhVuc
values ('2222222222', 'KHMT');
insert into LinhVuc
values ('3333333333', 'KHMT');
insert into LinhVuc
values ('4444444444', 'KHMT');
insert into NamSanXuat
values ('1111111111', 'KimDong', 2019);
insert into NamSanXuat
values ('1111111111', 'KimDong', 2020);

insert into Viet
values ('A123456789', '1111111111');
insert into Viet
values ('A123456789', '4444444444');
insert into Viet
values ('A123456789', '3333333333');
insert into Viet
values ('A987654321', '2222222222');


insert into tukhoa
values ('1111111111', 'ứng dụng');
insert into tukhoa
values ('1111111111', 'nghiên cứu');
insert into tukhoa
values ('2222222222', 'ứng dụng');



insert into Sach values (00000017,'Đắc Nhân Tâm',100000,'KimDong');
insert into Sach values (00000018,'Tuổi trẻ đáng giá bao nhiêu',100000,'KimDong');
insert into Sach values (00000019,'Đời ngắn đừng ngủ dài',100000,'Hồng Đức');
insert into Sach values (00000020,'Giải mã siêu trí nhớ',100000,'KimDong');
insert into Sach values (00000021,'Leader Ship',100000,'KimDong');
insert into Sach values (00000022,'Tony buổi sáng',100000,'Trẻ');
insert into Sach values (00000023,'Tự học 2000 từ vựng tiếng anh',100000,'Hồng Đức');
insert into Sach values (00000024,'Con chim xanh biết bay về',100000,'Trẻ');
insert into Sach values (00000025,'Nhân số học',100000,'KimDong');
insert into Sach values (00000026,'Từ điển tiếng em',100000,'KimDong');
insert into Sach values (00000027,'Biên niên cô đơn',80000,'Hồng Đức');
insert into Sach values (00000028,'Đàn ông sao hỏa',100000,'Trẻ');
insert into Sach values (00000029,'Đừng chọn an nhàn khi còn trẻ',100000,'Trẻ');
insert into Sach values (00000030,'7 Thói quen',100000,'KimDong');
insert into Sach values (00000031,'Lược sử loài người',100000,'KimDong');
insert into Sach values (00000032,'Sống cho chính tôi',100000,'KimDong');
insert into Sach values (00000033,'Mắc biết',89000,'Hồng Đức');
insert into Sach values (00000034,'999 Lá Thư',100000,'KimDong');
insert into Sach values (00000035,'Thế giới chẳng thay đổi',100000,'Hồng Đức');
insert into Sach values (00000036,'Con chim xanh biếc bay về',100000,'KimDong');
insert into Sach values (00000037,'Bước chậm lại',100000,'KimDong');
insert into Sach values (00000038,'Kỹ luật và tự do',100000,'Trẻ');
insert into Sach values (00000039,'Tôi tự do',100000,'Trẻ');
insert into Sach values (00000040,'Thuật đọc tâm',100000,'KimDong');



insert into NamSanXuat
values ('17', 'KimDong', 2020);
insert into NamSanXuat
values ('18', 'KimDong', 2020);
insert into NamSanXuat
values ('19', 'Hồng Đức', 2020);
insert into NamSanXuat
values ('20', 'KimDong', 2020);
insert into NamSanXuat
values ('21', 'KimDong', 2020);
insert into NamSanXuat
values ('22', 'Trẻ', 2020);
insert into NamSanXuat
values ('23', 'Hồng Đức', 2020);
insert into NamSanXuat
values ('24', 'Trẻ', 2020);
insert into NamSanXuat
values ('25', 'KimDong', 2020);
insert into NamSanXuat
values ('26', 'KimDong', 2020);
insert into NamSanXuat
values ('27', 'Hồng Đức', 2020);
insert into NamSanXuat
values ('28', 'Trẻ', 2020);
insert into NamSanXuat
values ('29', 'Trẻ', 2019);
insert into NamSanXuat
values ('30', 'KimDong', 2020);
insert into NamSanXuat
values ('31', 'KimDong', 2020);
insert into NamSanXuat
values ('32', 'KimDong', 2020);
insert into NamSanXuat
values ('33', 'Hồng Đức', 2019);
insert into NamSanXuat
values ('34', 'KimDong', 2020);
insert into NamSanXuat
values ('35', 'Hồng Đức', 2020);
insert into NamSanXuat
values ('36', 'KimDong', 2020);
insert into NamSanXuat
values ('37', 'KimDong', 2020);
insert into NamSanXuat
values ('38', 'Trẻ', 2020);
insert into NamSanXuat
values ('39', 'Trẻ', 2020);
insert into NamSanXuat
values ('40', 'KimDong', 2020);

INSERT INTO kho (MaKho, SID)
VALUES ('Kho1', 'S0');


insert into cart_4customer
values ('U2', '2222222222', 1, 'DMS192', (select GiaTien from Sach where ISBN = '2222222222'));

INSERT INTO giaodich (UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong, HoaDon)
VALUES ('U2', '00000001', '2020-12-30 10:24:27', 'mua', 'bản in', 1,
        '10078265');
DROP DATABASE IF exists eBookStore;
CREATE DATABASE eBookStore;
USE eBookStore;





# call ChinhSuaNhanVien(1,'Nguyen Van A','staff@gmail.com','staff01','$2a$','S1');
# call ChinhSuaNhanVien(2,'Nguyen Van B','b@gmail.com','staff02','$2a$','S2');





call ChinhSuaKhachHang(0, 'Truong Thanh Loc', 'thanhloc1506@gmail.com', 'sirodb2301', null, 'U0');
# call ChinhSuaKhachHang(30, 'Nguyen Van D', 'thanhloc1506@gmail.com', 'siro1', null, 'U1810198');
# call ChinhSuaKhachHang(31, 'Nguyen Van B', 'thanhloc1506@gmail.com', 'siro2', null, 'U2222222');
# call ChinhSuaKhachHang(32, 'nguyen Van C', 'thanhloc1506@gmail.com', 'siro3', null, 'U3333333');
call ChinhSuaKhachHang(1, 'To Duy Hung', 'duyhung@gmail.com', 'siro1', null, 'U1');
#
# call ChinhSuaKhachHang(33, 'To Duy Hung', 'hung.toduy@gmail.com', 'hungduy','$2a$10','U4444444');
# -- insert into TaiKhoanKhachHang values (29, 'Truong Thanh Loc', 'thanhloc1506@gmail.com', 'sirodb2301', '$2a$10', '1111111',null,null);
# -- insert into TaiKhoanKhachHang values (30, 'Nguyen Van D', 'thanhloc1506@gmail.com', 'siro1', '$2a$10', '1810198',null,null);
# -- insert into TaiKhoanKhachHang values (31, 'Nguyen Van B', 'thanhloc1506@gmail.com', 'siro2', '$2a$10', '2222222', null,null);
# -- insert into TaiKhoanKhachHang values(32, 'nguyen Van C', 'thanhloc1506@gmail.com', 'siro3', '$2a$10', '3333333',null,null);
# -- insert into TaiKhoanKhachHang values (33, 'To Duy Hung', 'thanhloc1506@gmail.com', 'sirodb2301', '$2a$10', '4444444',null,null);
# call ChinhSuaKhachHang(34, 'To Duy Hung', 'hung.toduy@gmail.com', 'hungduy','$2a$10','U5555555');
















-- ------------------------------------------------------------------




# update ThanhToan
# set TrangThai = 'lỗi'
# where HoaDon = 'XYZ456';



-- select * from TheTinDung;
-- update ThanhToan
-- set TrangThai = 'thành công'
-- where HoaDon = 'ABC123';
-- select * from TheTinDung;




-- ----------------------------------- i.1-------------------------------------------



call NhapKho('Kho1', 1111111111, 2);
-- select* from LuuTru;

call NhapKho('Kho2', 1111111111, 5);
-- select* from LuuTru;



-- call NhapKho('Kho1',1111111111,5);
-- select* from LuuTru;


-- ----------------------------------- i.2-------------------------------------------



-- call XuatKho('Kho1',1111111111,3);
-- select* from LuuTru;


-- call XuatKho('Kho1',1111111111,4);
-- select* from LuuTru;


-- ----------------------------------- i.3-------------------------------------------



-- call CapNhatGiaoDichLoi('2222222','2222222222','2020-12-01');
-- select * from ThanhToan;


-- ----------------------------------- i.4+5+6+7+8-------------------------------------------

drop table if exists DSMuaTrongMotNgay;
# create table DSMuaTrongMotNgay(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan		varchar(30) not null,
# 	primary key (ISBN),
#     check (GiaTien > 0)
# );

drop table if exists TongMuaTrongMotNgay;
# create table TongMuaTrongMotNgay(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan		varchar(30) not null,
#     SoLuong					int,
# 	primary key (ISBN),
#     check (GiaTien > 0 and SoLuong > 0)
# );

drop table if exists TongTruyenThongMuaTrongMotNgay;
# create table TongTruyenThongMuaTrongMotNgay(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan		varchar(30) not null,
#     SLTruyenThong					int,
# 	primary key (ISBN),
#     check (GiaTien > 0 and SLTruyenThong > 0)
# );

drop table if exists TongDienTuMuaTrongMotNgay;
# create table TongDienTuMuaTrongMotNgay(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan		varchar(30) not null,
#     SLDienTuMua					int,
# 	primary key (ISBN),
#     check (GiaTien > 0 and SLDienTuMua > 0)
# );

drop table if exists TongDienTuThueTrongMotNgay;
# create table TongDienTuThueTrongMotNgay(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan		varchar(30) not null,
#     SLDienTuThue					int,
# 	primary key (ISBN),
#     check (GiaTien > 0 and SLDienTuThue > 0)
# );



call XemSachMuaTrongMotNgay(30, 12, 2020, 1);
# call XemSachMuaTrongMotNgay(01,12,2020,2);
# call XemSachMuaTrongMotNgay(01,12,2020,3);
# call XemSachMuaTrongMotNgay(01,12,2020,4);
# call XemSachMuaTrongMotNgay(01,12,2020,5);

# call XemSachMuaTrongMotNgay('2020-12-30', 1);
-- select* from DSMuaTrongMotNgay;
-- call XemSachMuaTrongMotNgay('2020-12-01', 2);
-- select* from TongMuaTrongMotNgay;
-- call XemSachMuaTrongMotNgay('2020-12-01', 3);
-- select* from TongTruyenThongMuaTrongMotNgay;
-- call XemSachMuaTrongMotNgay('2020-12-01', 4);
-- select* from TongDienTuMuaTrongMotNgay;
-- call XemSachMuaTrongMotNgay('2020-12-01', 5);
-- select* from TongDienTuThueTrongMotNgay;
###########################################################################################



## drop
# grant select on DSMuaTrongMotNgay to 'staff'@'localhost';
# grant select on TongMuaTrongMotNgay to 'staff'@'localhost';
# grant select on TongTruyenThongMuaTrongMotNgay to 'staff'@'localhost';
# grant select on TongDienTuMuaTrongMotNgay to 'staff'@'localhost';
# grant select on TongDienTuThueTrongMotNgay to 'staff'@'localhost';


-- ----------------------------------- i.9+10-------------------------------------------

drop table if exists TacGiaCoSachBanChayNhat;
# create table TacGiaCoSachBanChayNhat(
# 	AID						varchar(10),
# 	HoTen					varchar(50),
# 	Email					varchar(30),
# 	NamSinh					int,
# 	primary key (AID),
#     check (AID like 'A%'),
#     check (NamSinh > 0 AND NamSinh < 9999)

# );



call XemTacGiaCoSachBanChayNhat('2020-12-29', 1);
-- select* from TacGiaCoSachBanChayNhat;
####################################################################################################
# grant execute on procedure XemTacGiaCoSachBanChayNhat to 'staff'@'localhost';
#drop
# grant select on TacGiaCoSachBanChayNhat to 'staff'@'localhost';

-- ----------------------------------- i.11-------------------------------------------

drop table if exists sachmuanhieunhat;
# create table sachmuanhieunhat
# (
#     ISBN          varchar(10),
#     TenSach       varchar(30),
#     GiaTien       int not null,
#     TenNhaXuatBan varchar(30),
#     primary key (ISBN),
#     check (GiaTien > 0)
# );

-- call xemsachmuanhieunhat();
-- select * from sachmuanhieunhat;

####################################################################################

#drop
# grant select on sachmuanhieunhat to 'staff'@'localhost';

-- ----------------------------------- i.12-------------------------------------------

drop table if exists danhsachthanhtoanthe;
# create table danhsachthanhtoanthe(
#     hoadon  varchar(20),
#     primary key(hoadon)
# );

-- call xemdanhsachthanhtoanthe('2020-12-01 00:00:00');
-- select * from danhsachthanhtoanthe;
###############################################################################
#drop
# grant select on danhsachthanhtoanthe to 'staff'@'localhost';

-- ----------------------------------- i.13-------------------------------------------


drop table if exists danhsachsucothanhtoanthe;
# create table danhsachsucothanhtoanthe(
#     hoadon  varchar(20),
#     primary key(hoadon)
# );

-- call xemdanhsachsucothanhtoanthe('2020-12-01');
-- select * from danhsachsucothanhtoanthe;
#############################################################################
#drop
# grant select on danhsachsucothanhtoanthe to 'staff'@'localhost';

-- ----------------------------------- i.14-------------------------------------------


-- insert into Luutru values ('Kho1','1111111111',11);
drop table if exists isbn10;
# create table isbn10(
#     makho varchar(20),
#     primary key (makho)
# );

-- call xemisbn10('2020-12-01 00:00:00');
-- select * from isbn10;
#############################################################################
#drop
# grant select on isbn10 to 'staff'@'localhost';


-- ----------------------------------- i.15-------------------------------------------


drop table if exists khoisbnthang;
# create table khoisbnthang(
#     soluong decimal(10,2),
#     primary key (soluong)
# );

-- call xemkhoisbnthang(12, 2020);
-- select * from khoisbnthang;
#############################################################################
#drop
# grant select on khoisbnthang to 'staff'@'localhost';



-- ----------------------------------- i.16-------------------------------------------


drop table if exists danhsachkhohangxuatkhonhieu;
# create table danhsachkhohangxuatkhonhieu(
#     makho varchar(20),
#     primary key (makho)
# );


update luutru
set Soluongbanin = 3
where makho = 'Kho1'
  and isbn = '1111111111';

-- call xemdanhsachkhohangxuatkhonhieutrongthang(12,2020);
-- select * from danhsachkhohangxuatkhonhieu;
#############################################################################
#drop
# grant select on danhsachkhohangxuatkhonhieu to 'staff'@'localhost';

-- ----------------------------------- ii.1-------------------------------------------




call CapNhatThongTinCaNhan('U2', 'kudo shinichi', 'NhatBan', '0123456789');
select*
from KhachHang;


-- ----------------------------------- ii.2-------------------------------------------



-- call ChonTheTinDung('XYZ456','XXX456789');
-- select* from TheTinDung;


-- ----------------------------------- ii.3-------------------------------------------



-- call CapNhatGiaoDich('1111111','2222222222','2020-12-01','mua','bản điện tử',2);
-- select* from GiaoDich;


-- ----------------------------------- ii.4-------------------------------------------


drop table if exists SachCungTheLoai;
create table SachCungTheLoai
(
    ISBN          varchar(10),
    TenSach       varchar(30),
    GiaTien       int not null,
    TenNhaXuatBan varchar(30),
    primary key (ISBN),
    check (GiaTien > 0)
);



call XemSachTheoTheLoai('KHMT');
-- select* from SachCungTheLoai;
#############################################################################
# grant select on SachCungTheLoai to 'customer'@'localhost';


-- ----------------------------------- ii.5-------------------------------------------


drop table if exists SachCungTacGia;
# create table SachCungTacGia(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan			varchar(30),
# 	primary key (ISBN),
#     check (GiaTien > 0)
# );



call XemSachTheoTacGia('Conan Doyle');
# select* from SachCungTacGia;
#############################################################################
# grant select on SachCungTacGia to 'customer'@'localhost';


-- ----------------------------------- ii.6-------------------------------------------


drop table if exists SachCungTuKhoa;
# create table SachCungTuKhoa(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan			varchar(30),
# 	primary key (ISBN),
#     check (GiaTien > 0)
# );



-- call XemSachTheoTuKhoa('nghiên cứu');
-- select* from SachCungTuKhoa;
#############################################################################
# grant select on SachCungTuKhoa to 'customer'@'localhost';


-- ----------------------------------- ii.7-------------------------------------------


drop table if exists SachCungNamXB;
# create table SachCungNamXB(
# 	ISBN					varchar(10),
# 	TenSach					varchar(30),
# 	GiaTien					int not null,
#     TenNhaXuatBan			varchar(30),
# 	primary key (ISBN),
#     check (GiaTien > 0)
# );



-- call XemSachTheoNamXB(2019);
-- select* from SachCungNamXB;
#############################################################################
# grant select on SachCungNamXB to 'customer'@'localhost';


-- ----------------------------------- ii.8-------------------------------------------

drop table if exists MuaTrong1Thang;
# create table MuaTrong1Thang(
# 	UID						varchar(10),
#     ISBN					varchar(10),
# 	NgayGio					datetime,
#     Loai					varchar(10) not null,
# 	check (Loai in ('mua','thuê')),
#     LoaiSach				varchar(20) not null,
#     check(LoaiSach in ('bản in','bản điện tử')),
#     SoLuong					int default(1),
#     check(SoLuong > 0),
#     HoaDon					varchar(20),
# 	primary key (UID,ISBN,NgayGio)
# );



-- call XemMuaTrong1Thang('1810198');
-- select* from MuaTrong1Thang;
#############################################################################
# grant select on MuaTrong1Thang to 'customer'@'localhost';

-- ----------------------------------- ii.9+10+11-------------------------------------------





drop table if exists GiaoDichTrong1Thang;
# create table GiaoDichTrong1Thang(
# 	UID						varchar(10),
#     ISBN					varchar(10),
# 	NgayGio					datetime,
#     Loai					varchar(10) not null,
# 	check (Loai in ('mua','thuê')),
#     LoaiSach				varchar(20) not null,
#     check(LoaiSach in ('bản in','bản điện tử')),
#     SoLuong					int default(1),
#     check(SoLuong > 0),
#     HoaDon					varchar(20),
# 	primary key (UID,ISBN,NgayGio)
# );



-- call XemGiaoDichTrong1Thang('1810198', 2);
-- select* from GiaoDichTrong1Thang;
#############################################################################
# grant select on GiaoDichTrong1Thang to 'customer'@'localhost';


-- ----------------------------------- ii.12-------------------------------------------


drop table if exists TacGiaCungTheLoai;
# create table TacGiaCungTheLoai(
# 	AID						varchar(10),
# 	HoTen					varchar(50),
# 	Email					varchar(30),
# 	NamSinh					int,
# 	primary key (AID),
#     check (AID like 'A%'),
#     check (NamSinh > 0 AND NamSinh < 9999)
# );



-- call XemTacGiaTheoTheLoai('CNTT');
-- select* from TacGiaCungTheLoai;
#############################################################################
# grant select on TacGiaCungTheLoai to 'customer'@'localhost';


-- ----------------------------------- ii.13-------------------------------------------

drop table if exists TacGiaCungTuKhoa;
# create table TacGiaCungTuKhoa(
# 	AID						varchar(10),
# 	HoTen					varchar(50),
# 	Email					varchar(30),
# 	NamSinh					int,
# 	primary key (AID),
#     check (AID like 'A%'),
#     check (NamSinh > 0 AND NamSinh < 9999)
# );



-- call XemTacGiaTheoTuKhoa('nghiên cứu');
-- select* from TacGiaCungTuKhoa;
#############################################################################
# grant select on TacGiaCungTuKhoa to 'customer'@'localhost';


-- ----------------------------------- ii.14-------------------------------------------

drop table if exists TongSoSachTheoTheLoai;
# create table TongSoSachTheoTheLoai(
# 	LinhVuc						varchar(20) primary key,
#     TongSoLuong					int
# );



-- call XemTongSoSachTheoTheLoai('1810198', 'KHMT');
-- select* from TongSoSachTheoTheLoai;
#############################################################################
# grant select on TongSoSachTheoTheLoai to 'customer'@'localhost';


-- ----------------------------------- ii.15-------------------------------------------

drop table if exists GDMuaNhieuNhatTrong1Thang;
# create table GDMuaNhieuNhatTrong1Thang(
# 	UID						varchar(10),
#     ISBN					varchar(10),
# 	NgayGio					datetime,
#     Loai					varchar(10) not null,
#     check (Loai in ('mua','thuê')),
#     LoaiSach 				varchar(20) not null,
#     check (LoaiSach in ('bản điện tử','bản in')),
#     SoLuong					int default(1),
#     check (SoLuong > 0),
#     HoaDon				varchar(20),
# 	primary key (UID,ISBN,NgayGio)
# );



-- call XemGDMuaNhieuNhatTrong1Thang('4444444');
-- select* from GDMuaNhieuNhatTrong1Thang;
#############################################################################
# grant select on GDMuaNhieuNhatTrong1Thang to 'customer'@'localhost';


-- ----------------------------------- ii.16-------------------------------------------

drop table if exists GD2LoaiTrong1Thang;
# create table GD2LoaiTrong1Thang(
# 	UID						varchar(10),
#     ISBN					varchar(10),
# 	NgayGio					datetime,
#     Loai					varchar(10) not null,
#     check (Loai in ('mua','thuê')),
#     LoaiSach 				varchar(20) not null,
#     check (LoaiSach in ('bản điện tử','bản in')),
#     SoLuong					int default(1),
#     check (SoLuong > 0),
#     HoaDon				varchar(20),
# 	primary key (UID,ISBN,NgayGio)
# );



-- call XemGD2LoaiTrong1Thang('4444444');
-- select* from GD2LoaiTrong1Thang;
#############################################################################
# grant select on GD2LoaiTrong1Thang to 'customer'@'localhost';

-- ---------------------------------------------------



call ThemSach('5555555555', 'hmm', 10000, 'no idea', 'well', 'Conan Doyle');
-- --------------------------------------------------
# set default role all to 'customer'@'localhost';
# set default role all to 'staff'@'localhost';








call XemSachMuaTrongMotNgay('2020-12-22', 1);






# select *
# from cart_4customer;





######################################





call XemTongSoSachTheoTheLoai('U2', 'Kỹ năng sống', 12, 2020);












# INSERT INTO namsanxuat (ISBN, TenNhaXuatBan, ANamSanXuat) VALUES ('00000001', 'KimDong', 2018)

# call ChinhSuaCart('U2', '00000002', 1, '8337840')





# `DELETE from cart_4customer where UID = 'U2' and ISBN = '00000001' and mahoadon='DMS192'`

# INSERT INTO giaodich (UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong, HoaDon)
# VALUES ('U2', '00000001', '2020-10-2', 'mua', 'bản in', 2, 'DMS192')












# call ChinhSuaCart('1810198', '1111111111', 'mua', 'bản điện tử', 2, 'XYZ456');
# call ChinhSuaCart('1810198', '1111111111', 'thuê', 'bản điện tử', 2, 'ABC123');
# call ChinhSuaCart('1810198', '1111111111', 'mua', 'bản in', 2, 'DMS192');
# call ChinhSuaCartThanhToan('U2', '00000003', 12, 'thuê', 'bản điện tử', '4343690');
# select *
# from cart_4customer;


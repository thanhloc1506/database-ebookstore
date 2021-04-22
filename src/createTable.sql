create table staff
(
    id       varchar(20),
    fullname varchar(20),
    email    varchar(100),
    username varchar(20),
    hash     varchar(100),
    SID      varchar(10) unique not null,
    check (SID like 'S%'),
    primary key (id)
);

create table NhanVien
(
    SID   varchar(10),
    Email varchar(100),
    HoTen varchar(50),
    primary key (SID),
    foreign key (SID) references staff (SID) on delete cascade on update cascade
);


create table Kho
(
    MaKho varchar(20),
    primary key (MaKho)
);

create table NhaXuatBan
(
    TenNhaXuatBan varchar(30),
    primary key (TenNhaXuatBan)
);

create table TacGia
(
    AID     varchar(10),
    HoTen   varchar(50),
    Email   varchar(30),
    NamSinh int,
    primary key (AID),
    check (AID like 'A%'),
    check (NamSinh > 0 AND NamSinh < 9999)
);

create table Sach
(
    ISBN    varchar(10),
    TenSach varchar(30),
    GiaTien int not null,
    primary key (ISBN),
    check (GiaTien > 0)
);

create table BanIn
(
    ISBN varchar(10),
    primary key (ISBN),
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);

create table BanDienTu
(
    ISBN  varchar(10),
    Bcode varchar(20) unique not null,
    primary key (ISBN),
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);

create table user
(
    id       varchar(20),
    fullname varchar(20),
    email    varchar(100),
    username varchar(20),
    hash     varchar(100),
    UID      varchar(20) unique not null Check (uid like 'U%'),
    primary key (id)
);

create table KhachHang
(
    UID    varchar(10),
    HoTen  varchar(50),
    DiaChi varchar(30),
    Phone  varchar(11),
    primary key (UID),
    foreign key (UID) references user (UID) on delete cascade on update cascade,
    check (length(Phone) >= 9 AND length(Phone) <= 11)
);


create table TheTinDung
(
    MaThe       varchar(10),
    TenChuThe   varchar(20),
    TenNganHang varchar(20),
    NgayHetHan  date,
    primary key (MaThe)
);

create table ThanhToan
(
    HoaDon    varchar(20),
    TrangThai varchar(20) default ('chưa thanh toán'),
    check (TrangThai in ('thành công', 'chưa thanh toán', 'lỗi')),
    primary key (HoaDon)
);

create table ChuyenKhoan
(
    HoaDon varchar(20),
    primary key (HoaDon),
    foreign key (HoaDon) references ThanhToan (HoaDon) on delete cascade on update cascade
);

create table ThanhToanThe
(
    HoaDon      varchar(20),
    MaThanhToan varchar(10) unique not null,
    primary key (HoaDon),
    foreign key (HoaDon) references ThanhToan (HoaDon) on delete cascade on update cascade
);

create table GiaoDich
(
    UID      varchar(10),
    ISBN     varchar(10),
    NgayGio  datetime,
    Loai     varchar(10) not null,
    check (Loai in ('mua', 'thuê')),
    LoaiSach varchar(20) not null,
    check (LoaiSach in ('bản điện tử', 'bản in')),
    SoLuong  int default (1),
    HoaDon varchar(20),
    check (SoLuong > 0),
    primary key (UID, ISBN, NgayGio),
    foreign key (HoaDon) references ThanhToan (HoaDon) on delete cascade on update cascade;
    foreign key (UID) references KhachHang (UID) on delete cascade on update cascade,
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);


create table LuuTru
(
    MaKho        varchar(20),
    ISBN         char(13),
    SoLuongBanIn int,
    primary key (MaKho, ISBN),
    foreign key (Makho) references Kho (MaKho) on delete cascade on update cascade,
    foreign key (ISBN) references BanIn (ISBN) on delete cascade on update cascade,
    check (SoLuongBanIn >= 0)
);

create table QuanLy
(
    MaKho varchar(20),
    SID   varchar(10),
    ISBN  char(13),
    primary key (MaKho, SID, ISBN),
    foreign key (MaKho) references Kho (MaKho) on delete cascade on update cascade,
    foreign key (SID) references NhanVien (SID) on delete cascade on update cascade,
    foreign key (ISBN) references BanIn (ISBN) on delete cascade on update cascade
);

create table Viet
(
    AID  varchar(10),
    ISBN varchar(10),
    primary key (AID, ISBN),
    foreign key (AID) references TacGia (AID) on delete cascade on update cascade,
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);

create table PhanHoi
(
    UID  varchar(10),
    ISBN varchar(10),
    primary key (UID, ISBN),
    foreign key (UID) references KhachHang (UID) on delete cascade on update cascade,
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);

create table TuKhoa
(
    ISBN    varchar(10),
    ATuKhoa varchar(20),
    primary key (ISBN, ATuKhoa),
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);

create table LinhVuc
(
    ISBN     varchar(10),
    ALinhVuc varchar(20),
    primary key (ISBN, ALinhVuc),
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade
);

create table NamSanXuat
(
    ISBN          varchar(10),
    TenNhaXuatBan varchar(30),
    ANamSanXuat   int,
    primary key (ISBN, TenNhaXuatBan, ANamSanxuat),
    foreign key (ISBN) references Sach (ISBN) on delete cascade on update cascade,
    foreign key (TenNhaXuatBan) references NhaXuatBan (TenNhaXuatBan) on delete cascade on update cascade,
    check (ANamSanXuat > 0 AND ANamSanXuat < 9999)
);

create table TinPhanHoi
(
    UID      varchar(10),
    ISBN     varchar(10),
    ThoiGian date,
    VanBan   varchar(500),
    primary key (UID, ISBN, ThoiGian, VanBan),
    foreign key (UID, ISBN) references PhanHoi (UID, ISBN) on delete cascade on update cascade
);

create table cart_4customer
(
    UID      varchar(10),
    isbn     varchar(10),
    soluong  int,
    mahoadon varchar(20),
    Loai     varchar(10) not null,
    check (Loai in ('mua', 'thuê')),
    LoaiSach varchar(20) not null,
    check (LoaiSach in ('bản điện tử', 'bản in')),
    tien     int,
    primary key (uid, isbn, mahoadon),
    foreign key (mahoadon) references ThanhToan (HoaDon) on delete cascade on update cascade,
    foreign key (isbn) references Sach (ISBN) on delete cascade on update cascade,
    foreign key (uid) references KhachHang (uid) on delete cascade on update cascade
);

create table cart_4staff
(
    UID      varchar(10),
    isbn     varchar(10),
    soluong  int,
    mahoadon varchar(20),
    tien     int,
    Loai     varchar(10) not null,
    check (Loai in ('mua', 'thuê')),
    LoaiSach varchar(20) not null,
    check (LoaiSach in ('bản điện tử', 'bản in')),
    primary key (uid, isbn, mahoadon),
    foreign key (mahoadon) references ThanhToan (HoaDon) on delete cascade on update cascade,
    foreign key (isbn) references Sach (ISBN) on delete cascade on update cascade,
    foreign key (uid) references KhachHang (uid) on delete cascade on update cascade
);
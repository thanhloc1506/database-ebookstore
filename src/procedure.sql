drop procedure if exists ChinhSuaNhanVien;
DELIMITER $$
CREATE procedure ChinhSuaNhanVien(id_input varchar(20), fullname_input varchar(20), email_input varchar(100),
                                  username_input varchar(20), hash_input varchar(100), sid_input varchar(10))
BEGIN
    if not exists(select * from staff where id = id_input) then
        insert into staff values (id_input, fullname_input, email_input, username_input, hash_input, sid_input);
        insert into NhanVien values (sid_input, email_input, fullname_input);
    else
        update staff
        set fullname = fullname_input,
            email    = email_input,
            username = username_input,
            hash     = hash_input,
            sid      = sid_input
        where id = id_input;

        update NhanVien
        set hoten = fullname_input,
            email = email_input
        where sid = sid_input;

    end if;
END$$
DELIMITER ;



drop procedure if exists ChinhSuaKhachHang;
DELIMITER $$
CREATE procedure ChinhSuaKhachHang(id_input varchar(20), fullname_input varchar(20), email_input varchar(100),
                                   username_input varchar(20), hash_input varchar(100), uid_input varchar(10))
BEGIN
    if not exists(select * from user where id = id_input) then
        insert into user values (id_input, fullname_input, email_input, username_input, hash_input, uid_input);
        insert into KhachHang values (uid_input, fullname_input, 'KTX khu A', '0123456789');
    else
        update user
        set fullname = fullname_input,
            email    = email_input,
            username = username_input,
            hash     = hash_input,
            uid      = uid_input
        where id = id_input;

        update KhachHang
        set hoten = fullname_input
        where uid = uid_input;

    end if;
END$$
DELIMITER ;









drop procedure if exists NhapKho;
DELIMITER $$
CREATE procedure NhapKho(MaKho_input varchar(20), ISBN_input varchar(10), SoLuongBanIn_input int)
BEGIN
    if ISBN_input in (select ISBN from BanIn) and MaKho_input in (select MaKho from Kho) and
       SoLuongBanIn_input >= 0 then
        if exists(select ISBN from LuuTru where ISBN = ISBN_input and MaKho = MaKho_input) then
            update LuuTru
            set SoLuongBanIn = SoLuongBanIn + SoLuongBanIn_input
            where ISBN = ISBN_input
              and LuuTru.Makho = MaKho_input;
        else
            insert into LuuTru
            values (MaKho_input, ISBN_input, SoLuongBanIn_input);
        end if;
    end if;
END$$
DELIMITER ;



drop procedure if exists XuatKho;
DELIMITER $$
CREATE procedure XuatKho(MaKho_input varchar(20), ISBN_input varchar(10), SoLuongBanIn_input int)
BEGIN
    if exists(select ISBN from LuuTru where ISBN = ISBN_input and MaKho = MaKho_input) and
       SoLuongBanIn_input <= (select SoLuongBanIn from LuuTru where ISBN = ISBN_input and MaKho = MaKho_input) then
        if SoLuongBanIn_input < (select SoLuongBanIn from LuuTru where ISBN = ISBN_input and MaKho = MaKho_input) then
            update LuuTru
            set SoLuongBanIn = SoLuongBanIn - SoLuongBanIn_input
            where ISBN = ISBN_input
              and LuuTru.Makho = MaKho_input;
        else
            delete
            from LuuTru
            where ISBN = ISBN_input
              and LuuTru.Makho = MaKho_input;
        end if;
    end if;
END$$
DELIMITER ;


drop procedure if exists CapNhatGiaoDichLoi;
DELIMITER $$
CREATE procedure CapNhatGiaoDichLoi(UID_input varchar(10), ISBN_input varchar(10), NgayGio_input date)
BEGIN
    if exists(select * from GiaoDich where UID = UID_input and ISBN = ISBN_input and NgayGio = NgayGio_input) then
        update ThanhToan
        set TrangThai = 'lỗi'
        where HoaDon =
              (select HoaDon from GiaoDich where UID = UID_input and ISBN = ISBN_input and NgayGio = NgayGio_input);
    end if;
END$$
DELIMITER ;



drop procedure if exists XemSachMuaTrongMotNgay;
DELIMITER $$
CREATE procedure XemSachMuaTrongMotNgay(Ngay_input datetime, opt int)
BEGIN
    # 	delete from DSMuaTrongMotNgay;
#     delete from TongMuaTrongMotNgay;
#     delete from TongTruyenThongMuaTrongMotNgay;
#     delete from TongDienTuMuaTrongMotNgay;
#     delete from TongDienTuThueTrongMotNgay;
    if opt = 1 then
# 		insert into DSMuaTrongMotNgay
        select distinct ISBN, TenSach, GiaTien, TenNhaXuatBan
        from GiaoDich
                 natural join Sach
        where NgayGio = Ngay_input
          and Loai = 'mua';
    elseif opt = 2 then
# 		insert into TongMuaTrongMotNgay
        select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*)
        from GiaoDich
                 natural join Sach
        where NgayGio = Ngay_input
          and Loai = 'mua'
        group by ISBN;
    elseif opt = 3 then
# 		insert into TongTruyenThongMuaTrongMotNgay
        select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*)
        from GiaoDich
                 natural join Sach
        where NgayGio = Ngay_input
          and Loai = 'mua'
          and LoaiSach = 'bản in'
        group by ISBN;
    elseif opt = 4 then
# 		insert into TongDienTuMuaTrongMotNgay
        select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*)
        from GiaoDich
                 natural join Sach
        where NgayGio = Ngay_input
          and Loai = 'mua'
          and LoaiSach = 'bản điện tử'
        group by ISBN;
    else
# 		insert into TongDienTuThueTrongMotNgay
        select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*)
        from GiaoDich
                 natural join Sach
        where NgayGio = Ngay_input
          and Loai = 'thuê'
          and LoaiSach = 'bản điện tử'
        group by ISBN;
    end if;
END$$
DELIMITER ;


drop procedure if exists XemSachMuaTrongMotNgay;
DELIMITER $$
CREATE procedure XemSachMuaTrongMotNgay(day int, month int, year int, opt int)
BEGIN
    if opt = 1 then
        if (day >= 1 and day <= 9) then
            select distinct ISBN, TenSach, GiaTien, TenNhaXuatBan
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-0', day, '%')
              and Loai = 'mua';
        else
            select distinct ISBN, TenSach, GiaTien, TenNhaXuatBan
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-', day, '%')
              and Loai = 'mua';
        end if;
    elseif opt = 2 then
        if (day >= 1 and day <= 9) then
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-0', day, '%')
              and Loai = 'mua'
            group by ISBN;
        else
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-', day, '%')
              and Loai = 'mua'
            group by ISBN;
        end if;
    elseif opt = 3 then
        if (day >= 1 and day <= 9) then
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-0', day, '%')
              and Loai = 'mua'
              and LoaiSach = 'bản in'
            group by ISBN;
        else
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-', day, '%')
              and Loai = 'mua'
              and LoaiSach = 'bản in'
            group by ISBN;
        end if;
    elseif opt = 4 then
        if (day >= 1 and day <= 9) then
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-0', day, '%')
              and Loai = 'mua'
              and LoaiSach = 'bản điện tử'
            group by ISBN;
        else
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-', day, '%')
              and Loai = 'mua'
              and LoaiSach = 'bản điện tử'
            group by ISBN;
        end if;
    else
        if (day >= 1 and day <= 9) then
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-0', day, '%')
              and Loai = 'thuê'
              and LoaiSach = 'bản điện tử'
            group by ISBN;
        else
            select ISBN, TenSach, GiaTien, TenNhaXuatBan, count(*) as SoGiaoDich
            from GiaoDich
                     natural join Sach
            where NgayGio like concat('%', year, '-', month, '-', day, '%')
              and Loai = 'thuê'
              and LoaiSach = 'bản điện tử'
            group by ISBN;
        end if;
    end if;
END$$
DELIMITER ;


drop procedure if exists XemTacGiaCoSachBanChayNhat;
DELIMITER $$
CREATE procedure XemTacGiaCoSachBanChayNhat(Ngay_input date, opt int)
BEGIN
    # 	delete from TacGiaCoSachBanChayNhat;
    if opt = 1 then -- ban chay nhat trong ngay
# 		insert into TacGiaCoSachBanChayNhat
        select AID, HoTen, Email, NamSinh
        from (GiaoDich natural join Viet)
                 natural join TacGia
        where NgayGio = Ngay_input
          and Loai = 'mua'
        group by AID
        having count(*) = (select max(Soluong)
                           from (select count(*) as Soluong
                                 from GiaoDich
                                          natural join Viet
                                 where NgayGio = Ngay_input
                                   and Loai = 'mua'
                                 group by AID) as alias);
    else
# 		insert into TacGiaCoSachBanChayNhat
        select AID, HoTen, Email, NamSinh
        from (GiaoDich natural join Viet)
                 natural join TacGia
        where datediff(Ngay_input, NgayGio) <= 30
          and datediff(Ngay_input, NgayGio) >= 0
          and Loai = 'mua'
        group by AID
        having count(*) = (select max(Soluong)
                           from (select count(*) as Soluong
                                 from GiaoDich
                                          natural join Viet
                                 where datediff(Ngay_input, NgayGio) <= 30
                                   and datediff(Ngay_input, NgayGio) >= 0
                                   and Loai = 'mua'
                                 group by AID) as alias);
    end if;
END$$
DELIMITER ;



drop procedure if exists xemsachmuanhieunhat;
DELIMITER $$
create procedure xemsachmuanhieunhat()
BEGIN
    #     delete from sachmuanhieunhat;
#     insert into sachmuanhieunhat
    select ISBN, TenSach, GiaTien, TenNhaXuatBan
    from sach
             natural join giaodich
    where Loai = 'mua'
    group by Loai
    having count(Loai) = (select MAX(mycount)
                          from (select count(Loai) as mycount from giaodich where Loai = 'mua' group by Loai) as T);
end $$
delimiter ;


drop procedure if exists xemdanhsachthanhtoanthe;
DELIMITER $$
create procedure xemdanhsachthanhtoanthe(date DATE)
BEGIN
    #     delete from danhsachthanhtoanthe;
#     insert into danhsachthanhtoanthe
    select hoadon
    from thanhtoanthe
             natural join giaodich
    where NgayGio = date;
end $$
DELIMITER ;


drop procedure if exists xemdanhsachsucothanhtoanthe;
DELIMITER $$
create procedure xemdanhsachsucothanhtoanthe(NgayGio_input DATE)
BEGIN
    #     delete from danhsachsucothanhtoanthe;
#     insert into danhsachsucothanhtoanthe
    select hoadon
    from (thanhtoanthe natural join thanhtoan)
             natural join giaodich
    where NgayGio = NgayGio_input
      and TrangThai = 'lỗi';
end $$
DELIMITER ;


drop procedure if exists xemisbn10;
DELIMITER $$
create procedure xemisbn10(NgayGio_input DATE)
BEGIN
    #     delete from isbn10;
#     insert into isbn10
    select kho.MaKho
    from ((kho natural join luutru) natural join banin)
             natural join giaodich
    where NgayGio = NgayGio_input
    group by ISBN
    having count(*) < 10;
end $$
DELIMITER ;


drop procedure if exists xemkhoisbnthang;
DELIMITER $$
create procedure xemkhoisbnthang(month INT, year INT)
BEGIN
    #     delete from khoisbnthang;
#     insert into khoisbnthang
    select count(*)
    from kho
             join luutru l on kho.MaKho = l.MaKho
             join banin b on b.ISBN = l.ISBN
             join giaodich g on l.ISBN = g.ISBN
    where NgayGio like concat('%', year, '-', month, '%')
    group by g.ISBN;
end $$
DELIMITER ;


drop procedure if exists xemdanhsachkhohangxuatkhonhieutrongthang;
DELIMITER $$
create procedure xemdanhsachkhohangxuatkhonhieutrongthang(month int, year int)
BEGIN
    #     delete from danhsachkhohangxuatkhonhieu;
#     insert into danhsachkhohangxuatkhonhieu
    select makho
    from xuatkho
    group by makho
    having count(makho) = (select MAX(mycount)
                           from (select count(makho) as mycount
                                 from xuatkho
                                 where soluongxuatnhapkho > 0
                                 group by makho) as T);
end $$
DELIMITER ;



drop procedure if exists CapNhatThongTinCaNhan;
DELIMITER $$
CREATE procedure CapNhatThongTinCaNhan(UID_input varchar(10), HoTen_input varchar(50), DiaChi_input varchar(30),
                                       Phone_input varchar(11))
BEGIN
    update KhachHang
    set HoTen  = HoTen_input,
        DiaChi = DiaChi_input,
        Phone  = Phone_input
    where UID = UID_input;
END$$
DELIMITER ;


drop procedure if exists ChonTheTinDung;
DELIMITER $$
CREATE procedure ChonTheTinDung(HoaDon_input varchar(20), MaThe_input varchar(10))
BEGIN
    if not exists(select * from TheTinDung where MaThe = MaThe_input) then
        insert into TheTinDung(MaThe, HoaDon) values (MaThe_input, HoaDon_input);
    else
        update TheTinDung
        set HoaDon = HoaDon_input
        where MaThe = MaThe_input;
    end if;
END$$
DELIMITER ;


drop procedure if exists CapNhatGiaoDich;
DELIMITER $$
CREATE procedure CapNhatGiaoDich(UID_input varchar(10), ISBN_input varchar(10), NgayGio_input date,
                                 Loai_input varchar(10),
                                 LoaiSach_input varchar(20), SoLuong_input int)
BEGIN
    if not exists(select * from GiaoDich where UID = UID_input and ISBN = ISBN_input and NgayGio = NgayGio_input) then
        insert into GiaoDich(UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong)
        values (UID_input, ISBN_input, NgayGio_input, Loai_input, LoaiSach_input, SoLuong_input);
    else
        update GiaoDich
        set Loai     = Loai_input,
            LoaiSach = LoaiSach_input,
            SoLuong  = SoLuong_input
        where UID = UID_input
          and ISBN = ISBN_input
          and NgayGio = NgayGio_input;
    end if;
END$$
DELIMITER ;


drop procedure if exists XemSachTheoTheLoai;
DELIMITER $$
CREATE procedure XemSachTheoTheLoai(LinhVuc_input varchar(20))
BEGIN
    # 	delete from SachCungTheLoai; truncate SachCungTheLoai ;
#     insert into SachCungTheLoai
    select ISBN, TenSach, GiaTien, TenNhaXuatBan
    from Sach
             natural join LinhVuc
    where ALinhVuc = LinhVuc_input;
END$$
DELIMITER ;


drop procedure if exists XemSachTheoTacGia;
DELIMITER $$
CREATE procedure XemSachTheoTacGia(HoTen_input varchar(50))
BEGIN
    # 	delete from SachCungTacGia;
#     insert into SachCungTacGia
    select ISBN, TenSach, GiaTien, TenNhaXuatBan
    from (Sach natural join Viet)
             natural join TacGia
    where HoTen = HoTen_input;
END$$
DELIMITER ;


drop procedure if exists XemSachTheoTuKhoa;
DELIMITER $$
CREATE procedure XemSachTheoTuKhoa(TuKhoa_input varchar(20))
BEGIN
    # 	delete from SachCungTuKhoa;
#     insert into SachCungTuKhoa
    select ISBN, TenSach, GiaTien, TenNhaXuatBan
    from Sach
             natural join TuKhoa
    where ATuKhoa = TuKhoa_input;
END$$
DELIMITER ;


drop procedure if exists XemSachTheoNamXB;
DELIMITER $$
CREATE procedure XemSachTheoNamXB(NamXB_input int)
BEGIN
    # 	delete from SachCungNamXB;
#     insert into SachCungNamXB
    select ISBN, TenSach, GiaTien, TenNhaXuatBan
    from Sach
             natural join NamSanXuat
    where ANamSanXuat = NamXB_input;
END$$
DELIMITER ;


drop procedure if exists XemMuaTrong1Thang;
DELIMITER $$
CREATE procedure XemMuaTrong1Thang(UID_input varchar(10))
BEGIN
    # 	delete from MuaTrong1Thang;
#     insert into MuaTrong1Thang
    select *
    from GiaoDich
    where UID = UID_input
      and Loai = 'mua'
      and datediff(curdate(), NgayGio) <= 30
      and datediff(curdate(), NgayGio) >= 0;
END$$
DELIMITER ;


drop procedure if exists XemGiaoDichTrong1Thang;
DELIMITER $$
CREATE procedure XemGiaoDichTrong1Thang(UID_input varchar(10), option_num int, month, year)
BEGIN
    if option_num = 1 then
        select *
        from GiaoDich
        where UID = UID_input
          and datediff(curdate(), NgayGio) <= 30
          and datediff(curdate(), NgayGio) >= 0;
    elseif option_num = 2 then
        select UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong, HoaDon
        from GiaoDich
                 natural join ThanhToan
        where UID = UID_input
          and datediff(curdate(), NgayGio) <= 30
          and datediff(curdate(), NgayGio) >= 0
          and TrangThai = 'lỗi';
    else
        select UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong, HoaDon
        from GiaoDich
                 natural join ThanhToan
        where UID = UID_input
          and datediff(curdate(), NgayGio) <= 30
          and datediff(curdate(), NgayGio) >= 0
          and TrangThai = 'chưa thanh toán';
    end if;
END$$
DELIMITER ;


drop procedure if exists XemTacGiaTheoTheLoai;
DELIMITER $$
CREATE procedure XemTacGiaTheoTheLoai(LinhVuc_input varchar(20))
BEGIN
    select distinct AID, HoTen, Email, NamSinh
    from (TacGia natural join Viet)
             natural join LinhVuc
    where ALinhVuc = LinhVuc_input;
END$$
DELIMITER ;


drop procedure if exists XemTacGiaTheoTuKhoa;
DELIMITER $$
CREATE procedure XemTacGiaTheoTuKhoa(TuKhoa_input varchar(20))
BEGIN
    select distinct AID, HoTen, Email, NamSinh
    from (TacGia natural join Viet)
             natural join TuKhoa
    where ATuKhoa = TuKhoa_input;
END$$
DELIMITER ;


drop procedure if exists XemTongSoSachTheoTheLoai;
DELIMITER $$
CREATE procedure XemTongSoSachTheoTheLoai(UID_input varchar(10), LinhVuc_input varchar(20))
BEGIN
    if LinhVuc_input = '' then
        select ALinhVuc, count(*)
        from GiaoDich
                 natural join LinhVuc
        where UID = UID_input
          and datediff(curdate(), NgayGio) <= 30
          and datediff(curdate(), NgayGio) >= 0
        group by ALinhVuc;
    else
        select UID, count(*)
        from GiaoDich
                 natural join LinhVuc
        where UID = UID_input
          and datediff(curdate(), NgayGio) <= 30
          and datediff(curdate(), NgayGio) >= 0
          and ALinhVuc = LinhVuc_input;
    end if;
END$$
DELIMITER ;


drop procedure if exists XemGDMuaNhieuNhatTrong1Thang;
DELIMITER $$
CREATE procedure XemGDMuaNhieuNhatTrong1Thang(UID_input varchar(10))
BEGIN
    select *
    from GiaoDich
    where UID = UID_input
      and Loai = 'mua'
      and datediff(curdate(), NgayGio) <= 30
      and datediff(curdate(), NgayGio) >= 0
      and Soluong = (select max(Soluong)
                     from GiaoDich
                     where UID = UID_input
                       and Loai = 'mua'
                       and datediff(curdate(), NgayGio) <= 30
                       and datediff(curdate(), NgayGio) >= 0);
END$$
DELIMITER ;



drop procedure if exists XemGD2LoaiTrong1Thang;
DELIMITER $$
CREATE procedure XemGD2LoaiTrong1Thang(UID_input varchar(10))
BEGIN
    select *
    from GiaoDich
    where UID = UID_input
      and datediff(curdate(), NgayGio) <= 30
      and datediff(curdate(), NgayGio) >= 0
      and ISBN in (select distinct ISBN
                   from GiaoDich
                   where UID = UID_input
                     and LoaiSach = 'bản in'
                     and datediff(curdate(), NgayGio) <= 30
                     and datediff(curdate(), NgayGio) >= 0
                     and ISBN in
                         (select ISBN
                          from GiaoDich
                          where UID = UID_input
                            and LoaiSach = 'bản điện tử'
                            and datediff(curdate(), NgayGio) <= 30
                            and datediff(curdate(), NgayGio) >= 0));
END$$
DELIMITER ;



drop procedure if exists ThemSach;
DELIMITER $$
CREATE procedure ThemSach(ISBN_input varchar(10), TenSach_input varchar(30), GiaTien_input int,
                          LinhVuc_input varchar(20), TenNhaXuatBan_input varchar(30), HoTen_TacGia varchar(50))
BEGIN
    if not exists(select * from NhaXuatBan where TenNhaXuatBan = TenNhaXuatBan_input) then
        insert into NhaXuatBan values (TenNhaXuatBan_input);
    end if;
    if not exists(select * from Sach where ISBN = ISBN_input) then
        insert into Sach values (ISBN_input, TenSach_input, GiaTien_input, TenNhaXuatBan_input);
        insert into LinhVuc values (ISBN_input, LinhVuc_input);
        insert into Viet select AID, ISBN_input from TacGia where HoTen = HoTen_TacGia;
    end if;
END$$
DELIMITER ;


drop procedure if exists TimSachTheoTen;
DELIMITER $$
CREATE procedure TimSachTheoTen(TenSach_input varchar(30))
BEGIN
    select *
    from Sach
    where LOCATE(TenSach_input, TenSach) > 0;
END$$
DELIMITER ;



drop procedure if exists ChinhSuaCart;
DELIMITER $$
CREATE procedure ChinhSuaCart(UID_input varchar(10), isbn_input varchar(10), soluong_input int,
                              mahoadon_input varchar(20))
BEGIN
    if not exists(
            select * from cart_4customer where UID = UID_input and isbn = isbn_input and mahoadon = mahoadon_input) then
        insert into cart_4customer
        values (UID_input, ISBN_input, soluong_input, mahoadon_input,
                (select GiaTien from Sach where isbn = isbn_input));
    else
        update cart_4customer
        set soluong = soluong + soluong_input
        where UID = UID_input
          and isbn = isbn_input
          and mahoadon = mahoadon_input;
    end if;
END$$
DELIMITER ;



drop procedure if exists XemMuaTrong1Thang;
DELIMITER $$
CREATE procedure XemMuaTrong1Thang(UID_input varchar(10), month INT, year INT)
BEGIN
    select *
    from GiaoDich
    where UID = UID_input
      and Loai = 'mua'
      and NgayGio like concat('%', year, '-', month, '%');
END$$
DELIMITER ;

drop procedure if exists XemGiaoDichTrong1Thang;
DELIMITER $$
CREATE procedure XemGiaoDichTrong1Thang(UID_input varchar(10), option_num int, month INT, year INT)
BEGIN
    if option_num = 1 then
        select *
        from GiaoDich
        where UID = UID_input
          and NgayGio like concat('%', year, '-', month, '%');
    elseif option_num = 2 then
        select UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong, HoaDon
        from GiaoDich
                 natural join ThanhToan
        where UID = UID_input
          and NgayGio like concat('%', year, '-', month, '%')
          and TrangThai = 'lỗi';
    else
        select UID, ISBN, NgayGio, Loai, LoaiSach, SoLuong, HoaDon
        from GiaoDich
                 natural join ThanhToan
        where UID = UID_input
          and NgayGio like concat('%', year, '-', month, '%')
          and TrangThai = 'chưa thanh toán';
    end if;
END$$
DELIMITER ;


drop procedure if exists XemTongSoSachTheoTheLoai;
DELIMITER $$
CREATE procedure XemTongSoSachTheoTheLoai(UID_input varchar(10), LinhVuc_input varchar(20), month INT, year INT)
BEGIN
    if LinhVuc_input = '' then
        select ALinhVuc, count(*) as tongso
        from GiaoDich
                 natural join LinhVuc
        where UID = UID_input
          and NgayGio like concat('%', year, '-', month, '%')
        group by ALinhVuc;
    else
        select UID, count(*) as tongso
        from GiaoDich
                 natural join LinhVuc
        where UID = UID_input
          and NgayGio like concat('%', year, '-', month, '%')
          and ALinhVuc = LinhVuc_input;
    end if;
END$$
DELIMITER ;


drop procedure if exists XemGDMuaNhieuNhatTrong1Thang;
DELIMITER $$
CREATE procedure XemGDMuaNhieuNhatTrong1Thang(UID_input varchar(10), month INT, year INT)
BEGIN
    select *
    from GiaoDich
    where UID = UID_input
      and Loai = 'mua'
      and NgayGio like concat('%', year, '-', month, '%')
      and Soluong = (select max(Soluong)
                     from GiaoDich
                     where UID = UID_input
                       and Loai = 'mua'
                       and NgayGio like concat('%', year, '-', month, '%'));
END$$
DELIMITER ;


drop procedure if exists XemGD2LoaiTrong1Thang;
DELIMITER $$
CREATE procedure XemGD2LoaiTrong1Thang(UID_input varchar(10), month INT, year INT)
BEGIN
    select *
    from GiaoDich
    where UID = UID_input
      and NgayGio like concat('%', year, '-', month, '%')
      and ISBN in (select distinct ISBN
                   from GiaoDich
                   where UID = UID_input
                     and LoaiSach = 'bản in'
                     and NgayGio like concat('%', year, '-', month, '%')
                     and ISBN in
                         (select ISBN
                          from GiaoDich
                          where UID = UID_input
                            and LoaiSach = 'bản điện tử'
                            and NgayGio like concat('%', year, '-', month, '%')));
END$$
DELIMITER ;



drop procedure if exists XemSachTrong1Ngay;
DELIMITER $$
CREATE procedure XemSachTrong1Ngay(UID_input varchar(10), day int, month INT, year INT)
BEGIN
    if (day >= 1 and day <= 9) then
        select distinct ISBN
        from GiaoDich
        where UID = UID_input
          and Loai = 'mua'
          and NgayGio like concat('%', year, '-', month, '-0', day, '%');
    else
        select distinct ISBN
        from GiaoDich
        where UID = UID_input
          and Loai = 'mua'
          and NgayGio like concat('%', year, '-', month, '-', day, '%');
    end if;
END$$
DELIMITER ;

drop procedure if exists XemSachTrong1Thang;
DELIMITER $$
CREATE procedure XemSachTrong1Thang(UID_input varchar(10), month INT, year INT)
BEGIN
    select distinct ISBN
    from GiaoDich
    where UID = UID_input
      and Loai = 'mua'
      and NgayGio like concat('%', year, '-', month, '%');
END$$
DELIMITER ;


drop procedure if exists ChinhSuaCart;
DELIMITER $$
CREATE procedure ChinhSuaCart(UID_input varchar(10), isbn_input varchar(10), soluong_input int,
                              mahoadon_input varchar(20), loai_input varchar(20), loaisach_input varchar(20))
BEGIN
    if not exists(
            select * from cart_4customer where UID = UID_input and isbn = isbn_input and mahoadon = mahoadon_input) then
        if not exists(select * from ThanhToan where HoaDon = mahoadon_input) then
            insert into ThanhToan(HoaDon) values (mahoadon_input);
        end if;
        insert into cart_4customer
        values (UID_input, ISBN_input, soluong_input, mahoadon_input, loai_input, loaisach_input,
                (select GiaTien from Sach where isbn = isbn_input));
    else
        update cart_4customer
        set soluong = soluong_input
        where UID = UID_input
          and isbn = isbn_input
          and mahoadon = mahoadon_input;
    end if;
END$$
DELIMITER ;



drop procedure if exists ChinhSuaCartThanhToan;
DELIMITER $$
create
    definer = root@localhost procedure ChinhSuaCartThanhToan(IN UID_input varchar(10), IN isbn_input varchar(10),
                                                             IN soluong_input int, IN mahoadon_input varchar(20),
                                                             IN type varchar(30), IN loaisach varchar(30))
BEGIN
    if not exists(
            select * from cart_4customer where UID = UID_input and isbn = isbn_input and mahoadon = mahoadon_input) then
        if not exists(select * from ThanhToan where HoaDon = mahoadon_input) then
            insert into ThanhToan(HoaDon) values (mahoadon_input);
        end if;
        insert into cart_4customer
        values (UID_input, ISBN_input, soluong_input, mahoadon_input, type, loaisach
        , (select GiaTien from Sach where isbn = isbn_input));
    else
        update cart_4customer
        set soluong = soluong_input,
            Loai=type,
            LoaiSach=loaisach
        where UID = UID_input
          and isbn = isbn_input
          and mahoadon = mahoadon_input;
    end if;
END$$
DELIMITER ;



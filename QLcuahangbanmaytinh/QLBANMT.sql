use master
go
create database qlcuahangmaytinh
go
use qlcuahangmaytinh
go


CREATE TABLE tblNhanVien
(	
	MaNV char(10) constraint pk_tblNhanVien primary key,
	TenNV varchar(50),
	GioiTinh nvarchar(50),
	DiaChi nvarchar(50),
	sdt int,
)
GO


CREATE TABLE tblNhaCungCap
(
	MaNCC char(10) constraint pk_tblNhaCungCap primary key,
	TenNCC varchar(50),
	Diachi nvarchar(50),
	sdt int,
)
GO


create table tblKhachHang
(
	MaKH char(10) constraint pk_tblKhachHang primary key,
	TenKH varchar(50),
	GioiTinh nvarchar(50), 
	DiaChi nvarchar(50),
	sdt int,
)
go


create table tblThongTinMT
(
	MaMT char(10) constraint pk_tblThongTinMT primary key,
	tenmt varchar(50),
	MaNCC char(10),
	soluong int,
	giaban int,
	CONSTRAINT fk_tblThongTinMT_tblNhaCungCap FOREIGN KEY(MaNCC) REFERENCES tblNhaCungCap(MaNCC),
)
go

create table tblHoaDonBan
(
MaHDB char(10) constraint pk_tblHoaDonBan primary key,
MaNV char(10) CONSTRAINT fk_tblHoaDonBan_tblKhachHang FOREIGN KEY(MaKH) REFERENCES tblKhachHang(MaKH),
MaKH char(10) CONSTRAINT fk_tblHoaDonBan_tblNhanVien FOREIGN KEY(MaNV) REFERENCES tblNhanVien(MaNV),
MaMT char(10) CONSTRAINT fk_tblHoaDonBan_tblThongTinMT FOREIGN KEY(MaMT) REFERENCES tblThongTinMT(MaMT),
Soluong int,
Ngayban date,
Diachi varchar(50),
sdt int,
Dongia float,
Tongtien float,

)
go
create table tblHoaDonNhap
(
MaHDN char(10) constraint pk_tblHoaDonNhap primary key,
MaNV char(10) CONSTRAINT fk_tblHoaDonNhap_tblNhanVien FOREIGN KEY(MaNV) REFERENCES tblNhanVien(MaNV),
MaMT char(10) CONSTRAINT fk_tblHoaDonNhap_tblThongTinMT FOREIGN KEY(MaMT) REFERENCES tblThongTinMT(MaMT),
MaNCC char(10) CONSTRAINT fk_tblHoaDonNhap_tblNhaCungCap FOREIGN KEY(MaNV) REFERENCES tblNhanVien(MaNV),
Soluong int,
Ngayban date,
Diachi varchar(50),
sdt int,
Dongia float,
Tongtien float,

)
insert into tblNhaCungCap values('ACER','QUYET','HANOI','1659939186')
insert into tblNhaCungCap values('DELL','TUNG','HANOI','122345')

--Them thong tin may tinh
insert into tblThongTinMT values('MT01','DELL577','DELL','2','1200')
insert into tblThongTinMT values('MT02','ASUS ROG','ACER','2','1200')

insert into tblNhanVien values ('NV01','QUYET','nam','ha noi','12345')
insert into tblNhanVien values ('NV02','NGAN','nu','ha noi','12432')

insert into tblKhachHang values ('KH01','hIEU','nam','ha noi','124345')
insert into tblKhachHang values ('KH02','TUYEN','nu','ha noi','124432')


--Them thong tin hoa don ban
insert into tblHoadonban values ('HDB01','NV01','KH01','MT01','1200','2014-01-01','HY','1659939285','120','144000')
insert into tblHoadonban values ('HDB02','NV02','KH02','MT02','12','2014-01-03','HY','1356789','100','1200')

--Them thong tin hoa don nhap
insert into tblHoadonnhap values ('HDN01','NV01','MT01','ACER','125','2014-01-10','HN','1465676778','1005','125625')
insert into tblHoadonnhap values ('HDN02','NV02','MT02','DELL','23','2014-01-01','HY','2132456','12000','276000')


create database QuanLyBangDia
go
use QuanLyBangDia
go
create table TheLoai
(
	IDTheLoai char(5) not null primary key,
	TenTheLoai nvarchar(30) not null
)
go
------------------------------------------------------------------
-----------------------
create table QuocGia
(
	IDQuocGia char(5)not null primary key,
	TenQuocGia nvarchar(30)
)
go

------------------------------------------------------------------
create table NhaCungCap
(
	IDNhaCungCap char(5) not null primary key,
	IDQuocGia char(5) references QuocGia(IDQuocGia),
	TenNhaCungCap nvarchar(40) not null,
	SDT nvarchar(15) not null,
	Email nvarchar(30)
)
go
------------------------------------------------------------------
create table BangDia
(
	IDBangDia char(5) not null primary key,
	IDNhaCungCap char(5) not null references NhaCungCap(IDNhaCungCap),
	IDTheLoai char(5) not null references TheLoai(IDTheLoai),
	TenBD nvarchar(40) not null,
	MoTa nvarchar(500),
	GiaThue money not null,
	SoLuong int
)
go
------------------------------------------------------------------
create table TaiKhoan
(
	IDTaiKhoan char(5) not null primary key,
	TenTK nvarchar(28) not null,
	MatKhau nvarchar(24) not null,
)
go
------------------------------------------------------------------
Create table KhachHang
(
	IDKhachHang char(5) not null primary key,
	HotenKH nvarchar(40) not null,
	GioiTinh nvarchar (5),
	NgaySinh date,
	NgayDangKy date not null,
	CMND nvarchar(9) not null,
	DiaChi nvarchar(50),
	Email nvarchar(30),
	SDT nvarchar(15) not null

)
go
------------------------------------------------------------
create table ChucVu
(
	IDChucVu char(5) not null primary key,
	ChucVu nvarchar(30) not null
)
go
------------------------------------------------------------------
create table NhanVien
(
	IDNhanVien char(5) not null primary key,
	HoTenNV Nvarchar(40) not null,
	IDChucVu char(5) not null references ChucVu(IDChucVu),
	GioiTinh nvarchar(5),
	NgaySinh date,
	NgayLamViec date,
	CMND nvarchar(9) not null,
	DiaChi nvarchar(50),
	Email nvarchar(30),
	SDT nvarchar(15),
	TinhTrang smallint ,
	IDTaiKhoan char(5) not null references TaiKhoan(IDTaiKhoan),
)
go
------------------------------------------------------------------
Create table HoaDon
(
	IDHoaDon char(5) not null primary key,
	IDNhanVien char(5) not null references NhanVien(IDNhanVien),
	IDKhachHang char(5) not null references KhachHang(IDKhachHang),
	NgayLapHD Date,
	NgayTraDia Date
)
go
------------------------------------------------------------------
create table ChiTietHoaDon
(
	IDBangDia char(5) not null references BangDia(IDBangDia),
	IDHoaDon char(5) not null references HoaDon(IDHoaDon),
	SoLuong int,
	primary key (IDBangDia,IDHoaDon),
)
go
------------------------------------------------------------------
insert TheLoai values('TL111',N'Hành động')
insert TheLoai values('TL112',N'Hài hước')
insert TheLoai values('TL113',N'Cổ trang')
insert TheLoai values('TL114',N'Viễn tưởng')
insert TheLoai values('TL115',N'Âm nhạc')
insert TheLoai values('TL116',N'Hoạt hình')
insert TheLoai values('TL117',N'Kinh dị')
insert TheLoai values('TL118',N'Gia đình')
insert TheLoai values('TL119',N'Chiến tranh')
insert TheLoai values('TL120',N'Chiếu rạp')
go
------------------------------------------------------------------
insert QuocGia values('QG111',N'Việt Nam')
insert QuocGia values('QG112',N'Lào')
insert QuocGia values('QG113',N'Campuchia')
insert QuocGia values('QG114',N'Trung Quốc')
insert QuocGia values('QG115',N'Hàn Quốc')
insert QuocGia values('QG116',N'Mĩ')
insert QuocGia values('QG117',N'Canada')
insert QuocGia values('QG118',N'Úc')
insert QuocGia values('QG119',N'Đức')
insert QuocGia values('QG120',N'Anh')
insert QuocGia values('QG121',N'Nhật Bản')
go
------------------------------------------------------------------
insert NhaCungCap values('CC111','QG111',N'Công ty Hoàng Anh','0123456789','hoanganh@gmail.com')
insert NhaCungCap values('CC112','QG112',N'Công ty Tiến Anh','0165482963','tienanh@gmail.com')
insert NhaCungCap values('CC113','QG113',N'Công ty Quốc Anh','7896541236','quocganh@gmail.com')
insert NhaCungCap values('CC114','QG114',N'Công ty Bảo Bình','6542587563','hoanganh@gmail.com')
insert NhaCungCap values('CC115','QG115',N'Công ty Bảo Bảo','0301452398','baobao@gmail.com')
insert NhaCungCap values('CC116','QG116',N'Công ty Anh Việt','6320147585','anhviet@gmail.com')
insert NhaCungCap values('CC117','QG117',N'Công ty Ánh Kim','0449633336','anhkim@gmail.com')
insert NhaCungCap values('CC118','QG118',N'Công ty Kim Đồng','456656698','kimdongh@gmail.com')
insert NhaCungCap values('CC119','QG119',N'Công ty Ao Sin','03336669998','aosinh@gmail.com')
insert NhaCungCap values('CC120','QG120',N'Công ty Minh Trí','0141415659','hoang1anh@gmail.com')
insert NhaCungCap values('CC121','QG121',N'Công ty Văn Nghĩa','0125656789','assah@gmail.com')
insert NhaCungCap values('CC122','QG115',N'Công ty King Z','0123458989','king1231@gmail.com')
insert NhaCungCap values('CC123','QG113',N'Công ty Lối Nhỏ','0127576789','qah@gmail.com')
insert NhaCungCap values('CC124','QG117',N'Công ty Vì Yêu','0123465489','viyeu@gmail.com')
insert NhaCungCap values('CC125','QG112',N'Công ty Chill','1346295687','chiphet@gmail.com')
go
------------------------------------------------------------------
insert BangDia values('BD111','CC111','TL111',N'Chí Phèo tiền truyện',N'Chí phèo thời hiện đại',10000,100)
insert BangDia values('BD112','CC112','TL119',N'Doraemon',N'mèo máy đến từ tương lai',10000,100)
insert BangDia values('BD113','CC111','TL118',N'Châu Tinh Trì',N'Tuyển tập phim về CTT',10000,60)
insert BangDia values('BD114','CC115','TL117',N'BigBang',N'Tuyển tập các bài hát của BB',10000,100)
insert BangDia values('BD115','CC112','TL116',N'Trọn đời bên em',N'tuyển tập từ 1 đến 10',10000,40)
insert BangDia values('BD116','CC114','TL115',N'Nữ Siêu nhân',N'Nữ Siêu nhân gánh trái đất',10000,100)
insert BangDia values('BD117','CC112','TL114',N'Thời đại mới',null,15000,100)
insert BangDia values('BD118','CC115','TL113',N'Naruto thế hệ mới',null,15000,50)
insert BangDia values('BD119','CC113','TL112',N'Học viện anh hùng',null,15000,100)
insert BangDia values('BD120','CC117','TL112',N'Học viện anh hùng phan 2',null,20000,80)
insert BangDia values('BD121','CC115','TL111',N'Liên Minh Huyền Thoại',null,10000,50)
insert BangDia values('BD122','CC125','TL112',N'Vì Yêu',null,10000,50)
insert BangDia values('BD123','CC116','TL113',N'Trái Tim Băng Giá',null,15000,50)
insert BangDia values('BD124','CC118','TL114',N'Mùa Đông Không Lạnh',null,10000,50)
insert BangDia values('BD125','CC117','TL115',N'Naruto',null,10000,50)
insert BangDia values('BD126','CC112','TL116',N'Vua Hải Tặc',null,15000,50)
insert BangDia values('BD127','CC111','TL117',N'Hoàng Phi Hồng',null,15000,50)
insert BangDia values('BD128','CC114','TL118',N'King of war',null,15000,50)
insert BangDia values('BD129','CC113','TL119',N'Siêu Nhân Gao',null,10000,50)
insert BangDia values('BD130','CC117','TL120',N'Day By Day',null,10000,50)
insert BangDia values('BD131','CC118','TL111',N'A Better Day',null,10000,50)
insert BangDia values('BD132','CC119','TL112',N'Z TokyO',null,10000,50)
insert BangDia values('BD133','CC120','TL113',N'Đại dịch Zombie',null,10000,50)
insert BangDia values('BD134','CC121','TL114',N'Cương Thi Trở Về',null,15000,50)
insert BangDia values('BD135','CC122','TL115',N'Phim ma Lâm Chánh Anh',null,10000,50)
insert BangDia values('BD136','CC123','TL116',N'Phi Đội',null,15000,50)
insert BangDia values('BD137','CC124','TL117',N'Cô Dâu Ma',null,10000,50)
insert BangDia values('BD138','CC125','TL118',N'Tình Yêu Vĩnh Cửu',null,10000,50)
insert BangDia values('BD139','CC124','TL119',N'Zo của tôi',null,15000,50)
insert BangDia values('BD140','CC122','TL120',N'Liên quân vi diệu',null,10000,50)
insert BangDia values('BD141','CC121','TL112',N'Thầy giáo ba',null,15000,50)
insert BangDia values('BD142','CC111','TL112',N'Đặc vụ SuSan0175',null,15000,50)
insert BangDia values('BD143','CC125','TL113',N'Poppy vệ binh tinh tú',null,10000,50)
insert BangDia values('BD144','CC125','TL114',N'Chủ nhân của những thẻ bài',null,10000,50)
insert BangDia values('BD145','CC111','TL115',N'Mật vụ chim mồi',null,15000,50)
insert BangDia values('BD146','CC111','TL116',N'Nữ Hoàng Băng Giá',null,10000,50)
insert BangDia values('BD147','CC112','TL117',N'Sự trỗi dậy của Seju',null,15000,50)
insert BangDia values('BD148','CC115','TL118',N'Nếu tôi là GOD',null,10000,50)
insert BangDia values('BD149','CC115','TL119',N'Liêu trai chí dị',null,15000,50)
insert BangDia values('BD150','CC116','TL120',N'Ông cương thi',null,10000,50)

go
------------------------------------------------------------------
insert TaiKhoan values('TK111','quanly','quanly')
insert TaiKhoan values('TK112','nhanvien','nhanvien')
insert TaiKhoan values('TK113','ADMIN3','ADMIN3')
insert TaiKhoan values('TK114','vovannghia','admin')
insert TaiKhoan values('TK115','mongtritai','admin')
insert TaiKhoan values('TK116','mailoc','admin')
insert TaiKhoan values('TK117','NHANVIEN1','admin')
insert TaiKhoan values('TK118','NHANVIEN2','admin')
insert TaiKhoan values('TK119','NHANVIEN3','admin')
insert TaiKhoan values('TK120','NHANVIEN4','admin')
GO
-----------------------------------------------------------------------------------------------------
insert ChucVu values('CV111',N'Quản Lý')
insert ChucVu values('CV112',N'Bán Hàng')
go
------------------------------------------------------------------
insert NhanVien values('NV111',N'Võ Văn Nghĩa','CV111',N'Nữ','10-10-2001','10-10-2010','258964784',N'Hồ Chí Minh','adad@gmail.com','0123456789',1,'TK111')
insert NhanVien values('NV112',N'Mai Loc','CV112',N'Nữ','10-10-2002','10-10-2010','201587469',N'Hồ Chí Minh','adww@gmail,com','0123456789',1,'TK112')
insert NhanVien values('NV113',N'Trí Tài','CV111',N'Nữ','10-10-2003','10-10-2010','254789652',N'Hồ Chí Minh','ad22a@gmail.com','0123456789',1,'TK113')
insert NhanVien values('NV114',N'Võ Văn Nghĩa','CV112',N'Nữ','06-09-1999','10-12-2010','125489652',N'Thủ Đức, Hồ Chí Minh','nghia@gmail.com','0123987654',1,'TK114')
insert NhanVien values('NV115',N'Trí Tài','CV112',N'Nữ','09-06-1999','09-10-2012','123456987',N'Gò Vấp, Hồ Chí Minh','tai@gmail.com','0123456987',1,'TK115')
insert NhanVien values('NV116',N'Mai Lộc','CV112',N'Nam','11-12-1998','06-10-2011','145236987',N'Gò Vấp, Hồ Chí Minh','mailoc@gmail.com','0147896325',1,'TK116')
insert NhanVien values('NV117',N'Nguyễn Văn Lượng','CV112',N'Nữ','10-12-1999','10-10-2010','123456781',N'Hồ Chí Minh','nguyenvanluong@gmail.com','01569874523',1,'TK117')
insert NhanVien values('NV118',N'Nguyễn Thiên ','CV112',N'Nữ','01-01-2002','10-10-2015','132654875',N'Hồ Chí Minh','nguyenthien@gmail.com','09875463215',1,'TK118')
insert NhanVien values('NV119',N'Trần Tú','CV112',N'Nam','09-06-2003','10-10-2014','120123654',N'Hồ Chí Minh','trantu@gmail.com','03698754269',1,'TK119')
insert NhanVien values('NV120',N'Trần Kiều Oanh','CV112',N'Nữ','06-09-2003','10-10-2012','789526314',N'Hồ Chí Minh','trankieuoanh@gmail.com','09081278951',1,'TK120')
go
------------------------------------------------------------------
insert KhachHang values('KH111',N'Trí Tài',N'Nam','10-10-2003','10-10-2018','235879451',N'Hà Nội','anhd@gmail.com','01256498754')
insert KhachHang values('KH112',N'Mai Lộc',N'Nam','10-10-2003','12-10-2019','122333456',N'Đà Nẵng','thica@gmail.com','01234156789')
insert KhachHang values('KH113',N'Võ Văn Nghĩa',N'Nam','10-10-2003','09-10-2019','144523456',N'hồ Chí Minh','ada@gmail.com','0124563985')
insert KhachHang values('KH114',N'Nguyễn Canh',N'Nam','10-10-1998','09-10-2013','123412456',N'Hồ Chí Minh','nghiahoo@gmail.com','0125863498')
insert KhachHang values('KH115',N'Long Cánh',N'Nam','10-10-1989','09-10-2014','123447756',N'Hồ Chí Minh','canhcanh@gmail.com','0125986789')
insert KhachHang values('KH116',N'Trần Dần',N'Nam','11-10-1989','08-10-2015','770123456',N'Hồ Chí Minh','trandan@gmail.com','0968456789')
insert KhachHang values('KH117',N'Trần Dần',N'Nữ','07-10-1978','08-10-2015','575013456',N'Hồ Chí Minh','leanh@gmail.com','0985656789')
insert KhachHang values('KH118',N'Ông Lê Tân',N'Nam','08-10-1984','09-10-2016','757013456',N'Hồ Chí Minh','tanti@gmail.com','0936587491')
insert KhachHang values('KH119',N'Nguyễn Kinh',N'Nam','06-10-1969','09-10-2017','870123456',N'Hồ Chí Minh','kinhch@gmail.com','0548154961')
insert KhachHang values('KH120',N'Tinh Tinh',N'Nam','10-08-1988','10-10-2011','808123456',N'Hồ Chí Minh','tinhtinh@gmail.com','0916432587')
insert KhachHang values('KH121',N'Châu Khải Đức',N'Nam','01-10-1989','10-09-2019','012378456',N'Hồ Chí Minh','ada22@gmail.com','0125876349')
insert KhachHang values('KH122',N'Linh Tinh',N'Nữ','10-10-1998','06-10-2019','018283456',N'Hồ Chí Minh','tungtinh@gmail.com','0122586489')
insert KhachHang values('KH123',N'Tú Cần',N'Nam','10-11-1991','10-22-2018','450123456',N'Hồ Chí Minh','athienaa@gmail.com','0123436985')
insert KhachHang values('KH124',N'Cận Cần',N'Nam','10-19-1992','10-22-2018','550123456',N'Hồ Chí Minh','cungtam@gmail.com','0362589652')
insert KhachHang values('KH125',N'Trần Tim',N'Nam','10-28-1992','10-21-2018','580123456',N'Hồ Chí Minh','timtim@gmail.com','0365892451')
insert KhachHang values('KH126',N'Cung Sanh',N'Nam','02-23-1992','10-23-2018','488123456',N'Hồ Chí Minh','sanhanh@gmail.com','0368519421')
insert KhachHang values('KH127',N'Nguyễn Đức',N'Nam','05-06-2000','10-23-2018','899013456',N'Hồ Chí Minh','ducaa@gmail.com','0365896415')
insert KhachHang values('KH128',N'Trần Chánh',N'Nam','10-06-2000','10-23-2018','998023456',N'Hồ Chí Minh','chanhca@gmail.com','0896534812')
insert KhachHang values('KH129',N'Trần Kim',N'Nam','10-04-2000','10-23-2018','470123456',N'Hồ Chí Minh','kimkim@gmail.com','0258964318')
insert KhachHang values('KH130',N'Trần Thảo Nhi',N'Nữ','11-10-2000','10-25-2018','023844656',N'Hồ Chí Minh','nhinhi@gmail.com','0215487963')
insert KhachHang values('KH131',N'Nguyễn Ngọc Ngọc',N'Nữ','10-13-2001','10-01-2017','012346486',N'Hồ Chí Minh','ngocngoc@gmail.com','0896475819')
insert KhachHang values('KH132',N'Lê Thảo Y',N'Nữ','10-10-1996','10-19-2017','123454226',N'Hồ Chí Minh','yyyyy@gmail.com','0896451782')
insert KhachHang values('KH133',N'Nguyễn Kin Yến',N'Nữ','10-10-1993','10-08-2017','012123456',N'Hồ Chí Minh','yenyen@gmail.com','0968563214')
insert KhachHang values('KH134',N'Trần Hữu Tài',N'Nam','10-10-1997','10-14-2017','012345206',N'Hồ Chí Minh','taitaica@gmail.com','0215896354')
insert KhachHang values('KH135',N'Hà Văn Trụ',N'Nam','10-10-1969','10-16-2017','012345226',N'Hồ Chí Minh','truem@gmail.com','0965863254')
insert KhachHang values('KH136',N'Trần Thảo Vy',N'Nữ','10-24-1991','10-17-2018','012304556',N'Hồ Chí Minh','byvy@gmail.com','0236589478')
insert KhachHang values('KH137',N'Nguyễn Yến Nhi',N'Nữ','10-28-1998','10-18-2018','012345506',N'Hồ Chí Minh','nhiyeen@gmail.com','013254698')
insert KhachHang values('KH138',N'Oanh Thị Hiền',N'Nữ','10-27-1991','10-19-2019','012345586',N'Hồ Chí Minh','hienaaa@gmail.com','012694899')
insert KhachHang values('KH139',N'Lê Hiền Nhi',N'Nữ','10-26-1999','10-19-2019','015223456',N'Hồ Chí Minh','nhuuu@gmail.com','0934615874')
insert KhachHang values('KH140',N'Văn Kim Tú',N'Nữ','10-25-1998','10-18-2019','012403456',N'Hồ Chí Minh','tutututu@gmail.com','0345691844')
insert KhachHang values('KH141',N'Văn Thị Thu Yến',N'Nữ','10-24-2003','10-17-2018','012344156',N'Hồ Chí Minh','adadwthien@gmail.com','0963587124')
insert KhachHang values('KH142',N'Huỳnh Thị Thúy',N'Nữ','10-23-2003','10-26-2018','012341216',N'Hồ Chí Minh','thuyht@gmail.com','0434648494')
insert KhachHang values('KH143',N'Phạm Lê Ngân',N'Nữ','06-21-2003','10-25-2017','024543456',N'Hồ Chí Minh','nganaa@gmail.com','0346491541')
insert KhachHang values('KH144',N'Nguyễn Trần Dương',N'Nam','12-15-1997','10-10-2018','012454856',N'Hồ Chí Minh','duong69@gmail.com','0345484444')
insert KhachHang values('KH145',N'Trần Nam',N'Nam','10-10-1997','10-11-2016','012344876',N'Hồ Chí Minh','namaa@gmail.com','0454545454')
insert KhachHang values('KH146',N'Võ Ánh',N'Nữ','10-10-1997','10-01-2016','084523456',N'Hồ Chí Minh','anhaaa@gmail.com','0236589641')
insert KhachHang values('KH147',N'Mông Tài',N'Nữ','10-15-1997','10-04-2016','801542456',N'Hồ Chí Minh','taiem@gmail.com','0101014444')
insert KhachHang values('KH148',N'Mông Lộc',N'Nam','10-01-2003','10-07-2018','084128456',N'Hồ Chí Minh','locpro@gmail.com','0404546433')
insert KhachHang values('KH149',N'Mông Nghĩa',N'Nữ','09-10-2003','10-14-2016','048823456',N'Hồ Chí Minh','nghiaho@gmail.com','0414141414')
insert KhachHang values('KH150',N'Mông Mông',N'Nữ','07-10-2003','10-08-2016','023544456',N'Hồ Chí Minh','ngang@gmail.com','0050505054')
insert KhachHang values('KH151',N'Kim Ngân',N'Nữ','10-08-1999','10-01-2016','012342486',N'Hà Nội','adaw@gmail.com','0985552424')
insert KhachHang values('KH152',N'Trần Thị Cúc',N'Nữ','12-10-1993','10-21-2018','012345256',N'Hồ Chí Minh','ada2@gmail.com','0999999944')
insert KhachHang values('KH153',N'Võ Tính',N'Nam','06-10-1996','10-29-2018','032123456',N'Hồ Chí Minh','tinh@gmail.com','0988888888')
insert KhachHang values('KH154',N'Võ Văn Tài',N'Nam','10-06-1995','10-22-2019','012312356',N'Hồ Chí Minh','awm@gmail.com','0124141242')
insert KhachHang values('KH155',N'Trần Sinh',N'Nam','10-12-1995','10-21-2019','240123456',N'Hồ Chí Minh','bazoka@gmail.com','0987563215')
insert KhachHang values('KH156',N'Trương Tú',N'Nam','10-11-1989','10-08-2019','012342456',N'Hồ Chí Minh','nong6@gmail.com','0236548961')
insert KhachHang values('KH157',N'Tu Nhi',N'Nữ','12-10-2005','10-07-2018','236589542',N'Hồ Chí Minh','bazet@gmail.com','0315151444')
insert KhachHang values('KH158',N'Cơ Yến Linh',N'Nam','11-02-1996','10-05-2018','123412356',N'Hồ Chí Minh','xetang@gmail.com','0878888888')
insert KhachHang values('KH159',N'Văn Thiên',N'Nam','10-10-1989','10-20-2019','256985478',N'Hồ Chí Minh','kimdong@gmail.com','0941414141')
insert KhachHang values('KH160',N'Kim Sào',N'Nữ','09-10-1988','10-11-2018','325698745',N'Hồ Chí Minh','kimsao@gmail.com','0999998888')
go
------------------------------------------------------------------
insert HoaDon values('HD111','NV111','KH111',GETDATE(),GETDATE())
insert HoaDon values('HD112','NV112','KH112',GETDATE(),GETDATE())
insert HoaDon values('HD113','NV113','KH113',GETDATE(),GETDATE())
insert HoaDon values('HD114','NV114','KH114','12-16-2017','12-6-2017')
insert HoaDon values('HD115','NV115','KH115','11-26-2018','11-29-2018')
insert HoaDon values('HD116','NV116','KH116','12-24-2018','12-26-2018')
insert HoaDon values('HD117','NV117','KH117','8-12-2018','8-19-2018')
insert HoaDon values('HD118','NV118','KH118','8-11-2019','8-15-2019')
insert HoaDon values('HD119','NV119','KH119','10-20-2019','10-29-2019')
insert HoaDon values('HD120','NV120','KH120','8-24-2019','8-30-2019')
insert HoaDon values('HD121','NV120','KH121','10-31-2019',null)
insert HoaDon values('HD122','NV112','KH122','8-24-2019','8-30-2019')
insert HoaDon values('HD123','NV113','KH123','8-24-2019','8-30-2019')
insert HoaDon values('HD124','NV112','KH124','7-24-2019','7-30-2019')
insert HoaDon values('HD125','NV112','KH125','4-24-2019','4-30-2019')
insert HoaDon values('HD126','NV112','KH126','3-24-2019','3-30-2019')
insert HoaDon values('HD127','NV113','KH127','02-24-2019','02-28-2019')
insert HoaDon values('HD128','NV113','KH128','8-24-2019','8-30-2019')
insert HoaDon values('HD129','NV113','KH129','8-23-2019','8-30-2019')
insert HoaDon values('HD130','NV114','KH130','8-22-2019','8-30-2019')
insert HoaDon values('HD131','NV114','KH131','8-22-2019',null)
insert HoaDon values('HD132','NV114','KH132','8-2-2019','8-30-2019')
insert HoaDon values('HD133','NV114','KH133','8-21-2019',null)
insert HoaDon values('HD134','NV114','KH134','8-23-2019','8-30-2019')
insert HoaDon values('HD135','NV115','KH135','8-22-2019','8-30-2019')
insert HoaDon values('HD136','NV115','KH136','8-21-2019','8-30-2019')
insert HoaDon values('HD137','NV115','KH137','8-19-2019','8-30-2019')
insert HoaDon values('HD138','NV115','KH138','8-12-2019','8-30-2019')
insert HoaDon values('HD139','NV116','KH139','8-15-2019','8-30-2019')
insert HoaDon values('HD140','NV116','KH140','8-15-2019','8-30-2019')
insert HoaDon values('HD141','NV116','KH141','8-14-2019','8-30-2019')
insert HoaDon values('HD142','NV116','KH142','8-14-2019','8-30-2019')
insert HoaDon values('HD143','NV116','KH143','8-15-2019','8-30-2019')
insert HoaDon values('HD144','NV115','KH144','8-13-2019','8-30-2019')
insert HoaDon values('HD145','NV115','KH145','8-16-2019','8-30-2019')
insert HoaDon values('HD146','NV117','KH146','8-17-2019','8-30-2019')
insert HoaDon values('HD147','NV117','KH147','8-18-2019','8-30-2019')
insert HoaDon values('HD148','NV118','KH148','11-3-2019',null)
insert HoaDon values('HD149','NV118','KH149','11-4-2019',null)
insert HoaDon values('HD150','NV119','KH150','11-4-2019',null)
insert HoaDon values('HD151','NV119','KH151','11-4-2019',null)
insert HoaDon values('HD152','NV118','KH152','11-2-2019',null)
insert HoaDon values('HD153','NV117','KH153','11-02-2019','8-30-2019')
insert HoaDon values('HD154','NV118','KH154','8-24-2019','8-27-2019')
insert HoaDon values('HD155','NV115','KH155','11-01-2019',null)
insert HoaDon values('HD156','NV112','KH156','11-01-2019',null)
insert HoaDon values('HD157','NV116','KH157','8-24-2019','8-30-2019')
insert HoaDon values('HD158','NV114','KH158','9-24-2019','9-30-2019')
insert HoaDon values('HD159','NV115','KH159','10-24-2019','10-30-2019')
insert HoaDon values('HD160','NV116','KH160','8-24-2019','8-30-2019')
insert HoaDon values('HD161','NV111','KH113','6-6-2017','12-6-2017')
insert HoaDon values('HD162','NV112','KH115','11-6-2018','11-12-2018')
insert HoaDon values('HD163','NV113','KH116','12-24-2018','12-26-2018')
insert HoaDon values('HD164','NV114','KH121','8-12-2018','8-19-2018')
insert HoaDon values('HD165','NV115','KH123','8-11-2019','9-15-2019')
insert HoaDon values('HD166','NV116','KH147','10-16-2019','10-20-2019')
insert HoaDon values('HD167','NV117','KH156','8-24-2019','8-30-2019')
insert HoaDon values('HD168','NV118','KH145','7-25-2019','7-30-2019')
insert HoaDon values('HD169','NV119','KH132','10-28-2019','11-4-2019')
insert HoaDon values('HD170','NV120','KH123','6-27-2019','6-30-2019')
insert HoaDon values('HD171','NV111','KH121','8-16-2019','8-18-2019')
insert HoaDon values('HD172','NV112','KH144','9-9-2019','9-20-2019')
insert HoaDon values('HD173','NV113','KH156','7-7-2019','7-14-2019')
insert HoaDon values('HD174','NV114','KH114','8-6-2019','8-12-2019')
insert HoaDon values('HD175','NV115','KH112','8-27-2019','10-5-2019')
insert HoaDon values('HD176','NV116','KH116','10-30-2019',null)
insert HoaDon values('HD177','NV117','KH117','9-25-2019',null)
insert HoaDon values('HD178','NV118','KH118','6-10-2019','6-12-2019')
insert HoaDon values('HD179','NV119','KH119','11-4-2019',null)
insert HoaDon values('HD180','NV120','KH120','10-6-2019','10-12-2019')
insert HoaDon values('HD181','NV111','KH121','11-4-2019',null)
insert HoaDon values('HD182','NV112','KH122','10-25-2019','10-28-2019')
insert HoaDon values('HD183','NV113','KH123','10-6-2019','10-16-2019')
insert HoaDon values('HD184','NV114','KH124','11-1-2019',null)
insert HoaDon values('HD185','NV115','KH125','10-25-2019',null)
insert HoaDon values('HD186','NV116','KH126','11-1-2019',null)
insert HoaDon values('HD187','NV117','KH127','10-6-2019','10-10-2019')
insert HoaDon values('HD188','NV118','KH128','11-3-2019',null)
insert HoaDon values('HD189','NV119','KH129','10-25-2019',null)
insert HoaDon values('HD190','NV120','KH130','9-6-2019','9-10-2019')
insert HoaDon values('HD191','NV111','KH131','9-6-2019','9-15-2019')
insert HoaDon values('HD192','NV112','KH132','9-6-2019','9-8-2019')
insert HoaDon values('HD193','NV113','KH133','9-25-2019','10-2-2019')
insert HoaDon values('HD194','NV114','KH134','10-6-2019','10-10-2019')
insert HoaDon values('HD195','NV115','KH136','10-10-2019','10-15-2019')
insert HoaDon values('HD196','NV116','KH113','10-5-2019','10-9-2019')
insert HoaDon values('HD197','NV117','KH134','10-25-2019',null)
insert HoaDon values('HD198','NV118','KH154','11-2-2019',null)
insert HoaDon values('HD199','NV119','KH152','10-6-2019','10-7-2019')
insert HoaDon values('HD200','NV120','KH151','11-1-2019',null)
go
------------------------------------------------------------------
insert ChiTietHoaDon values('BD111','HD111',1)
insert ChiTietHoaDon values('BD113','HD111',1)
insert ChiTietHoaDon values('BD114','HD111',1)
insert ChiTietHoaDon values('BD112','HD111',1)
insert ChiTietHoaDon values('BD112','HD112',2)
insert ChiTietHoaDon values('BD113','HD113',3)
--111-160
insert ChiTietHoaDon values('BD120','HD114',3)
insert ChiTietHoaDon values('BD111','HD114',3)
insert ChiTietHoaDon values('BD113','HD115',3)
insert ChiTietHoaDon values('BD119','HD116',3)
insert ChiTietHoaDon values('BD140','HD114',3)
insert ChiTietHoaDon values('BD130','HD114',3)
insert ChiTietHoaDon values('BD150','HD115',3)
insert ChiTietHoaDon values('BD131','HD116',3)
insert ChiTietHoaDon values('BD115','HD117',3)
insert ChiTietHoaDon values('BD111','HD117',2)
insert ChiTietHoaDon values('BD132','HD117',1)
insert ChiTietHoaDon values('BD126','HD117',6)
insert ChiTietHoaDon values('BD115','HD118',3)
insert ChiTietHoaDon values('BD111','HD118',2)
insert ChiTietHoaDon values('BD132','HD118',1)
insert ChiTietHoaDon values('BD126','HD118',6)
insert ChiTietHoaDon values('BD111','HD119',1)
insert ChiTietHoaDon values('BD150','HD119',1)
insert ChiTietHoaDon values('BD142','HD119',1)
insert ChiTietHoaDon values('BD149','HD119',1)
insert ChiTietHoaDon values('BD113','HD119',1)
insert ChiTietHoaDon values('BD118','HD119',1)
insert ChiTietHoaDon values('BD123','HD120',2)
insert ChiTietHoaDon values('BD127','HD120',2)
insert ChiTietHoaDon values('BD134','HD120',2)
insert ChiTietHoaDon values('BD136','HD120',2)
insert ChiTietHoaDon values('BD115','HD120',2)
insert ChiTietHoaDon values('BD117','HD121',1)
insert ChiTietHoaDon values('BD117','HD123',1)
insert ChiTietHoaDon values('BD117','HD124',1)
insert ChiTietHoaDon values('BD115','HD125',1)
insert ChiTietHoaDon values('BD122','HD126',1)
insert ChiTietHoaDon values('BD143','HD127',1)
insert ChiTietHoaDon values('BD134','HD128',1)
insert ChiTietHoaDon values('BD117','HD129',1)
insert ChiTietHoaDon values('BD129','HD130',10)
insert ChiTietHoaDon values('BD116','HD131',4)
insert ChiTietHoaDon values('BD128','HD132',1)
insert ChiTietHoaDon values('BD111','HD132',1)
insert ChiTietHoaDon values('BD115','HD132',1)
insert ChiTietHoaDon values('BD148','HD133',1)
insert ChiTietHoaDon values('BD126','HD133',1)
insert ChiTietHoaDon values('BD123','HD133',1)
insert ChiTietHoaDon values('BD144','HD133',1)
insert ChiTietHoaDon values('BD114','HD133',1)
insert ChiTietHoaDon values('BD117','HD133',1)
insert ChiTietHoaDon values('BD119','HD134',1)
insert ChiTietHoaDon values('BD133','HD135',2)
insert ChiTietHoaDon values('BD123','HD136',1)
insert ChiTietHoaDon values('BD117','HD137',3)
insert ChiTietHoaDon values('BD114','HD138',1)
insert ChiTietHoaDon values('BD112','HD138',1)
insert ChiTietHoaDon values('BD129','HD138',1)
insert ChiTietHoaDon values('BD134','HD138',1)
insert ChiTietHoaDon values('BD115','HD138',1)
insert ChiTietHoaDon values('BD116','HD139',1)
insert ChiTietHoaDon values('BD116','HD140',1)
insert ChiTietHoaDon values('BD116','HD141',1)
insert ChiTietHoaDon values('BD140','HD142',1)
insert ChiTietHoaDon values('BD150','HD142',1)
insert ChiTietHoaDon values('BD140','HD143',1)
insert ChiTietHoaDon values('BD124','HD144',1)
insert ChiTietHoaDon values('BD144','HD145',1)
insert ChiTietHoaDon values('BD141','HD146',1)
insert ChiTietHoaDon values('BD149','HD147',4)
insert ChiTietHoaDon values('BD133','HD148',5)
insert ChiTietHoaDon values('BD146','HD147',4)
insert ChiTietHoaDon values('BD122','HD148',3)
insert ChiTietHoaDon values('BD112','HD149',9)
insert ChiTietHoaDon values('BD142','HD150',1)
insert ChiTietHoaDon values('BD146','HD151',2)
insert ChiTietHoaDon values('BD144','HD151',2)
insert ChiTietHoaDon values('BD132','HD151',1)
insert ChiTietHoaDon values('BD123','HD152',1)
insert ChiTietHoaDon values('BD116','HD152',1)
insert ChiTietHoaDon values('BD129','HD153',2)
insert ChiTietHoaDon values('BD118','HD154',3)
insert ChiTietHoaDon values('BD122','HD154',1)
insert ChiTietHoaDon values('BD129','HD155',1)
insert ChiTietHoaDon values('BD122','HD156',1)
insert ChiTietHoaDon values('BD137','HD157',1)
insert ChiTietHoaDon values('BD134','HD158',1)
insert ChiTietHoaDon values('BD113','HD159',1)
insert ChiTietHoaDon values('BD114','HD159',1)
insert ChiTietHoaDon values('BD122','HD160',1)
insert ChiTietHoaDon values('BD120','HD161',3)
insert ChiTietHoaDon values('BD118','HD161',1)
insert ChiTietHoaDon values('BD125','HD161',1)
insert ChiTietHoaDon values('BD145','HD161',3)
insert ChiTietHoaDon values('BD149','HD162',1)
insert ChiTietHoaDon values('BD150','HD162',1)
insert ChiTietHoaDon values('BD140','HD162',2)
insert ChiTietHoaDon values('BD130','HD162',3)
insert ChiTietHoaDon values('BD132','HD162',1)
insert ChiTietHoaDon values('BD113','HD163',1)
insert ChiTietHoaDon values('BD115','HD163',2)
insert ChiTietHoaDon values('BD124','HD164',3)
insert ChiTietHoaDon values('BD150','HD164',2)
insert ChiTietHoaDon values('BD112','HD164',1)
insert ChiTietHoaDon values('BD132','HD165',1)
insert ChiTietHoaDon values('BD133','HD165',1)
insert ChiTietHoaDon values('BD140','HD165',1)
insert ChiTietHoaDon values('BD145','HD165',1)
insert ChiTietHoaDon values('BD112','HD166',1)
insert ChiTietHoaDon values('BD112','HD167',1)
insert ChiTietHoaDon values('BD120','HD167',1)
insert ChiTietHoaDon values('BD117','HD168',1)
insert ChiTietHoaDon values('BD145','HD168',1)
insert ChiTietHoaDon values('BD150','HD168',1)
insert ChiTietHoaDon values('BD124','HD169',1)
insert ChiTietHoaDon values('BD132','HD169',1)
insert ChiTietHoaDon values('BD135','HD169',1)
insert ChiTietHoaDon values('BD144','HD170',4)
insert ChiTietHoaDon values('BD147','HD170',4)
insert ChiTietHoaDon values('BD132','HD171',3)
insert ChiTietHoaDon values('BD144','HD172',4)
insert ChiTietHoaDon values('BD142','HD172',1)
insert ChiTietHoaDon values('BD141','HD172',1)
insert ChiTietHoaDon values('BD112','HD173',1)
insert ChiTietHoaDon values('BD124','HD173',1)
insert ChiTietHoaDon values('BD150','HD174',4)
insert ChiTietHoaDon values('BD140','HD175',1)
insert ChiTietHoaDon values('BD130','HD175',1)
insert ChiTietHoaDon values('BD111','HD175',1)
insert ChiTietHoaDon values('BD122','HD176',1)
insert ChiTietHoaDon values('BD121','HD176',3)
insert ChiTietHoaDon values('BD114','HD177',1)
insert ChiTietHoaDon values('BD124','HD178',1)
insert ChiTietHoaDon values('BD134','HD179',1)
insert ChiTietHoaDon values('BD132','HD180',1)
insert ChiTietHoaDon values('BD144','HD181',1)
insert ChiTietHoaDon values('BD114','HD181',1)
insert ChiTietHoaDon values('BD144','HD182',1)
insert ChiTietHoaDon values('BD130','HD182',1)
insert ChiTietHoaDon values('BD119','HD183',1)
insert ChiTietHoaDon values('BD150','HD183',1)
insert ChiTietHoaDon values('BD121','HD183',1)
insert ChiTietHoaDon values('BD130','HD184',1)
insert ChiTietHoaDon values('BD125','HD185',1)
insert ChiTietHoaDon values('BD114','HD186',1)
insert ChiTietHoaDon values('BD143','HD187',1)
insert ChiTietHoaDon values('BD150','HD187',6)
insert ChiTietHoaDon values('BD117','HD188',1)
insert ChiTietHoaDon values('BD118','HD189',1)
insert ChiTietHoaDon values('BD132','HD190',2)
insert ChiTietHoaDon values('BD124','HD191',1)
insert ChiTietHoaDon values('BD148','HD191',1)
insert ChiTietHoaDon values('BD135','HD191',1)
insert ChiTietHoaDon values('BD147','HD192',1)
insert ChiTietHoaDon values('BD121','HD193',1)
insert ChiTietHoaDon values('BD130','HD194',1)
insert ChiTietHoaDon values('BD140','HD195',1)
insert ChiTietHoaDon values('BD120','HD195',1)
insert ChiTietHoaDon values('BD115','HD195',1)
insert ChiTietHoaDon values('BD148','HD196',2)
insert ChiTietHoaDon values('BD146','HD197',1)
insert ChiTietHoaDon values('BD114','HD198',1)
insert ChiTietHoaDon values('BD118','HD199',1)
insert ChiTietHoaDon values('BD120','HD200',1)
go
---------------------------------------------------------
-- Rự động tăng ID băng đĩa
create function TuDongTangIDBD()
returns char(5)
as
	begin
		declare @SoBangDia int
		declare @IDBangDia char(5)
		set @SoBangDia=(select count(BangDia.IDBangDia)from BangDia)
		if (@SoBangDia=0)
			begin
				set @IDBangDia='BD111'
			end
		else
			begin
				set @IDBangDia= RIGHT((select Max(BangDia.IDBangDia) from BangDia),3)
				set @SoBangDia=cast(@IDBangDia as int)+1
				set @IDBangDia='BD'+CAST(@SoBangDia as char(3))
			end
		return @IDBangDia
	end
go
-------------------------------------------------------------------
-- Tự động tăng ID hóa đơn
create function TuDongTangIDHoaDon()
returns char(5)
as
	begin
	declare @IDHoaDon char(5)
	declare @SoHoaDon int
	set @SoHoaDon=(select count(HoaDon.IDHoaDon) from HoaDon)
	if(@SoHoaDon=0)
		begin
			set @IDHoaDon='HD111'
		end
	else
		begin
			set @IDHoaDon= RIGHT((select Max(HoaDon.IDHoaDon) from HoaDon),3)
			set @SoHoaDon= CAST(@IDHoaDon as int)+1
			set @IDHoaDon='HD'+CAST(@SoHoaDon as char(3))
		end

	return @IDHoaDon
	end
go
------------------------------------------------------------------
-- Tự động tăng ID Khách Hàng
Create function TuDongTangIDKhachHang()
returns char(5)
as
	begin
	declare @IDKhachHang char(5)
	declare @SoKhachHang int
	set @SoKhachHang=(select count(KhachHang.IDKhachHang) from KhachHang)
	if(@SoKhachHang=0)
		begin
			set @IDKhachHang='KH111'
		end
	else 
		begin
			set @IDKhachHang = RIGHT((select max(KhachHang.IDKhachHang) from KhachHang),3)
			set @SoKhachHang = CAST(@IDKhachHang as int)+1
			set @IDKhachHang = 'KH'+CAST(@SoKhachHang as char(3))
		end
	return @IDKhachHang
	end
go
------------------------------------------------------------------
-- Tự động tăng ID NhaCungCap
create function TuDongTangIDNhaCungCap()
returns char(5)
as
	begin
	declare @IDNhaCungCap char(5)
	declare @SoNhaCungCap int
	set @SoNhaCungCap=(select count(NhaCungCap.IDNhaCungCap) from NhaCungCap)
	if(@SoNhaCungCap=0)
		set @IDNhaCungCap='CC111'
	else
		begin
			set @IDNhaCungCap =  RIGHT((select max(NhaCungCap.IDNhaCungCap) from NhaCungCap),3)
			set @SoNhaCungCap = CAST(@IDNhaCungCap as int)+1
			set @IDNhaCungCap = 'CC' + CAST(@SoNhaCungCap as char(3))
		end
	return @IDNhaCungCap
	end
go
------------------------------------------------------------------
-- Tự động tăng ID NhanVien
create function TuDongTangIDNhanVien()
returns char(5)
as
	begin
	declare @IDNhanVien char(5)
	declare @SoNhanVien int
	set @SoNhanVien = (select count(NhanVien.IDNhanVien) from NhanVien)
	if (@SoNhanVien=0)
		set @IDNhanVien='NV111'
	else 
		begin
			set @IDNhanVien = RIGHT((select max(NhanVien.IDNhanVien) from NhanVien),3)
			set @SoNhanVien = CAST(@IDNhanVien as int)+1
			set @IDNhanVien = 'NV' + CAST(@SoNhanVien as char(3))
		end
	return @IDNhanVien
	end
go
------------------------------------------------------------------
-- Tự động tăng ID TaiKhoan
create function TuDongTangIDTaiKhoan()
returns char(5)
as
	begin
	declare @IDTaiKhoan char(5)
	declare @SoTaiKhoan int
	set @SoTaiKhoan = (select count(TaiKhoan.IDTaiKhoan) from TaiKhoan)
	if (@SoTaiKhoan=0)
		set @IDTaiKhoan='TK111'
	else 
		begin
			set @IDTaiKhoan = RIGHT((select max(TaiKhoan.IDTaiKhoan) from TaiKhoan),3)
			set @SoTaiKhoan = CAST(@IDTaiKhoan as int)+1
			set @IDTaiKhoan = 'TK' + CAST(@SoTaiKhoan as char(3))
		end
	return @IDTaiKhoan
	end
go
------------------------------------------------------------------
-- Tự động tăng ID Chuc vu
create function TuDongTangIDChucVu()
returns char(5)
as
	begin
	declare @IDChucVu char(5)
	declare @SoChucVu int
	set @SoChucVu = (select count(ChucVu.IDChucVu) from ChucVu)
	if (@SoChucVu=0)
		set @IDChucVu='CV111'
	else 
		begin
			set @IDChucVu = RIGHT((select max(ChucVu.IDChucVu) from ChucVu),3)
			set @IDChucVu = CAST(@IDChucVu as int)+1
			set @IDChucVu = 'CV' + CAST(@SoChucVu as char(3))
		end
	return @IDChucVu
	end
go
------------------------------------------------------------------
-- Tự động tăng ID TheLoai
create function TuDongTangIDTheLoai()
returns char(5)
as
	begin
	declare @IDTheLoai char(5)
	declare @SoTheLoai int
	set @SoTheLoai = (select count(TheLoai.IDTheLoai) from TheLoai)
	if (@SoTheLoai=0)
		set @IDTheLoai='TL111'
	else 
		begin
			set @IDTheLoai = RIGHT((select max(TheLoai.IDTheLoai) from TheLoai),3)
			set @SoTheLoai = CAST(@IDTheLoai as int)+1
			set @IDTheLoai = 'TL' + CAST(@SoTheLoai as char(3))
		end
	return @IDTheLoai
	end
go
------------------------------------------------------------------
--Timf sdt KH khi biet IDHoaDon
create function IDHoaDon_SDT(@IDHoaDon char(5))
returns nvarchar(15)
as
begin
	declare @SDTKhachHang nvarchar(15)
	set @SDTKhachHang=(select KhachHang.SDT 
					   from KhachHang join HoaDon
					   on KhachHang.IDKhachHang=HoaDon.IDKhachHang
					   where HoaDon.IDHoaDon=@IDHoaDon
						)
	return @SDTKhachHang 
end
go
------------------------------------------------------------------
--Xuat gia thue cua 1 bang dia
create function inIDBangDia_GiaThue(@IDBangDia char(5))
returns money
as
begin
	declare @GiaThue money
	set @GiaThue=(select BangDia.GiaThue from BangDia where BangDia.IDBangDia=@IDBangDia)
	return @GiaThue
end
go
------------------------------------------------------------------
--ThongkeDoanhThuTheoThang
create function ThongKeDoanhThuTheoThang(@nam int)
returns table
as
return(
		select MONTH(HoaDon.NgayTraDia) as Thang,TongSoHoaDon= count(HoaDon.IDHoaDon),
		TongTienChoThue=sum(BangDia.GiaThue*ChiTietHoaDon.SoLuong)
		from HoaDon join ChiTietHoaDon on HoaDon.IDHoaDon=ChiTietHoaDon.IDHoaDon
					join BangDia on BangDia.IDBangDia=ChiTietHoaDon.IDBangDia
		where HoaDon.NgayTraDia is not null and YEAR(HoaDon.NgayTraDia)=@nam
		group by MONTH(HoaDon.NgayTraDia)
		)
go
------------------------------------------------------------------
--ThongkeDoanhThuTheoNgay
create function ThongKeDoanhThuTheoNgay(@start date, @end date)
returns table
as
return(
		select HoaDon.NgayTraDia,TongSoHoaDon= count(HoaDon.IDHoaDon),
		TongTienChoThue=sum(BangDia.GiaThue*ChiTietHoaDon.SoLuong)
		from HoaDon join ChiTietHoaDon on HoaDon.IDHoaDon=ChiTietHoaDon.IDHoaDon
					join BangDia on BangDia.IDBangDia=ChiTietHoaDon.IDBangDia
		where HoaDon.NgayTraDia is not null and(HoaDon.NgayLapHD>=@start and HoaDon.NgayTraDia<=@end)
		group by HoaDon.NgayTraDia
		)
go
------------------------------------------------------------------
--Thong ke danh sach khach hang tre han 
create function ThongKeDanhSachKhachHangTreHan()
returns table
as
return(
		select KhachHang.IDKhachHang, KhachHang.HotenKH,KhachHang.SDT,HoaDon.NgayLapHD,
		NgayDaThue=DATEDIFF(day,HoaDon.NgayLapHD,GETDATE()),
		SoNgayTre=DATEDIFF(day,HoaDon.NgayLapHD,GETDATE())-7
		from KhachHang join HoaDon on KhachHang.IDKhachHang=HoaDon.IDKhachHang
		where HoaDon.NgayTraDia is null and DATEDIFF(day,HoaDon.NgayLapHD,GETDATE())>7
		)
go
------------------------------------------------------------------
--Thống kê top 10 băng đĩa đc thuê nhiều nhất từ ngày... đến ngày...
create function ThongKeTop10BangDiaYeuThichNhat(@start date,@end date)
returns table
as
	return(
			select TOP 10 BangDia.IDBangDia, BangDia.TenBD,TheLoai.TenTheLoai,NhaCungCap.TenNhaCungCap,
			SoLuotThue=count(ChiTietHoaDon.IDBangDia)
			from BangDia join NhaCungCap on BangDia.IDNhaCungCap=NhaCungCap.IDNhaCungCap
						 join TheLoai on TheLoai.IDTheLoai=BangDia.IDTheLoai
						 join ChiTietHoaDon on ChiTietHoaDon.IDBangDia=BangDia.IDBangDia
						 join HoaDon on ChiTietHoaDon.IDHoaDon=HoaDon.IDHoaDon
			where HoaDon.NgayLapHD>=@start and HoaDon.NgayLapHD<=@end
			group by BangDia.IDBangDia,BangDia.TenBD,TheLoai.TenTheLoai,NhaCungCap.TenNhaCungCap
			order by count(ChiTietHoaDon.IDBangDia) DESC
			)
go
------------------------------------------------------------------
--Thống kê top 10 khách hàng thuê băng đĩa nhiều nhất 
create function ThongKeDanhSachKhachHangThueNhieuNhatTrongTuan(@start date, @end date)
returns table
as
	return(
			select top 10 KhachHang.IDKhachHang,KhachHang.HotenKH, KhachHang.SDT,
			SoLuong=sum(ChiTietHoaDon.SoLuong)
			from KhachHang join HoaDon on KhachHang.IDKhachHang = HoaDon.IDKhachHang
						   join ChiTietHoaDon on HoaDon.IDHoaDon = ChiTietHoaDon.IDHoaDon
			where HoaDon.NgayLapHD>=@start and HoaDon.NgayTraDia<=@end
			group by KhachHang.IDKhachHang,KhachHang.HotenKH, KhachHang.SDT
			order by sum(ChiTietHoaDon.SoLuong) desc
			)
go

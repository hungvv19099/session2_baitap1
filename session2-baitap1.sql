create database session2_baitap;
-- Phiếu xuất
 create table PhieuXuat(
 soPX int auto_increment primary key,
 ngayXuat datetime default now()
--  maVTu int references VatTu(maVTu)
 );
 -- chi tiết phiếu xuất
 create table PhieuXuatDetail(
 donGiaXuat float ,
 SLXuat int not null,
 maVTu int,
 foreign key (maVTu) references VatTu(maVTu),
 soPX int,
 foreign key(soPX) references PhieuXuat(soPX)
 );
-- Vật tư
create table VatTu(
maVTu int auto_increment primary key,
tenVtu varchar(255) 
);
-- Phiếu nhập
create table PhieuNhap(
soPN int auto_increment primary key,
ngayNhap datetime  default now()
-- maVTu int references VatTu(maVtu)
);
-- chi tiết phiếu nhập
create table PhieuNhapDetail(
DGNhap float,
SLNhap int not null,
maVTu int,
foreign key(maVTu) references VatTu(maVTu),
soPN int,
foreign key (soPN) references PhieuNhap(soPN)
);
-- Đơn đặt hàng
create table DonDH(
soDH int auto_increment primary key,
ngayDH datetime default now(),
nhaCC_id int,
foreign key(nhaCC_id) references NhaCC(nhaCC_id)
-- maVTu int references VatTu(maVTu)
);

drop table PhieuNhap;

-- chi tiết đơn đặt hàng
create table DonDHDetail(
soDH int references DonDH(soDH),
maVTu int,
foreign key (maVTu) references VatTu(maVTu)
);
alter table dondhdetail 
add foreign key(soDH) references dondh(sodh),
 add foreign key (maVTu) references VatTu(maVTu);

-- Nhà cung cấp
create table NhaCC(
nhaCC_id int auto_increment primary key,
nhaCCName varchar(255) not null,
diachi varchar(255),
sdt varchar(255) not null
-- soDH int,
-- foreign key(soDH) references DonDH(soDH)
);


 
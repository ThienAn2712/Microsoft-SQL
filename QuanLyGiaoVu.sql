CREATE DATABASE QLGV
GO

USE QLGV
GO

CREATE TABLE HOCVIEN
(
MAHV char(5),
HO varchar(40),
TEN varchar(10),
NGSINH smalldatetime,
GIOITINH  varchar(3),
NOISINH varchar(40),
MALOP  char(3),CONSTRAINT PK_HV PRIMARY KEY (MAHV),
)

CREATE TABLE LOP
(
MALOP char(3),
TENLOP varchar(40),
TRGLOP char(5) REFERENCES HOCVIEN(MAHV),
SISO tinyint,
MAGVCN char(4),
CONSTRAINT PL_LOP PRIMARY KEY (MALOP),

)

CREATE TABLE KHOA
(
MAKHOA varchar(4),
TENKHOA varchar(40),
NGTLAP smalldatetime,
TRGKHOA char(4),CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
)

CREATE TABLE MONHOC
(
MAMH varchar(10),
TENMH varchar(40),
TCLT  tinyint,
TCTH tinyint,
MAKHOA varchar(4),
CONSTRAINT PK_MONHOC PRIMARY KEY (MAMH)
)

CREATE TABLE DIEUKIEN
(
MAMH varchar(10)REFERENCES MONHOC,
MAMH_TRUOC  varchar(10)REFERENCES MONHOC,CONSTRAINT PK_DK PRIMARY KEY (MAMH, MAMH_TRUOC),
)

CREATE TABLE GIAOVIEN
(
MAGV char(4),
HOTEN varchar(40),
HOCVI varchar(10),
 HOCHAM varchar(10),
GIOITINH varchar(3),
NGSINH smalldatetime,
NGVL smalldatetime,
HESO  numeric(4,2),
MUCLUONG  money,
MAKHOA varchar(4) REFERENCES KHOA,CONSTRAINT PK_GV PRIMARY KEY (MAGV)
)

CREATE TABLE GIANGDAY
(
MALOP char(3) ,
MAMH varchar(10) REFERENCES MONHOC,
MAGV char(4),
HOCKY tinyint ,
NAM smallint,
TUNGAY smalldatetime,DENNGAY smalldatetime,CONSTRAINT PK_GD PRIMARY KEY (MALOP, MAMH)
)

CREATE TABLE KETQUATHI
(
MAHV char(5) REFERENCES HOCVIEN,
MAMH  varchar(10),
LANTHI  tinyint,
NGTHI  smalldatetime,
DIEM numeric(4,2),
KQUA  varchar(10),
CONSTRAINT PK_KQT PRIMARY KEY (MAHV, MAMH, LANTHI)
)

--1.1 THEM 3 THUOC TINH GHICHU, DIEMTB,XEPLOAI CHO QH HOCVIEN
ALTER TABLE HOCVIEN ADD GHICHU VARCHAR(50), DIEMTB NUMERIC(4,2), XEPLOAI VARCHAR(10)

--1.3 
ALTER TABLE HOCVIEN ADD CONSTRAINT CHECK_GTHV CHECK (GIOITINH IN ('Nam', 'Nu'))
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHECK_GTGV CHECK (GIOITINH IN ('Nam', 'Nu'))

--1.4
ALTER TABLE KETQUATHI ADD CONSTRAINT CHECK_DIEM CHECK 
(
	DIEM BETWEEN 0 AND 10
	AND RIGHT(CAST(DIEM AS VARCHAR), 3) LIKE '.__'
)

--1.5
ALTER TABLE KETQUATHI ADD CONSTRAINT CHECK_KETQUA CHECK
(	
	(KQUA = 'Dat' AND DIEM BETWEEN 5 AND 10)
	OR (KQUA = 'Khong dat' AND DIEM < 5)
)

-- I.6
ALTER TABLE KETQUATHI ADD CONSTRAINT CHECK_LANTHI CHECK (LANTHI <= 3)

-- I.7
ALTER TABLE GIANGDAY ADD CONSTRAINT CHECK_HOCKY CHECK (HOCKY BETWEEN 1 AND 3)

-- I.8 
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHECK_HOCVI CHECK (HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'))
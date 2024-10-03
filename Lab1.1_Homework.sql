-- T?o b?ng Chuy�n gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- T?o b?ng C�ng ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- T?o b?ng D? �n
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- T?o b?ng K? n�ng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- T?o b?ng Chuy�n gia - K? n�ng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- T?o b?ng Chuy�n gia - D? �n
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Ch�n d? li?u m?u v�o b?ng Chuy�n gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguy?n V�n An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Ph�t tri?n ph?n m?m', 10),
(2, N'Tr?n Th? B?nh', '1990-08-15', N'N?', 'tranthiminh@email.com', '0912345678', N'An ninh m?ng', 7),
(3, N'L� Ho�ng C�?ng', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Tr� tu? nh�n t?o', 9),
(4, N'Ph?m Th? Dung', '1992-11-25', N'N?', 'phamthidung@email.com', '0934567890', N'Khoa h?c d? li?u', 6),
(5, N'Ho�ng V�n Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'�i?n to�n ��m m�y', 8),
(6, N'Ng� Th? Ph�?ng', '1993-02-14', N'N?', 'ngothiphuong@email.com', '0956789012', N'Ph�n t�ch d? li?u', 5),
(7, N'�?ng V�n Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'V? Th? H��ng', '1991-12-20', N'N?', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'B�i V�n Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'L? Th? Kh�nh', '1994-06-30', N'N?', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Ch�n d? li?u m?u v�o b?ng C�ng ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 ��?ng L� L?i, TP.HCM', N'Ph�t tri?n ph?n m?m', 200),
(2, N'DataSmart Analytics', N'456 ��?ng Nguy?n Hu?, H� N?i', N'Ph�n t�ch d? li?u', 150),
(3, N'CloudNine Systems', N'789 ��?ng Tr?n H�ng �?o, �� N?ng', N'�i?n to�n ��m m�y', 100),
(4, N'SecureNet Vietnam', N'101 ��?ng V? V�n T?n, TP.HCM', N'An ninh m?ng', 80),
(5, N'AI Innovate', N'202 ��?ng L? T? Tr?ng, H� N?i', N'Tr� tu? nh�n t?o', 120);

-- Ch�n d? li?u m?u v�o b?ng D? �n
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Ph�t tri?n ?ng d?ng di �?ng cho ng�n h�ng', 1, '2023-01-01', '2023-06-30', N'Ho�n th�nh'),
(2, N'X�y d?ng h? th?ng ph�n t�ch d? li?u kh�ch h�ng', 2, '2023-03-15', '2023-09-15', N'�ang th?c hi?n'),
(3, N'Tri?n khai gi?i ph�p ��m m�y cho doanh nghi?p', 3, '2023-02-01', '2023-08-31', N'�ang th?c hi?n'),
(4, N'N�ng c?p h? th?ng b?o m?t cho t?p �o�n vi?n th�ng', 4, '2023-04-01', '2023-10-31', N'�ang th?c hi?n'),
(5, N'Ph�t tri?n chatbot AI cho d?ch v? kh�ch h�ng', 5, '2023-05-01', '2023-11-30', N'�ang th?c hi?n');

-- Ch�n d? li?u m?u v�o b?ng K? n�ng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ng�n ng? l?p tr?nh'),
(2, 'Python', N'Ng�n ng? l?p tr?nh'),
(3, 'Machine Learning', N'C�ng ngh?'),
(4, 'AWS', N'N?n t?ng ��m m�y'),
(5, 'Docker', N'C�ng c?'),
(6, 'Kubernetes', N'C�ng c?'),
(7, 'SQL', N'C� s? d? li?u'),
(8, 'NoSQL', N'C� s? d? li?u'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Ch�n d? li?u m?u v�o b?ng Chuy�n gia - K? n�ng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Ch�n d? li?u m?u v�o b?ng Chuy�n gia - D? �n
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Tr�?ng nh�m ph�t tri?n', '2023-01-01'),
(2, 4, N'Chuy�n gia b?o m?t', '2023-04-01'),
(3, 5, N'K? s� AI', '2023-05-01'),
(4, 2, N'Chuy�n gia ph�n t�ch d? li?u', '2023-03-15'),
(5, 3, N'Ki?n tr�c s� ��m m�y', '2023-02-01'),
(6, 2, N'Chuy�n gia ph�n t�ch d? li?u', '2023-03-15'),
(7, 3, N'K? s� IoT', '2023-02-01'),
(8, 1, N'Nh� thi?t k? UX/UI', '2023-01-01'),
(9, 3, N'K? s� DevOps', '2023-02-01'),
(10, 5, N'K? s� Blockchain', '2023-05-01');

-- 51. Hi?n th? t?t c? th�ng tin c?a b?ng ChuyenGia.
SELECT * FROM ChuyenGia

-- 52. Li?t k� h? t�n v� email c?a t?t c? chuy�n gia.
SELECT MaChuyenGia, HoTen FROM ChuyenGia

-- 53. Hi?n th? t�n c�ng ty v� s? nh�n vi�n c?a t?t c? c�c c�ng ty.
SELECT TenCongTy, SoNhanVien FROM CongTy

-- 54. Li?t k� t�n c�c d? �n �ang trong tr?ng th�i '�ang th?c hi?n'.
SELECT TenDuAn, TrangThai FROM DuAn Where TrangThai = N'�ang th?c hi?n'

-- 55. Hi?n th? t�n v� lo?i c?a t?t c? c�c k? n�ng.
SELECT TenKyNang, LoaiKyNang FROM KyNang

-- 56. Li?t k� h? t�n v� chuy�n ng�nh c?a c�c chuy�n gia nam.
SELECT HoTen, ChuyenNganh FROM ChuyenGia WHERE GioiTinh= N'Nam'

-- 57. Hi?n th? t�n c�ng ty v� l?nh v?c c?a c�c c�ng ty c� tr�n 150 nh�n vi�n.
SELECT TenCongTy, LinhVuc FROM CongTy  WHERE SoNhanVien > 150

-- 58. Li?t k� t�n c�c d? �n b?t �?u trong n�m 2023.
SELECT TenDuAn FROM  DuAn WHERE Year(NgayBatDau) = '2023'

-- 59. Hi?n th? t�n k? n�ng thu?c lo?i 'C�ng c?'.
SELECT TenKyNang FROM KyNang WHERE LoaiKyNang = N'C�ng c?'

-- 60. Li?t k� h? t�n v� s? n�m kinh nghi?m c?a c�c chuy�n gia c� tr�n 5 n�m kinh nghi?m.
SELECT HoTen, NamKinhNghiem FROM ChuyenGia WHERE NamKinhNghiem > 5

-- 61. Hi?n th? t�n c�ng ty v� �?a ch? c?a c�c c�ng ty trong l?nh v?c 'Ph�t tri?n ph?n m?m'.
SELECT TenCongTy, DiaChi FROM CongTy WHERE LinhVuc = N'Ph�t tri?n ph?n m?m'

-- 62. Li?t k� t�n c�c d? �n c� ng�y k?t th�c trong n�m 2023.
SELECT TenDuAn FROM DuAn WHERE Year(NgayKetThuc) ='2023'

-- 63. Hi?n th? t�n v� c?p �? c?a c�c k? n�ng trong b?ng ChuyenGia_KyNang.
SELECT TenKyNang,CapDo FROM KyNang,ChuyenGia_KyNang WHERE KyNang.MaKyNang= ChuyenGia_KyNang.MaKyNang

-- 64. Li?t k� m? chuy�n gia v� vai tr? trong c�c d? �n t? b?ng ChuyenGia_DuAn.
SELECT MaChuyenGia, VaiTro FROM ChuyenGia_DuAn

-- 65. Hi?n th? h? t�n v� ng�y sinh c?a c�c chuy�n gia sinh n�m 1990 tr? v? sau.
SELECT HoTen, NgaySinh FROM ChuyenGia Where year(NgaySinh) >1990
-- 66. Li?t k� t�n c�ng ty v� s? nh�n vi�n, s?p x?p theo s? nh�n vi�n gi?m d?n.
SELECT TenCongTy, SoNhanVien FROM CongTy Order By SoNhanVien DESC

-- 67. Hi?n th? t�n d? �n v� ng�y b?t �?u, s?p x?p theo ng�y b?t �?u t�ng d?n.
SELECT TenDuAn, NgayBatDau FROM DuAn Order By NgayBatDau ASC

-- 68. Li?t k� t�n k? n�ng, ch? hi?n th? m?i t�n m?t l?n (lo?i b? tr�ng l?p).
SELECT DISTINCT TenKyNang FROM KyNang

-- 69. Hi?n th? h? t�n v� email c?a 5 chuy�n gia �?u ti�n trong danh s�ch.
SELECT TOP 5 HoTen, Email FROM ChuyenGia;

-- 70. Li?t k� t�n c�ng ty c� ch?a t? 'Tech' trong t�n.
SELECT TenCongTy FROM CongTy WHERE TenCongTy Like 'Tech%'

-- 71. Hi?n th? t�n d? �n v� tr?ng th�i, kh�ng bao g?m c�c d? �n �? ho�n th�nh.
SELECT TenDuAn, TrangThai FROM DuAn WHERE TrangThai NOT IN ('Ho�n th�nh')


-- 72. Li?t k� h? t�n v� chuy�n ng�nh c?a c�c chuy�n gia, s?p x?p theo chuy�n ng�nh v� h? t�n.
SELECT HoTen, ChuyenNganh FROM ChuyenGia ORDER BY ChuyenNganh,HoTen Asc

-- 73. Hi?n th? t�n c�ng ty v� l?nh v?c, ch? bao g?m c�c c�ng ty c� t? 100 �?n 200 nh�n vi�n.
SELECT TenCongTy, LinhVuc FROM CongTy WHERE SoNhanVien >= 100 AND SoNhanVien <= 200

-- 74. Li?t k� t�n k? n�ng v� lo?i k? n�ng, s?p x?p theo lo?i k? n�ng gi?m d?n v� t�n k? n�ng t�ng d?n.
SELECT TenKyNang, LoaiKyNang FROM KyNang ORDER BY LoaiKyNang DESC , TenKyNang ASC

-- 75. Hi?n th? h? t�n v� s? �i?n tho?i c?a c�c chuy�n gia c� email s? d?ng t�n mi?n 'email.com'.
SELECT HoTen, SoDienThoai FROM ChuyenGia WHERE Email Like '%email.com'
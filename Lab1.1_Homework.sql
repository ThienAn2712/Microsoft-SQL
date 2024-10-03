-- T?o b?ng Chuyên gia
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

-- T?o b?ng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- T?o b?ng D? án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- T?o b?ng K? nãng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- T?o b?ng Chuyên gia - K? nãng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- T?o b?ng Chuyên gia - D? án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Chèn d? li?u m?u vào b?ng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguy?n Vãn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát tri?n ph?n m?m', 10),
(2, N'Tr?n Th? B?nh', '1990-08-15', N'N?', 'tranthiminh@email.com', '0912345678', N'An ninh m?ng', 7),
(3, N'Lê Hoàng Cý?ng', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tu? nhân t?o', 9),
(4, N'Ph?m Th? Dung', '1992-11-25', N'N?', 'phamthidung@email.com', '0934567890', N'Khoa h?c d? li?u', 6),
(5, N'Hoàng Vãn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Ði?n toán ðám mây', 8),
(6, N'Ngô Th? Phý?ng', '1993-02-14', N'N?', 'ngothiphuong@email.com', '0956789012', N'Phân tích d? li?u', 5),
(7, N'Ð?ng Vãn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'V? Th? Hýõng', '1991-12-20', N'N?', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Vãn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'L? Th? Khánh', '1994-06-30', N'N?', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn d? li?u m?u vào b?ng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Ðý?ng Lê L?i, TP.HCM', N'Phát tri?n ph?n m?m', 200),
(2, N'DataSmart Analytics', N'456 Ðý?ng Nguy?n Hu?, Hà N?i', N'Phân tích d? li?u', 150),
(3, N'CloudNine Systems', N'789 Ðý?ng Tr?n Hýng Ð?o, Ðà N?ng', N'Ði?n toán ðám mây', 100),
(4, N'SecureNet Vietnam', N'101 Ðý?ng V? Vãn T?n, TP.HCM', N'An ninh m?ng', 80),
(5, N'AI Innovate', N'202 Ðý?ng L? T? Tr?ng, Hà N?i', N'Trí tu? nhân t?o', 120);

-- Chèn d? li?u m?u vào b?ng D? án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát tri?n ?ng d?ng di ð?ng cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây d?ng h? th?ng phân tích d? li?u khách hàng', 2, '2023-03-15', '2023-09-15', N'Ðang th?c hi?n'),
(3, N'Tri?n khai gi?i pháp ðám mây cho doanh nghi?p', 3, '2023-02-01', '2023-08-31', N'Ðang th?c hi?n'),
(4, N'Nâng c?p h? th?ng b?o m?t cho t?p ðoàn vi?n thông', 4, '2023-04-01', '2023-10-31', N'Ðang th?c hi?n'),
(5, N'Phát tri?n chatbot AI cho d?ch v? khách hàng', 5, '2023-05-01', '2023-11-30', N'Ðang th?c hi?n');

-- Chèn d? li?u m?u vào b?ng K? nãng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ng? l?p tr?nh'),
(2, 'Python', N'Ngôn ng? l?p tr?nh'),
(3, 'Machine Learning', N'Công ngh?'),
(4, 'AWS', N'N?n t?ng ðám mây'),
(5, 'Docker', N'Công c?'),
(6, 'Kubernetes', N'Công c?'),
(7, 'SQL', N'Cõ s? d? li?u'),
(8, 'NoSQL', N'Cõ s? d? li?u'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn d? li?u m?u vào b?ng Chuyên gia - K? nãng
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

-- Chèn d? li?u m?u vào b?ng Chuyên gia - D? án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trý?ng nhóm phát tri?n', '2023-01-01'),
(2, 4, N'Chuyên gia b?o m?t', '2023-04-01'),
(3, 5, N'K? sý AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích d? li?u', '2023-03-15'),
(5, 3, N'Ki?n trúc sý ðám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích d? li?u', '2023-03-15'),
(7, 3, N'K? sý IoT', '2023-02-01'),
(8, 1, N'Nhà thi?t k? UX/UI', '2023-01-01'),
(9, 3, N'K? sý DevOps', '2023-02-01'),
(10, 5, N'K? sý Blockchain', '2023-05-01');

-- 51. Hi?n th? t?t c? thông tin c?a b?ng ChuyenGia.
SELECT * FROM ChuyenGia

-- 52. Li?t kê h? tên và email c?a t?t c? chuyên gia.
SELECT MaChuyenGia, HoTen FROM ChuyenGia

-- 53. Hi?n th? tên công ty và s? nhân viên c?a t?t c? các công ty.
SELECT TenCongTy, SoNhanVien FROM CongTy

-- 54. Li?t kê tên các d? án ðang trong tr?ng thái 'Ðang th?c hi?n'.
SELECT TenDuAn, TrangThai FROM DuAn Where TrangThai = N'Ðang th?c hi?n'

-- 55. Hi?n th? tên và lo?i c?a t?t c? các k? nãng.
SELECT TenKyNang, LoaiKyNang FROM KyNang

-- 56. Li?t kê h? tên và chuyên ngành c?a các chuyên gia nam.
SELECT HoTen, ChuyenNganh FROM ChuyenGia WHERE GioiTinh= N'Nam'

-- 57. Hi?n th? tên công ty và l?nh v?c c?a các công ty có trên 150 nhân viên.
SELECT TenCongTy, LinhVuc FROM CongTy  WHERE SoNhanVien > 150

-- 58. Li?t kê tên các d? án b?t ð?u trong nãm 2023.
SELECT TenDuAn FROM  DuAn WHERE Year(NgayBatDau) = '2023'

-- 59. Hi?n th? tên k? nãng thu?c lo?i 'Công c?'.
SELECT TenKyNang FROM KyNang WHERE LoaiKyNang = N'Công c?'

-- 60. Li?t kê h? tên và s? nãm kinh nghi?m c?a các chuyên gia có trên 5 nãm kinh nghi?m.
SELECT HoTen, NamKinhNghiem FROM ChuyenGia WHERE NamKinhNghiem > 5

-- 61. Hi?n th? tên công ty và ð?a ch? c?a các công ty trong l?nh v?c 'Phát tri?n ph?n m?m'.
SELECT TenCongTy, DiaChi FROM CongTy WHERE LinhVuc = N'Phát tri?n ph?n m?m'

-- 62. Li?t kê tên các d? án có ngày k?t thúc trong nãm 2023.
SELECT TenDuAn FROM DuAn WHERE Year(NgayKetThuc) ='2023'

-- 63. Hi?n th? tên và c?p ð? c?a các k? nãng trong b?ng ChuyenGia_KyNang.
SELECT TenKyNang,CapDo FROM KyNang,ChuyenGia_KyNang WHERE KyNang.MaKyNang= ChuyenGia_KyNang.MaKyNang

-- 64. Li?t kê m? chuyên gia và vai tr? trong các d? án t? b?ng ChuyenGia_DuAn.
SELECT MaChuyenGia, VaiTro FROM ChuyenGia_DuAn

-- 65. Hi?n th? h? tên và ngày sinh c?a các chuyên gia sinh nãm 1990 tr? v? sau.
SELECT HoTen, NgaySinh FROM ChuyenGia Where year(NgaySinh) >1990
-- 66. Li?t kê tên công ty và s? nhân viên, s?p x?p theo s? nhân viên gi?m d?n.
SELECT TenCongTy, SoNhanVien FROM CongTy Order By SoNhanVien DESC

-- 67. Hi?n th? tên d? án và ngày b?t ð?u, s?p x?p theo ngày b?t ð?u tãng d?n.
SELECT TenDuAn, NgayBatDau FROM DuAn Order By NgayBatDau ASC

-- 68. Li?t kê tên k? nãng, ch? hi?n th? m?i tên m?t l?n (lo?i b? trùng l?p).
SELECT DISTINCT TenKyNang FROM KyNang

-- 69. Hi?n th? h? tên và email c?a 5 chuyên gia ð?u tiên trong danh sách.
SELECT TOP 5 HoTen, Email FROM ChuyenGia;

-- 70. Li?t kê tên công ty có ch?a t? 'Tech' trong tên.
SELECT TenCongTy FROM CongTy WHERE TenCongTy Like 'Tech%'

-- 71. Hi?n th? tên d? án và tr?ng thái, không bao g?m các d? án ð? hoàn thành.
SELECT TenDuAn, TrangThai FROM DuAn WHERE TrangThai NOT IN ('Hoàn thành')


-- 72. Li?t kê h? tên và chuyên ngành c?a các chuyên gia, s?p x?p theo chuyên ngành và h? tên.
SELECT HoTen, ChuyenNganh FROM ChuyenGia ORDER BY ChuyenNganh,HoTen Asc

-- 73. Hi?n th? tên công ty và l?nh v?c, ch? bao g?m các công ty có t? 100 ð?n 200 nhân viên.
SELECT TenCongTy, LinhVuc FROM CongTy WHERE SoNhanVien >= 100 AND SoNhanVien <= 200

-- 74. Li?t kê tên k? nãng và lo?i k? nãng, s?p x?p theo lo?i k? nãng gi?m d?n và tên k? nãng tãng d?n.
SELECT TenKyNang, LoaiKyNang FROM KyNang ORDER BY LoaiKyNang DESC , TenKyNang ASC

-- 75. Hi?n th? h? tên và s? ði?n tho?i c?a các chuyên gia có email s? d?ng tên mi?n 'email.com'.
SELECT HoTen, SoDienThoai FROM ChuyenGia WHERE Email Like '%email.com'
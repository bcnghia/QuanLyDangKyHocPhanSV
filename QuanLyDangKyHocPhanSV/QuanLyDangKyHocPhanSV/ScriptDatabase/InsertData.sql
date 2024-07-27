--------------------------------
-- File này dùng để thêm Data --
--------------------------------
-- CẦN SELECT THÌ SANG FILE SELCET TRÁNH LÀM LOÃNG FILE NÀY. THÂN --

USE QuanLyDangKyHocPhanSV;

-- Thêm PHÂN QUYỀN TÀI KHOẢN
INSERT INTO RoleAccount (TenRole) VALUES ('student');
INSERT INTO RoleAccount (TenRole) VALUES ('teacher');
INSERT INTO RoleAccount (TenRole) VALUES ('admin');

/* Thêm dữ liệu cho RoleAccount */
select * from GiaoVu
UPDATE GiaoVu
SET RoleAccount = 'admin';

select * from GiangVien
UPDATE GiangVien
SET RoleAccount = 'teacher';

select * from tblSinhVien
UPDATE tblSinhVien
SET RoleAccount = 'student';



-- Thêm GIÁO VỤ - ADMIN -- sử dụng ký tự AD
INSERT INTO GiaoVu (MaGiaoVu, TenGiaoVu, NgaySinh, GioiTinh, Email, MatKhau, RoleAccount) 
VALUES 
	('AD0001', N'Duy Khang', '2000-01-01', 1, 'duykhang@gmail.com', 'admin', 'admin'),
	('AD0002', N'Công Nghĩa', '2000-01-01', 0, 'congnghia@gmail.com', 'admin', 'admin'),
	('AD0003', N'Thành Hải', '2000-01-01', 1, 'thanhhai@gmail.com', 'admin', 'admin');

-- Thêm GIẢNG VIÊN -- sử  dụng ký tự GV
INSERT INTO GiangVien (MaGV, TenGV, NgaySinh, GioiTinh, Email, HocHam, MatKhau, RoleAccount) 
VALUES 
    ('GV0001', N'Nguyễn Văn A', '1975-02-15', 1, 'nguyenvana@gv.example.com', N'Tiến sĩ', 'teacher', 'teacher'),
    ('GV0002', N'Trần Thị B', '1980-06-30', 0, 'tranthib@gv.example.com', N'Thạc sĩ', 'teacher', 'teacher'),
    ('GV0003', N'Lê Văn C', '1978-11-22', 1, 'levanc@gv.example.com', N'Phó giáo sư', 'teacher', 'teacher'),
    ('GV0004', N'Phạm Thị D', '1983-03-09', 0, 'phamthid@gv.example.com', N'Tiến sĩ', 'teacher', 'teacher'),
    ('GV0005', N'Hoàng Văn E', '1979-08-17', 1, 'hoangvane@gv.example.com', N'Thạc sĩ', 'teacher', 'teacher');

-- Thêm SINH VIÊN -- sử  dụng ký tự SV
INSERT INTO SinhVien (MaSV, TenSV, NgaySinh, GioiTinh, Email, Khoa, Lop, MatKhau, RoleAccount) 
VALUES 
    ('SV0001', N'SucVat A', '1999-01-01', 1, 'nguyenvana@example.com', N'CNTT', 'Lop1', 'student', 'student'),
    ('SV0002', N'SV B', '2000-02-02', 0, 'tranthib@example.com', N'Kinh Tế', 'Lop2', 'student', 'student'),
    ('SV0003', N'SV C', '1998-03-03', 1, 'levanc@example.com', N'Y Dược', 'Lop3', 'student', 'student'),
    ('SV0004', N'SV D', '2001-04-04', 0, 'phamthid@example.com', N'Ngoại Ngữ', 'Lop4', 'student', 'student'),
    ('SV0005', N'SV E', '1997-05-05', 1, 'hoangvane@example.com', N'Kỹ Thuật', 'Lop5', 'student', 'student');

-- Thêm MÔN HỌC 
INSERT INTO MonHoc (MaMH, TenMH, SoTiet, SoTinChi, ThoiKhoaBieu)
VALUES
    ('MH001', N'Môn Học 1', 45, 3, N'Thứ 2, 3, 4 - Sáng'),
    ('MH002', N'Môn Học 2', 30, 2, N'Thứ 3, 5 - Chiều'),
    ('MH003', N'Môn Học 3', 60, 4, N'Thứ 2, 4 - Sáng, Thứ 6 - Chiều'),
    ('MH004', N'Môn Học 4', 75, 5, N'Thứ 2, 3, 5 - Sáng, Thứ 4 - Chiều'),
    ('MH005', N'Môn Học 5', 50, 3, N'Thứ 3, 6 - Sáng, Thứ 4 - Chiều');

-- Thêm ĐĂNG KÝ MÔN HỌC
INSERT INTO DangKyMonHoc (MaMH, MaSV, ThoiGianDangKy)
VALUES
    ('MH001', 'SV0001', '2024-07-23 10:00:00'),
    ('MH002', 'SV0002', '2024-07-23 10:05:00'),
    ('MH001', 'SV0003', '2024-07-23 10:10:00'),
    ('MH003', 'SV0001', '2024-07-23 10:15:00'),
    ('MH004', 'SV0004', '2024-07-23 10:20:00');

-- Thêm LỚP HỌC
-- Thêm nhiều lớp học vào bảng Lop
INSERT INTO Lop (MaLop, MaMH, MaGV)
VALUES
    ('L001', 'MH001', 'GV0001'),
    ('L002', 'MH002', 'GV0002'),
    ('L003', 'MH003', 'GV0001'),
    ('L004', 'MH001', 'GV0002'),
    ('L005', 'MH002', 'GV0001');

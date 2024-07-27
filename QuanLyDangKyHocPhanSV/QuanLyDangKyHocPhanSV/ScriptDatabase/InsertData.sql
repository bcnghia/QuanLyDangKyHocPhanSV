--------------------------------
-- File này dùng để thêm Data --
--------------------------------
-- CẦN SELECT THÌ SANG FILE SELCET TRÁNH LÀM LOÃNG FILE NÀY. THÂN --

USE QuanLyDangKyHocPhanSV;
GO

-- Thêm PHÂN QUYỀN TÀI KHOẢN
INSERT INTO RoleAccount (TenRole) 
VALUES 
	('student'),
	('teacher'),
	('admin');
GO

-- Thêm GIÁO VỤ - ADMIN -- sử dụng ký tự AD
INSERT INTO GiaoVu (MaGiaoVu, TenGiaoVu, NgaySinh, GioiTinh, Email, MatKhau, RoleAccount) 
VALUES 
	('AD0001', N'Bùi Minh', '2000-01-01', 1, 'buiminh1@gmail.com', 'mnh32', 'admin'),
	('AD0002', N'Nguyễn Hạnh', '2000-01-01', 0, 'nguyenhanh2@gmail.com', 'hn234', 'admin'),
	('AD0003', N'Lê Thanh', '2000-01-01', 1, 'lethanh3@gmail.com', 'th456', 'admin'),
	('AD0004', N'Ngô Hiếu', '2000-01-01', 0, 'ngohieu4@gmail.com', 'hh789', 'admin'),
	('AD0005', N'Hồ Quân', '2000-01-01', 1, 'hoquan5@gmail.com', 'q1212', 'admin'),
	('AD0006', N'Lương Đức', '2000-01-01', 1, 'luongduc6@gmail.com', 'dc234', 'admin'),
	('AD0007', N'Trần Khánh', '2000-01-01', 1, 'trankhanh7@gmail.com', 'kh567', 'admin'),
	('AD0008', N'Võ Hùng', '2000-01-01', 1, 'vohung8@gmail.com', 'hg890', 'admin'),
	('AD0009', N'Hà Tâm', '2000-01-01', 0, 'hatam9@gmail.com', 'tm345', 'admin'),
	('AD0010', N'Bùi Thảo', '2000-01-01', 0, 'buithao10@gmail.com', 'th678', 'admin'),
	('AD0011', N'Nguyễn Sơn', '2000-01-01', 1, 'nguyenson11@gmail.com', 'sn910', 'admin'),
	('AD0012', N'Lê Phong', '2000-01-01', 1, 'lephong12@gmail.com', 'ph112', 'admin'),
	('AD0013', N'Ngô Quỳnh', '2000-01-01', 0, 'ngoquynh13@gmail.com', 'qh345', 'admin'),
	('AD0014', N'Hồ Ngọc', '2000-01-01', 0, 'hongoc14@gmail.com', 'ng678', 'admin'),
	('AD0015', N'Lương Khôi', '2000-01-01', 1, 'luongkhoi15@gmail.com', 'kh910', 'admin'),
	('AD0016', N'Trần Nhi', '2000-01-01', 0, 'trannhi16@gmail.com', 'nh112', 'admin'),
	('AD0017', N'Võ Lan', '2000-01-01', 0, 'volan17@gmail.com', 'ln345', 'admin'),
	('AD0018', N'Hà Sơn', '2000-01-01', 1, 'hason18@gmail.com', 'sn678', 'admin'),
	('AD0019', N'Bùi Tùng', '2000-01-01', 1, 'buitung19@gmail.com', 'tg910', 'admin'),
	('AD0020', N'Nguyễn Hòa', '2000-01-01', 1, 'nguyenhoa20@gmail.com', 'hh112', 'admin'),
	('AD0021', N'Lê Chi', '2000-01-01', 0, 'lechi21@gmail.com', 'ch345', 'admin'),
	('AD0022', N'Ngô Mai', '2000-01-01', 0, 'ngomai22@gmail.com', 'mh678', 'admin'),
	('AD0023', N'Hồ An', '2000-01-01', 0, 'hoan23@gmail.com', 'an910', 'admin'),
	('AD0024', N'Lương Hồng', '2000-01-01', 0, 'luonghong24@gmail.com', 'hg112', 'admin'),
	('AD0025', N'Trần Diệu', '2000-01-01', 0, 'trandie25@gmail.com', 'dn345', 'admin'),
	('AD0026', N'Võ Hòa', '2000-01-01', 1, 'vohoa26@gmail.com', 'hh678', 'admin'),
	('AD0027', N'Hà Hiền', '2000-01-01', 0, 'hahien27@gmail.com', 'hn910', 'admin'),
	('AD0028', N'Bùi Trung', '2000-01-01', 1, 'buitrung28@gmail.com', 'tg112', 'admin'),
	('AD0029', N'Nguyễn Quân', '2000-01-01', 1, 'nguyenquan29@gmail.com', 'qn345', 'admin'),
	('AD0030', N'Lê Hưng', '2000-01-01', 1, 'lehung30@gmail.com', 'hg678', 'admin'),
	('AD0031', N'Ngô Lộc', '2000-01-01', 1, 'ngoloc31@gmail.com', 'lc910', 'admin'),
	('AD0032', N'Hồ Dũng', '2000-01-01', 1, 'hodung32@gmail.com', 'dn112', 'admin'),
	('AD0033', N'Lương Tuấn', '2000-01-01', 1, 'luongtuan33@gmail.com', 'tn345', 'admin'),
	('AD0034', N'Trần Hải', '2000-01-01', 1, 'tranhai34@gmail.com', 'hn678', 'admin'),
	('AD0035', N'Võ Hà', '2000-01-01', 1, 'voha35@gmail.com', 'hh910', 'admin'),
	('AD0036', N'Hà Cường', '2000-01-01', 1, 'hacong36@gmail.com', 'cn112', 'admin'),
	('AD0037', N'Bùi Lan', '2000-01-01', 0, 'builan37@gmail.com', 'ln345', 'admin'),
	('AD0038', N'Nguyễn Minh', '2000-01-01', 1, 'nguyenminh38@gmail.com', 'mn678', 'admin'),
	('AD0039', N'Lê Anh', '2000-01-01', 1, 'leanh39@gmail.com', 'ah910', 'admin'),
	('AD0040', N'Ngô Thảo', '2000-01-01', 0, 'ngothao40@gmail.com', 'th112', 'admin'),
	('AD0041', N'Hồ Hà', '2000-01-01', 0, 'hoha41@gmail.com', 'hh345', 'admin'),
	('AD0042', N'Lương Mai', '2000-01-01', 0, 'luongmai42@gmail.com', 'mh678', 'admin'),
	('AD0043', N'Trần Thắng', '2000-01-01', 1, 'tranthang43@gmail.com', 'tg910', 'admin'),
	('AD0044', N'Võ Tú', '2000-01-01', 1, 'votu44@gmail.com', 'tu112', 'admin'),
	('AD0045', N'Hà Khôi', '2000-01-01', 1, 'hakhoi45@gmail.com', 'kh345', 'admin'),
	('AD0046', N'Bùi Hiền', '2000-01-01', 0, 'buihien46@gmail.com', 'hn678', 'admin'),
	('AD0047', N'Nguyễn Ngọc', '2000-01-01', 0, 'nguyenngoc47@gmail.com', 'ng910', 'admin'),
	('AD0048', N'Lê Vinh', '2000-01-01', 1, 'levinh48@gmail.com', 'vn112', 'admin'),
	('AD0049', N'Ngô Thanh', '2000-01-01', 1, 'ngothanh49@gmail.com', 'tn345', 'admin'),
	('AD0050', N'Hồ Thịnh', '2000-01-01', 1, 'hothinh50@gmail.com', 'tn678', 'admin');
GO


-- Thêm GIẢNG VIÊN -- sử  dụng ký tự GV
INSERT INTO GiangVien (MaGV, TenGV, NgaySinh, GioiTinh, Email, HocHam, MatKhau, RoleAccount) 
VALUES 
    ('GV0001', N'Nguyễn Văn A', '1975-02-15', 1, 'nguyenvana@gv.example.com', N'Tiến sĩ', 'ab123', 'teacher'),
    ('GV0002', N'Trần Thị B', '1980-06-30', 0, 'tranthib@gv.example.com', N'Thạc sĩ', 'bc234', 'teacher'),
    ('GV0003', N'Lê Văn C', '1978-11-22', 1, 'levanc@gv.example.com', N'Phó giáo sư', 'cd345', 'teacher'),
    ('GV0004', N'Phạm Thị D', '1983-03-09', 0, 'phamthid@gv.example.com', N'Tiến sĩ', 'de456', 'teacher'),
    ('GV0005', N'Hoàng Văn E', '1979-08-17', 1, 'hoangvane@gv.example.com', N'Thạc sĩ', 'ef567', 'teacher'),
    ('GV0006', N'Bùi Thị F', '1981-05-24', 0, 'buithif@gv.example.com', N'Tiến sĩ', 'fg678', 'teacher'),
    ('GV0007', N'Nguyễn Văn G', '1977-12-19', 1, 'nguyenvang@gv.example.com', N'Phó giáo sư', 'gh789', 'teacher'),
    ('GV0008', N'Lê Thị H', '1984-04-14', 0, 'lethih@gv.example.com', N'Thạc sĩ', 'hi890', 'teacher'),
    ('GV0009', N'Ngô Văn I', '1976-09-21', 1, 'ngovani@gv.example.com', N'Tiến sĩ', 'ij123', 'teacher'),
    ('GV0010', N'Hồ Thị J', '1982-07-08', 0, 'hothij@gv.example.com', N'Thạc sĩ', 'jk234', 'teacher'),
    ('GV0011', N'Lương Văn K', '1975-03-13', 1, 'luongvank@gv.example.com', N'Tiến sĩ', 'kl345', 'teacher'),
    ('GV0012', N'Trần Thị L', '1980-11-29', 0, 'tranthil@gv.example.com', N'Thạc sĩ', 'lm456', 'teacher'),
    ('GV0013', N'Võ Văn M', '1979-10-16', 1, 'vovanm@gv.example.com', N'Phó giáo sư', 'mn567', 'teacher'),
    ('GV0014', N'Hà Thị N', '1981-06-23', 0, 'hathin@gv.example.com', N'Tiến sĩ', 'no678', 'teacher'),
    ('GV0015', N'Bùi Văn O', '1978-02-27', 1, 'buivano@gv.example.com', N'Thạc sĩ', 'op789', 'teacher'),
    ('GV0016', N'Nguyễn Thị P', '1977-08-12', 0, 'nguyenthip@gv.example.com', N'Tiến sĩ', 'pq890', 'teacher'),
    ('GV0017', N'Lê Văn Q', '1976-01-04', 1, 'levanq@gv.example.com', N'Phó giáo sư', 'qr123', 'teacher'),
    ('GV0018', N'Ngô Thị R', '1983-03-30', 0, 'ngothir@gv.example.com', N'Thạc sĩ', 'rs234', 'teacher'),
    ('GV0019', N'Hồ Văn S', '1975-12-18', 1, 'hovans@gv.example.com', N'Tiến sĩ', 'st345', 'teacher'),
    ('GV0020', N'Lương Thị T', '1980-05-25', 0, 'luongthit@gv.example.com', N'Thạc sĩ', 'tu456', 'teacher'),
    ('GV0021', N'Trần Văn U', '1978-07-31', 1, 'tranvanu@gv.example.com', N'Phó giáo sư', 'uv567', 'teacher'),
    ('GV0022', N'Võ Thị V', '1982-02-10', 0, 'vothiv@gv.example.com', N'Tiến sĩ', 'vw678', 'teacher'),
    ('GV0023', N'Hà Văn W', '1976-06-11', 1, 'havanw@gv.example.com', N'Thạc sĩ', 'wx789', 'teacher'),
    ('GV0024', N'Bùi Thị X', '1979-09-27', 0, 'buithix@gv.example.com', N'Tiến sĩ', 'xy890', 'teacher'),
    ('GV0025', N'Nguyễn Văn Y', '1980-11-14', 1, 'nguyenvany@gv.example.com', N'Phó giáo sư', 'yz123', 'teacher'),
    ('GV0026', N'Lê Thị Z', '1981-05-22', 0, 'lethiz@gv.example.com', N'Thạc sĩ', 'za234', 'teacher'),
    ('GV0027', N'Ngô Văn A', '1977-02-28', 1, 'ngovana@gv.example.com', N'Tiến sĩ', 'ab345', 'teacher'),
    ('GV0028', N'Hồ Thị B', '1982-07-07', 0, 'hothib@gv.example.com', N'Thạc sĩ', 'bc456', 'teacher'),
    ('GV0029', N'Lương Văn C', '1975-04-19', 1, 'luongvanc@gv.example.com', N'Phó giáo sư', 'cd567', 'teacher'),
    ('GV0030', N'Trần Thị D', '1980-09-26', 0, 'tranthid@gv.example.com', N'Tiến sĩ', 'de678', 'teacher'),
    ('GV0031', N'Võ Văn E', '1979-10-05', 1, 'vovane@gv.example.com', N'Thạc sĩ', 'ef789', 'teacher'),
    ('GV0032', N'Hà Thị F', '1981-03-21', 0, 'hathif@gv.example.com', N'Tiến sĩ', 'fg890', 'teacher'),
    ('GV0033', N'Bùi Văn G', '1976-12-14', 1, 'buivang@gv.example.com', N'Thạc sĩ', 'gh123', 'teacher'),
    ('GV0034', N'Nguyễn Thị H', '1983-01-23', 0, 'nguyenthiih@gv.example.com', N'Phó giáo sư', 'hi234', 'teacher'),
    ('GV0035', N'Lê Văn I', '1977-08-06', 1, 'levani@gv.example.com', N'Tiến sĩ', 'ij345', 'teacher'),
    ('GV0036', N'Ngô Thị J', '1984-06-16', 0, 'ngothij@gv.example.com', N'Thạc sĩ', 'jk456', 'teacher'),
    ('GV0037', N'Hồ Văn K', '1976-11-08', 1, 'hovank@gv.example.com', N'Phó giáo sư', 'kl567', 'teacher'),
    ('GV0038', N'Lương Thị L', '1980-08-18', 0, 'luongthil@gv.example.com', N'Tiến sĩ', 'lm678', 'teacher'),
    ('GV0039', N'Trần Văn M', '1978-04-26', 1, 'tranvanm@gv.example.com', N'Thạc sĩ', 'mn789', 'teacher'),
    ('GV0040', N'Võ Thị N', '1982-01-15', 0, 'vothin@gv.example.com', N'Tiến sĩ', 'no890', 'teacher'),
    ('GV0041', N'Hà Văn O', '1976-05-03', 1, 'havano@gv.example.com', N'Phó giáo sư', 'op123', 'teacher'),
    ('GV0042', N'Bùi Thị P', '1979-10-25', 0, 'buithip@gv.example.com', N'Thạc sĩ', 'pq234', 'teacher'),
    ('GV0043', N'Nguyễn Văn Q', '1980-03-12', 1, 'nguyenvanq@gv.example.com', N'Tiến sĩ', 'qr345', 'teacher'),
    ('GV0044', N'Lê Thị R', '1981-09-17', 0, 'lethir@gv.example.com', N'Thạc sĩ', 'rs456', 'teacher'),
    ('GV0045', N'Ngô Văn S', '1977-07-11', 1, 'ngovans@gv.example.com', N'Phó giáo sư', 'st567', 'teacher'),
    ('GV0046', N'Hồ Thị T', '1983-02-20', 0, 'hothit@gv.example.com', N'Tiến sĩ', 'tu678', 'teacher'),
    ('GV0047', N'Lương Văn U', '1975-06-27', 1, 'luongvanu@gv.example.com', N'Thạc sĩ', 'uv789', 'teacher'),
    ('GV0048', N'Trần Thị V', '1980-12-02', 0, 'tranthiv@gv.example.com', N'Tiến sĩ', 'vw890', 'teacher'),
    ('GV0049', N'Võ Văn W', '1978-11-23', 1, 'vovanw@gv.example.com', N'Thạc sĩ', 'wx123', 'teacher'),
    ('GV0050', N'Hà Thị X', '1982-07-30', 0, 'hathix@gv.example.com', N'Tiến sĩ', 'xy234', 'teacher');


-- Thêm SINH VIÊN -- sử  dụng ký tự SV
INSERT INTO SinhVien (MaSV, TenSV, NgaySinh, GioiTinh, Email, Khoa, Lop, MatKhau, RoleAccount) 
VALUES 
    ('SV0001', N'Nguyễn Văn A', '1999-01-01', 1, 'nguyenvana@example.com', N'Công Nghệ Thông Tin', 'Lop1', 'st123', 'student'),
    ('SV0002', N'Lê Thị B', '2000-02-02', 0, 'lethib@example.com', N'Kinh Tế', 'Lop2', 'st234', 'student'),
    ('SV0003', N'Ngô Văn C', '1998-03-03', 1, 'ngovanc@example.com', N'Y Dược', 'Lop3', 'st345', 'student'),
    ('SV0004', N'Võ Thị D', '2001-04-04', 0, 'vothid@example.com', N'Ngoại Ngữ', 'Lop4', 'st456', 'student'),
    ('SV0005', N'Hồ Văn E', '1997-05-05', 1, 'hovane@example.com', N'Kỹ Thuật', 'Lop5', 'st567', 'student'),
    ('SV0006', N'Bùi Thị F', '1999-06-06', 0, 'buithif@example.com', N'Công Nghệ Thông Tin', 'Lop6', 'st678', 'student'),
    ('SV0007', N'Nguyễn Văn G', '1998-07-07', 1, 'nguyenvang@example.com', N'Kinh Tế', 'Lop7', 'st789', 'student'),
    ('SV0008', N'Lê Thị H', '2000-08-08', 0, 'lethih@example.com', N'Y Dược', 'Lop8', 'st890', 'student'),
    ('SV0009', N'Ngô Văn I', '2001-09-09', 1, 'ngovani@example.com', N'Ngoại Ngữ', 'Lop9', 'st901', 'student'),
    ('SV0010', N'Võ Thị J', '1997-10-10', 0, 'vothij@example.com', N'Kỹ Thuật', 'Lop10', 'st012', 'student'),
    ('SV0011', N'Hồ Văn K', '1999-11-11', 1, 'hovank@example.com', N'Công Nghệ Thông Tin', 'Lop11', 'st123', 'student'),
    ('SV0012', N'Bùi Thị L', '1998-12-12', 0, 'buithil@example.com', N'Kinh Tế', 'Lop12', 'st234', 'student'),
    ('SV0013', N'Nguyễn Văn M', '2000-01-13', 1, 'nguyenvanm@example.com', N'Y Dược', 'Lop13', 'st345', 'student'),
    ('SV0014', N'Lê Thị N', '2001-02-14', 0, 'lethin@example.com', N'Ngoại Ngữ', 'Lop14', 'st456', 'student'),
    ('SV0015', N'Ngô Văn O', '1997-03-15', 1, 'ngovano@example.com', N'Kỹ Thuật', 'Lop15', 'st567', 'student'),
    ('SV0016', N'Võ Thị P', '1999-04-16', 0, 'vothip@example.com', N'Công Nghệ Thông Tin', 'Lop16', 'st678', 'student'),
    ('SV0017', N'Hồ Văn Q', '1998-05-17', 1, 'hovanq@example.com', N'Kinh Tế', 'Lop17', 'st789', 'student'),
    ('SV0018', N'Bùi Thị R', '2000-06-18', 0, 'buithir@example.com', N'Y Dược', 'Lop18', 'st890', 'student'),
    ('SV0019', N'Nguyễn Văn S', '2001-07-19', 1, 'nguyenvans@example.com', N'Ngoại Ngữ', 'Lop19', 'st901', 'student'),
    ('SV0020', N'Lê Thị T', '1997-08-20', 0, 'lethit@example.com', N'Kỹ Thuật', 'Lop20', 'st012', 'student'),
    ('SV0021', N'Ngô Văn U', '1999-09-21', 1, 'ngovanu@example.com', N'Công Nghệ Thông Tin', 'Lop21', 'st123', 'student'),
    ('SV0022', N'Võ Thị V', '1998-10-22', 0, 'vothiv@example.com', N'Kinh Tế', 'Lop22', 'st234', 'student'),
    ('SV0023', N'Hồ Văn W', '2000-11-23', 1, 'hovanw@example.com', N'Y Dược', 'Lop23', 'st345', 'student'),
    ('SV0024', N'Bùi Thị X', '2001-12-24', 0, 'buithix@example.com', N'Ngoại Ngữ', 'Lop24', 'st456', 'student'),
    ('SV0025', N'Nguyễn Văn Y', '1997-01-25', 1, 'nguyenvany@example.com', N'Kỹ Thuật', 'Lop25', 'st567', 'student'),
    ('SV0026', N'Lê Thị Z', '1999-02-26', 0, 'lethiz@example.com', N'Công Nghệ Thông Tin', 'Lop26', 'st678', 'student'),
    ('SV0027', N'Ngô Văn A', '1998-03-27', 1, 'ngovana@example.com', N'Kinh Tế', 'Lop27', 'st789', 'student'),
    ('SV0028', N'Võ Thị B', '2000-04-28', 0, 'vothib@example.com', N'Y Dược', 'Lop28', 'st890', 'student'),
    ('SV0029', N'Hồ Văn C', '2001-05-29', 1, 'hovanc@example.com', N'Ngoại Ngữ', 'Lop29', 'st901', 'student'),
    ('SV0030', N'Bùi Thị D', '1997-06-30', 0, 'buithid@example.com', N'Kỹ Thuật', 'Lop30', 'st012', 'student'),
    ('SV0031', N'Nguyễn Văn E', '1999-07-31', 1, 'nguyenvane@example.com', N'Công Nghệ Thông Tin', 'Lop31', 'st123', 'student'),
    ('SV0032', N'Lê Thị F', '1998-08-01', 0, 'lethif@example.com', N'Kinh Tế', 'Lop32', 'st234', 'student'),
    ('SV0033', N'Ngô Văn G', '2000-09-02', 1, 'ngovang@example.com', N'Y Dược', 'Lop33', 'st345', 'student'),
    ('SV0034', N'Võ Thị H', '2001-10-03', 0, 'vothih@example.com', N'Ngoại Ngữ', 'Lop34', 'st456', 'student'),
    ('SV0035', N'Hồ Văn I', '1997-11-04', 1, 'hovani@example.com', N'Kỹ Thuật', 'Lop35', 'st567', 'student'),
    ('SV0036', N'Bùi Thị J', '1999-12-05', 0, 'buithij@example.com', N'Công Nghệ Thông Tin', 'Lop36', 'st678', 'student'),
    ('SV0037', N'Nguyễn Văn K', '1998-01-06', 1, 'nguyenvank@example.com', N'Kinh Tế', 'Lop37', 'st789', 'student'),
    ('SV0038', N'Lê Thị L', '2000-02-07', 0, 'lethil@example.com', N'Y Dược', 'Lop38', 'st890', 'student'),
    ('SV0039', N'Ngô Văn M', '2001-03-08', 1, 'ngovanm@example.com', N'Ngoại Ngữ', 'Lop39', 'st901', 'student'),
    ('SV0040', N'Võ Thị N', '1997-04-09', 0, 'vothin@example.com', N'Kỹ Thuật', 'Lop40', 'st012', 'student'),
    ('SV0041', N'Hồ Văn O', '1999-05-10', 1, 'hovano@example.com', N'Công Nghệ Thông Tin', 'Lop41', 'st123', 'student'),
    ('SV0042', N'Bùi Thị P', '1998-06-11', 0, 'buithip@example.com', N'Kinh Tế', 'Lop42', 'st234', 'student'),
    ('SV0043', N'Nguyễn Văn Q', '2000-07-12', 1, 'nguyenvanq@example.com', N'Y Dược', 'Lop43', 'st345', 'student'),
    ('SV0044', N'Lê Thị R', '2001-08-13', 0, 'lethir@example.com', N'Ngoại Ngữ', 'Lop44', 'st456', 'student'),
    ('SV0045', N'Ngô Văn S', '1997-09-14', 1, 'ngovans@example.com', N'Kỹ Thuật', 'Lop45', 'st567', 'student'),
    ('SV0046', N'Võ Thị T', '1999-10-15', 0, 'vothit@example.com', N'Công Nghệ Thông Tin', 'Lop46', 'st678', 'student'),
    ('SV0047', N'Hồ Văn U', '1998-11-16', 1, 'hovanu@example.com', N'Kinh Tế', 'Lop47', 'st789', 'student'),
    ('SV0048', N'Bùi Thị V', '2000-12-17', 0, 'buithiv@example.com', N'Y Dược', 'Lop48', 'st890', 'student'),
    ('SV0049', N'Nguyễn Văn W', '2001-01-18', 1, 'nguyenvanw@example.com', N'Ngoại Ngữ', 'Lop49', 'st901', 'student'),
    ('SV0050', N'Lê Thị X', '1997-02-19', 0, 'lethix@example.com', N'Kỹ Thuật', 'Lop50', 'st012', 'student');
GO

-- Thêm MÔN HỌC 
INSERT INTO MonHoc (MaMH, TenMH, SoTiet, SoTinChi, ThoiKhoaBieu)
VALUES
	('MH001', N'Môn Học 1', 45, 3, N'Thứ 2, 3, 4 - Sáng'),
    ('MH002', N'Môn Học 2', 30, 2, N'Thứ 3, 5 - Chiều'),
    ('MH003', N'Môn Học 3', 60, 4, N'Thứ 2, 4 - Sáng, Thứ 6 - Chiều'),
    ('MH004', N'Môn Học 4', 75, 5, N'Thứ 2, 3, 5 - Sáng, Thứ 4 - Chiều'),
    ('MH005', N'Môn Học 5', 50, 3, N'Thứ 3, 6 - Sáng, Thứ 4 - Chiều'),
    ('MH006', N'Tin Học Đại Cương', 45, 3, N'Thứ 2, 3 - Sáng'),
    ('MH007', N'Giải Tích 1', 60, 4, N'Thứ 3, 4 - Chiều'),
    ('MH008', N'Vật Lý Đại Cương', 45, 3, N'Thứ 2, 3 - Sáng, Thứ 6 - Chiều'),
    ('MH009', N'Hóa Học Đại Cương', 50, 3, N'Thứ 3, 5 - Sáng'),
    ('MH010', N'Triết Học Mác-Lênin', 45, 3, N'Thứ 4, 6 - Sáng'),
    ('MH011', N'Kinh Tế Vi Mô', 45, 3, N'Thứ 5, 7 - Sáng, Thứ 6 - Chiều'),
    ('MH012', N'Kinh Tế Vĩ Mô', 45, 3, N'Thứ 6, 3 - Chiều'),
    ('MH013', N'Lập Trình C', 60, 4, N'Thứ 2, 5 - Chiều, Thứ 5 - Sáng'),
    ('MH014', N'Quản Trị Học', 45, 3, N'Thứ 3, 2 - Sáng'),
    ('MH015', N'Marketing Căn Bản', 45, 3, N'Thứ 2, 6 - Chiều'),
    ('MH016', N'Luật Kinh Tế', 45, 3, N'Thứ 4, 5 - Sáng, Thứ 6 - Chiều'),
    ('MH017', N'Kế Toán Đại Cương', 60, 4, N'Thứ 3, 6 - Chiều'),
    ('MH018', N'Tài Chính Doanh Nghiệp', 45, 3, N'Thứ 5, 3 - Sáng'),
    ('MH019', N'Tiếng Anh 1', 45, 3, N'Thứ 2, 4 - Sáng'),
    ('MH020', N'Tiếng Anh 2', 45, 3, N'Thứ 4, 7 - Sáng, Thứ 5 - Chiều'),
    ('MH021', N'Pháp Luật Đại Cương', 45, 3, N'Thứ 5, 6 - Sáng, Thứ 7 - Chiều'),
    ('MH022', N'Xác Suất Thống Kê', 45, 3, N'Thứ 6, 2 - Chiều'),
    ('MH023', N'Triết Học Tây Phương', 45, 3, N'Thứ 3, 5 - Sáng'),
    ('MH024', N'Khoa Học Máy Tính', 45, 3, N'Thứ 4, 6 - Chiều'),
    ('MH025', N'Lập Trình Java', 60, 4, N'Thứ 2, 3 - Sáng, Thứ 4 - Chiều'),
    ('MH026', N'Quản Lý Dự Án', 45, 3, N'Thứ 5, 7 - Sáng, Thứ 6 - Chiều'),
    ('MH027', N'Phân Tích Dữ Liệu', 45, 3, N'Thứ 2, 4 - Chiều'),
    ('MH028', N'Hệ Quản Trị CSDL', 60, 4, N'Thứ 3, 2 - Sáng, Thứ 5 - Chiều'),
    ('MH029', N'An Ninh Mạng', 45, 3, N'Thứ 4, 5 - Sáng, Thứ 6 - Chiều'),
    ('MH030', N'Phát Triển Ứng Dụng Web', 45, 3, N'Thứ 5, 3 - Chiều'),
    ('MH031', N'Trí Tuệ Nhân Tạo', 60, 4, N'Thứ 2, 6 - Chiều, Thứ 4 - Sáng'),
    ('MH032', N'Lập Trình Python', 45, 3, N'Thứ 3, 4 - Sáng'),
    ('MH033', N'Phân Tích Thiết Kế Hệ Thống', 45, 3, N'Thứ 4, 5 - Chiều'),
    ('MH034', N'Quản Trị Mạng', 45, 3, N'Thứ 5, 6 - Sáng'),
    ('MH035', N'Phát Triển Phần Mềm', 60, 4, N'Thứ 6, 7 - Chiều');

GO

-- Thêm ĐĂNG KÝ MÔN HỌC
INSERT INTO DangKyMonHoc (MaMH, MaSV, ThoiGianDangKy)
VALUES
    ('MH001', 'SV0005', '2024-07-23 10:25:00'),
    ('MH002', 'SV0001', '2024-07-23 10:30:00'),
    ('MH003', 'SV0002', '2024-07-23 10:35:00'),
    ('MH004', 'SV0003', '2024-07-23 10:40:00'),
    ('MH005', 'SV0004', '2024-07-23 10:45:00'),
    ('MH006', 'SV0005', '2024-07-23 10:50:00'),
    ('MH007', 'SV0001', '2024-07-23 10:55:00'),
    ('MH008', 'SV0002', '2024-07-23 11:00:00'),
    ('MH009', 'SV0003', '2024-07-23 11:05:00'),
    ('MH010', 'SV0004', '2024-07-23 11:10:00'),
    ('MH011', 'SV0005', '2024-07-23 11:15:00'),
    ('MH012', 'SV0001', '2024-07-23 11:20:00'),
    ('MH013', 'SV0002', '2024-07-23 11:25:00'),
    ('MH014', 'SV0003', '2024-07-23 11:30:00'),
    ('MH015', 'SV0004', '2024-07-23 11:35:00'),
    ('MH016', 'SV0005', '2024-07-23 11:40:00'),
    ('MH017', 'SV0001', '2024-07-23 11:45:00'),
    ('MH018', 'SV0002', '2024-07-23 11:50:00'),
    ('MH019', 'SV0003', '2024-07-23 11:55:00'),
    ('MH020', 'SV0004', '2024-07-23 12:00:00'),
    ('MH021', 'SV0005', '2024-07-23 12:05:00'),
    ('MH022', 'SV0001', '2024-07-23 12:10:00'),
    ('MH023', 'SV0002', '2024-07-23 12:15:00'),
    ('MH024', 'SV0003', '2024-07-23 12:20:00'),
    ('MH025', 'SV0004', '2024-07-23 12:25:00'),
    ('MH026', 'SV0005', '2024-07-23 12:30:00'),
    ('MH027', 'SV0001', '2024-07-23 12:35:00'),
    ('MH028', 'SV0002', '2024-07-23 12:40:00'),
    ('MH029', 'SV0003', '2024-07-23 12:45:00'),
    ('MH030', 'SV0004', '2024-07-23 12:50:00');

GO

-- Thêm LỚP HỌC
-- Thêm nhiều lớp học vào bảng Lop
INSERT INTO Lop (MaLop, MaMH, MaGV)
VALUES
    ('L001', 'MH001', 'GV0001'),
    ('L002', 'MH002', 'GV0002'),
    ('L003', 'MH003', 'GV0001'),
    ('L004', 'MH001', 'GV0002'),
    ('L005', 'MH002', 'GV0001');
GO

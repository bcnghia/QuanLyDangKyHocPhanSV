USE QuanLyDangKyHocPhanSV;


-- SELECT
SELECT * FROM vThongTinDangNhap;
SELECT * FROM vThongTinDangKyMonHoc;
SELECT * FROM vThongTinLopHoc;

Select * From RoleAccount;
Select * From GiaoVu;
Select * From GiangVien;
Select * From SinhVien;
Select * From MonHoc;
Select * From DangKyMonHoc;
Select * From Lop;


-- DELETE
DROP VIEW VThongTinDangNhap;
DROP VIEW VThongTinDangKyMonHoc;

DELETE FROM DangKyMonHoc;
DELETE FROM Lop;
DELETE FROM GiaoVu;
DELETE FROM GiangVien;
DELETE FROM SinhVien;
DELETE FROM MonHoc;
DELETE FROM RoleAccount;



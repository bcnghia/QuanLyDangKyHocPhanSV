using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;
using System;

namespace QuanLyDangKyHocPhanSV.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();
        [Route("")]

        #region SELECT UI
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }

        [Route("danhsachmonhoc")]
        public IActionResult DanhSachMonHoc()
        {
            var lstMonHoc = db.MonHocs.ToList();
            return View(lstMonHoc);
        }

        [Route("giangvien")]
        public IActionResult GiangVien()
        {
            var lstGiangVien = db.GiangViens.ToList();
            return View(lstGiangVien);
        }

        [Route("sinhvien")]
        public IActionResult SinhVien()
        {
            var lstSinhVien = db.SinhViens.ToList();
            return View(lstSinhVien);
        }

        [Route("giaovu")]
        public IActionResult GiaoVu()
        {
            var lstGiaoVu = db.GiaoVus.ToList();
            return View(lstGiaoVu);
        }

        [Route("sinhviendangkymonhoc")]
        public IActionResult SinhVienDangKyMonHoc()
        {
            var lstSinhVienDangKyMonHoc = db.VThongTinDangKyMonHocs.ToList();
            return View(lstSinhVienDangKyMonHoc);
        }
        #endregion

        #region THÊM ĐỐI TƯỢNG
        [Route("themgiangvien")]
        [HttpGet]
        public IActionResult ThemGiangVien()
        {
            return View();
        }
        [Route("themgiangvien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemGiangVien(GiangVien giangVien)
        {
            if (ModelState.IsValid)
            {
                db.GiangViens.Add(giangVien);
                db.SaveChanges();

                return RedirectToAction("GiangVien");
            }

            return View();
        }

        [Route("themsinhvien")]
        [HttpGet]
        public IActionResult ThemSinhVien()
        {
            return View();
        }
        [Route("themsinhvien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSinhVien(SinhVien sinhVien)
        {
            if (ModelState.IsValid)
            {
                db.SinhViens.Add(sinhVien);
                db.SaveChanges();

                return RedirectToAction("SinhVien");
            }

            return View();
        }

        [Route("themgiaovu")]
        [HttpGet]
        public IActionResult ThemGiaoVu()
        {
            return View();
        }
        [Route("themgiaovu")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemGiaoVu(GiaoVu giaoVu)
        {
            if (ModelState.IsValid)
            {
                db.GiaoVus.Add(giaoVu);
                db.SaveChanges();

                return RedirectToAction("GiaoVu");
            }

            return View();
        }

        [Route("ThemMonHoc")]
        [HttpGet]
        public IActionResult ThemMonHoc()
        {
            return View();
        }
        [Route("ThemMonHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemMonHoc(MonHoc monHoc)
        {
            if (ModelState.IsValid)
            {
                db.MonHocs.Add(monHoc);
                db.SaveChanges();

                return RedirectToAction("DanhSachMonHoc");
            }

            return View();
        }
        #endregion

        #region EDIT THÔNG TIN ĐỐI TƯỢNG
        [Route("EditGiangVien")]
        [HttpGet]
        public IActionResult EditGiangVien(string maGV)
        {
            var giangVien = db.GiangViens.Find(maGV);
            return View(giangVien);
        }
        [Route("EditGiangVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditGiangVien(GiangVien giangVien)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(giangVien).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.Update(giangVien);
                db.SaveChanges();

                return RedirectToAction("GiangVien","HomeAdmin");
            }

            return View(giangVien);
        }

        [Route("EditSinhVien")]
        [HttpGet]
        public IActionResult EditSinhVien(string maSV)
        {
            var sinhVien = db.SinhViens.Find(maSV);
            return View(sinhVien);
        }
        [Route("EditSinhVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditSinhVien(SinhVien sinhVien)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(giangVien).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.Update(sinhVien);
                db.SaveChanges();

                return RedirectToAction("SinhVien", "HomeAdmin");
            }

            return View(sinhVien);
        }

        [Route("EditGiaoVu")]
        [HttpGet]
        public IActionResult EditGiaoVu(string maGiaoVu)
        {
            var giaoVu = db.GiaoVus.Find(maGiaoVu);
            return View(giaoVu);
        }
        [Route("EditGiaoVu")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditGiaoVu(GiaoVu giaoVu)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(giangVien).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.Update(giaoVu);
                db.SaveChanges();

                return RedirectToAction("GiaoVu", "HomeAdmin");
            }

            return View(giaoVu);
        }

        [Route("EditMonHoc")]
        [HttpGet]
        public IActionResult EditMonHoc(string maMH)
        {
            var monHoc = db.MonHocs.Find(maMH);
            return View(monHoc);
        }
        [Route("EditMonHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditMonHoc(MonHoc monHoc)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(giangVien).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.Update(monHoc);
                db.SaveChanges();

                return RedirectToAction("DanhSachMonHoc", "HomeAdmin");
            }

            return View(monHoc);
        }
        #endregion

        #region XÓA ĐỐI TƯỢNG - CẦN ĐỌC HƯỚNG DẪN SỬ DỤNG
        // Chức năng Xóa - Delete có thể sẽ xóa đối tượng riêng lẻ được
        // Nhưng nếu đối tượng có liên kết với các Database, bảng, trường dữ liệu khác sẽ sinh ra lỗi khi xóa
        // Cần phải thỏa yêu cầu cơ bản ràng buộc dữ liệu giữa các bảng với nhau
        [Route("XoaDangKyMon")]
        [HttpGet]
        public IActionResult XoaDangKyMon(string maSV, string maMH)
        {
            var dangKyMonHoc = db.DangKyMonHocs.FirstOrDefault(x => x.MaSv == maSV && x.MaMh == maMH);
            db.DangKyMonHocs.Remove(dangKyMonHoc);
            db.SaveChanges();
            TempData["Message"] = "Đã xóa đăng ký môn";
            return RedirectToAction("SinhVienDangKyMonHoc", "HomeAdmin");
        }

        [Route("XoaGiangVien")]
        [HttpGet]
        public IActionResult XoaGiangVien(string maGV)
        {
            var giangVien = db.GiangViens.FirstOrDefault(x => x.MaGv == maGV);
            db.GiangViens.Remove(giangVien);
            db.SaveChanges();
            TempData["Message"] = "Đã xóa giảng viên";
            return RedirectToAction("GiangVien", "HomeAdmin");
        }

        [Route("XoaSinhVien")]
        [HttpGet]
        public IActionResult XoaSinhVien(string maSV)
        {
            var dangKyMonHocs = db.DangKyMonHocs.Where(x => x.MaSv == maSV).ToList();
            if (dangKyMonHocs.Count > 0)
            {
                TempData["Message"] = "Không xóa được sinh viên này do có dữ liệu ràng buộc, vui lòng thử lại sau.";
                return RedirectToAction("SinhVien", "HomeAdmin");
            }
            var sinhVien = db.SinhViens.FirstOrDefault(x => x.MaSv == maSV);
            db.SinhViens.Remove(sinhVien);
            db.SaveChanges();
            TempData["Message"] = "Đã xóa sinh viên";
            return RedirectToAction("SinhVien", "HomeAdmin");
        }

        [Route("XoaGiaoVu")]
        [HttpGet]
        public IActionResult XoaGiaoVu(string maGiaoVu)
        {
            var giaoVu = db.GiaoVus.FirstOrDefault(x => x.MaGiaoVu == maGiaoVu);
            db.GiaoVus.Remove(giaoVu);
            db.SaveChanges();
            TempData["Message"] = "Đã xóa giáo vụ";
            return RedirectToAction("GiaoVu", "HomeAdmin");
        }

        [Route("XoaMonHoc")]
        [HttpGet]
        public IActionResult XoaMonHoc(string maMH)
        {
            var dangKyMonHocs = db.DangKyMonHocs.Where(x => x.MaMh == maMH).ToList();
            if (dangKyMonHocs.Count > 0)
            {
                TempData["Message"] = "Không xóa được môn học này do có dữ liệu ràng buộc, vui lòng thử lại sau.";
                return RedirectToAction("DanhSachMonHoc", "HomeAdmin");
            }
            var monHoc = db.MonHocs.FirstOrDefault(x => x.MaMh == maMH);
            db.MonHocs.Remove(monHoc);
            db.SaveChanges();
            TempData["Message"] = "Đã xóa môn học";
            return RedirectToAction("DanhSachMonHoc", "HomeAdmin");
        }
        #endregion
    }
}

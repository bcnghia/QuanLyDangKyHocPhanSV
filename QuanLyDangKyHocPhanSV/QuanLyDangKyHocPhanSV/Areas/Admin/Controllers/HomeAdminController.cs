using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;

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

    }
}

using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class QuanLyMonHocController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();
        private readonly ILogger<QuanLyMonHocController> _logger;
        public QuanLyMonHocController(ILogger<QuanLyMonHocController> logger)
        {
            _logger = logger;
        }

        [Route("MonHoc")]
        [HttpGet]
        public IActionResult MonHoc()
        {
            var lstDangKyMonHoc = db.DangKyMonHocs.Where(x => x.MaSv == Request.Cookies["Id"]).ToList();
            ViewBag.DangKyMonHocs = lstDangKyMonHoc;
            ViewBag.MonHocs = db.MonHocs.ToList();

            return View();
        }

        [Route("ListDangKyMonHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ListDangKyMonHoc(List<string> maMH, string maSV)
        {
            if (ModelState.IsValid)
            {
                var dangKyMonHocCu = db.DangKyMonHocs.Where(x => x.MaSv == maSV).ToList();
                db.DangKyMonHocs.RemoveRange(dangKyMonHocCu);
                db.SaveChanges();
                foreach (var ma in maMH)
                {
                    var dangKyMonHoc = new DangKyMonHoc
                    {
                        MaMh = ma,
                        MaSv = maSV,
                        ThoiGianDangKy = DateTime.Now
                    };
                    db.DangKyMonHocs.Add(dangKyMonHoc);
                }

                db.SaveChanges();
                TempData["Message"] = "Đã lưu đăng ký môn";
                return RedirectToAction("MonHoc");
            }

            return View();
        }
    }
}

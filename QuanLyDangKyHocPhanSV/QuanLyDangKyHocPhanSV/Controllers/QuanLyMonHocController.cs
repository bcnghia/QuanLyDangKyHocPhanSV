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
        public IActionResult MonHoc()
        {
            var lstMonHoc = db.MonHocs.ToList();

            return View(lstMonHoc);
        }

        [Route("ListDangKyMonHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ListDangKyMonHoc(List<string> maMH, string maSV)
        {
            if (ModelState.IsValid)
            {
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
                return RedirectToAction("MonHoc");
            }

            return View();
        }
    }
}

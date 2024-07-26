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

        [Route("ThemMonHoc")]
        [HttpGet]
        public IActionResult ThemMonHoc()
        {
            return View();
        }
        [Route("ThemMonHoc")]
        [HttpPost]
        public IActionResult ThemMonHoc(MonHoc monHoc)
        {
            if(ModelState.IsValid)
            {
                db.MonHocs.Add(monHoc);
                db.SaveChanges();
                return RedirectToAction("MonHoc");
            }
            return View(monHoc);
        }

        public IActionResult ListDangKyMonHoc()
        {
            return View();
        }

        public IActionResult Edit()
        {
            return View();
        }

        public IActionResult Delete()
        {
            return View();
        }

        public IActionResult DangKy()
        {
            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class MonHocController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult DanhSachSinhVienDangKy()
        {
            return View();
        }
    }
}

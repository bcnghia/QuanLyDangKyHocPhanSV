using Microsoft.AspNetCore.Mvc;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class QuanLyTaiKhoanController : Controller
    {
        public IActionResult SinhVien()
        {
            return View();
        }

        public IActionResult GiangVien()
        {
            return View();
        }

        public IActionResult GiaoVu()
        {
            return View();
        }
    }
}

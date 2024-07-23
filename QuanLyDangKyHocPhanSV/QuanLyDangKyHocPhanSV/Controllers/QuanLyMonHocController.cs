using Microsoft.AspNetCore.Mvc;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class QuanLyMonHocController : Controller
    {
        public IActionResult MonHoc()
        {
            return View();
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

        public QuanLyMonHocController() 
        {
            
        }
    }
}

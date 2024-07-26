using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class TaiKhoanController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();

        [HttpPost]
        public IActionResult TaiKhoan(string email, string password)
        {
            var user = db.VThongTinDangNhaps.SingleOrDefault(u => u.EmailNguoiDung == email && u.MatKhau == password);

            if (user != null || (email == "admin@gmail.com" && password == "123"))
            {
                CookieOptions option = new CookieOptions
                {
                    Expires = DateTime.Now.AddMinutes(5) // 5 phút xóa cookie web và thoát đăng nhập
                };
                Response.Cookies.Append("UserEmail", email, option);
                Response.Cookies.Append("IsLoggedIn", "true", option);

                ViewBag.Email = email;
                return RedirectToAction("ThongTinTaiKhoan");
            }

            ViewBag.ErrorMessage = "Email hoặc mật khẩu không đúng.";
            return View("DangNhapUI");
        }

        public IActionResult ThongTinTaiKhoan()
        {
            if (Request.Cookies["IsLoggedIn"] != "true")
            {
                return View("DangNhapUI");
            }

            ViewBag.Email = Request.Cookies["UserEmail"];
            return View();
        }

        public IActionResult DangXuat()
        {
            // Xóa cookies đăng nhập
            Response.Cookies.Delete("UserEmail");
            Response.Cookies.Delete("IsLoggedIn");

            // Điều hướng về trang đăng nhập
            return View("DangNhapUI");
        }
    }
}

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
                Response.Cookies.Append("Role", value: user.RoleAccount);

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

            var email = Request.Cookies["UserEmail"];
            ViewBag.Email = email;

            //// Truy xuất thông tin chi tiết của người dùng từ cơ sở dữ liệu
            //var user = db.VThongTinDangNhaps.SingleOrDefault(u => u.EmailNguoiDung == email);
            //if (user != null)
            //{
            //    ViewBag.HoTen = user.HoTen;
            //    ViewBag.GioiTinh = user.GioiTinh;
            //    ViewBag.NgaySinh = user.NgaySinh.ToString("dd/MM/yyyy");
            //    ViewBag.DiaChi = user.DiaChi;
            //    ViewBag.Khoa = user.Khoa;
            //    ViewBag.Lop = user.Lop;
            //}
            //else if (email == "admin@gmail.com")
            //{
            //    // Đối với tài khoản admin
            //    ViewBag.HoTen = "Admin";
            //    ViewBag.GioiTinh = "N/A";
            //    ViewBag.NgaySinh = "N/A";
            //    ViewBag.DiaChi = "N/A";
            //    ViewBag.Khoa = "N/A";
            //    ViewBag.Lop = "N/A";
            //}

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

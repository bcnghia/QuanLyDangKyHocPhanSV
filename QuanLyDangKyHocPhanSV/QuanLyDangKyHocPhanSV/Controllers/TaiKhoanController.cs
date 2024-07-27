using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;
using QuanLyDangKyHocPhanSV.Helpers;
using System.Data;
using System.Text.RegularExpressions;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class TaiKhoanController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();

        [HttpPost]
        public IActionResult TaiKhoan(string email, string password)
        {
            if (email == "admin@gmail.com" && password == "123")
            {
                // Đăng nhập admin
                CookieOptions option = new CookieOptions
                {
                    Expires = DateTime.Now.AddMinutes(5) // 5 phút xóa cookie web và thoát đăng nhập
                };

                Response.Cookies.Append("UserEmail", email, option);
                Response.Cookies.Append("IsLoggedIn", "true", option);
                Response.Cookies.Append("Role", "admin", option);

                ViewBag.Email = email;
                return RedirectToAction("ThongTinTaiKhoan");
            }
            else
            {
                var user = db.VThongTinDangNhaps.SingleOrDefault(u => u.EmailNguoiDung == email && u.MatKhau == password);

                if (user != null)
                {
                    CookieOptions option = new CookieOptions
                    {
                        Expires = DateTime.Now.AddMinutes(5) // 5 phút xóa cookie web và thoát đăng nhập
                    };

                    Response.Cookies.Append("UserEmail", email, option);
                    Response.Cookies.Append("IsLoggedIn", "true", option);
                    Response.Cookies.Append("Role", user.RoleAccount, option);

                    ViewBag.Email = email;
                    return RedirectToAction("ThongTinTaiKhoan");
                }
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
            var role = Request.Cookies["Role"];
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

        // Tạo View cho Quên mật khẩu và chức năng của nó ở đây
        [HttpGet]
        public IActionResult QuenMatKhau()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult QuenMatKhau(string email)
        {
            // Biểu thức kiểm tra đuôi email
            string validEmailPattern = @"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$";

            // Kiểm tra cú pháp email
            if (!Regex.IsMatch(email, validEmailPattern))
            {
                ViewBag.ErrorMessage = "Email không hợp lệ";
                return View();
            }

            // Tạo mã reset password 
            string resetCode = Guid.NewGuid().ToString();

            // Gửi email
            try
            {
                EmailHelper emailHelper = new EmailHelper();
                string resetUrl = Url.Action("ResetPassword", "TaiKhoan", new { code = resetCode }, protocol: Request.Scheme);
                emailHelper.SendEmail(email, "Reset Password", $"Click vào <a href='{resetUrl}'>đây</a> để reset password.");

                ViewBag.SuccessMessage = "Gửi mail thành công";
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Có lỗi xảy ra: " + ex.Message;
            }

            return View();
        }

        [HttpGet]
        public IActionResult ResetPassword(string code)
        {
            if (string.IsNullOrEmpty(code) || !IsValidResetCode(code))
            {
                ViewBag.ErrorMessage = "Mã reset password không hợp lệ hoặc đã hết hạn.";
                return View();
            }

            // Hiển thị form để nhập mật khẩu mới
            ViewBag.ResetCode = code;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ResetPassword(string code, string newPassword)
        {
            // Kiểm tra mã reset password
            if (string.IsNullOrEmpty(code) || !IsValidResetCode(code))
            {
                ViewBag.ErrorMessage = "Mã reset password không hợp lệ hoặc đã hết hạn.";
                return View();
            }
            ViewBag.SuccessMessage = "Đặt lại mật khẩu thành công.";
            return View();
        }

        private bool IsValidResetCode(string code)
        {
            // Logic kiểm tra mã reset password (giả định)
            return true;
        }


        public IActionResult DangXuat()
        {
            // Xóa cookies đăng nhập
            Response.Cookies.Delete("UserEmail");
            Response.Cookies.Delete("IsLoggedIn");
            Response.Cookies.Delete("Role");

            // Điều hướng về trang đăng nhập
            return View("DangNhapUI");
        }
    }
}

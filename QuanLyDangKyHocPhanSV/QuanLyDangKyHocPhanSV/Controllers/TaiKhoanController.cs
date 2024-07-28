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

        public IActionResult ThongTinTaiKhoan()
        {
            if (HttpContext.Session.GetString("IsLoggedIn") != "true")
            {
                return View("DangNhap");
            }

            var email = HttpContext.Session.GetString("UserEmail");
            var role = HttpContext.Session.GetString("Role");
            ViewBag.Email = email;

            return View();
        }

        [HttpPost]
        public IActionResult DangNhap(string id, string password)
        {

            if (HttpContext.Session.GetString("Id") == null)
            {
                var user = db.VThongTinDangNhaps.SingleOrDefault(u => u.Id == id && u.MatKhau == password);
                if (user != null)
                {
                    HttpContext.Session.SetString("UserEmail", user.EmailNguoiDung.ToString());
                    HttpContext.Session.SetString("Id", user.Id.ToString());
                    HttpContext.Session.SetString("Role", user.RoleAccount.ToString());
                    HttpContext.Session.SetString("IsLoggedIn", "true");
                    return RedirectToAction("Index", "Home");
                }
            }
            TempData["Message"] = "Mã sinh viên hoặc mật khẩu không chính xác!";
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
            HttpContext.Session.Clear();

            // Điều hướng về trang đăng nhập
            return View("DangNhap");
        }
    }
}

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
            dynamic thongTinTaiKhoan;
            string id = HttpContext.Session.GetString("Id");
            if (HttpContext.Session.GetString("Role") == "student")
            {
                thongTinTaiKhoan = db.SinhViens.SingleOrDefault(sv => sv.MaSv == id);
            }
            else if (HttpContext.Session.GetString("Role") == "teacher")
            {
                thongTinTaiKhoan = db.GiangViens.SingleOrDefault(gv=>gv.MaGv == id);
            }
            else
            {
                thongTinTaiKhoan = db.GiaoVus.SingleOrDefault(giaoVu=>giaoVu.MaGiaoVu == id);
            }

            ViewBag.ThongTinTaiKhoan = thongTinTaiKhoan;
            return View();
        }

        [HttpPost]
        public IActionResult DangNhap(string emailOrId, string password)
        {

            if (HttpContext.Session.GetString("Id") == null)
            {
                var user = db.VThongTinDangNhaps.SingleOrDefault(u =>
                ( u.EmailNguoiDung == emailOrId || u.Id == emailOrId) && u.MatKhau == password);
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

        public IActionResult DangXuat()
        {
            HttpContext.Session.Clear();
            return View("DangNhap");
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
            HttpContext.Session.SetString("UserEmail", email);
            var checkAccount = db.VThongTinDangNhaps.SingleOrDefault(check => check.EmailNguoiDung == HttpContext.Session.GetString("UserEmail"));
            if (checkAccount != null)
            {

                // Gửi email
                try
                {
                    EmailHelper emailHelper = new EmailHelper();
                    string resetUrl = Url.Action("ResetPassword", "TaiKhoan", new { code = resetCode }, protocol: Request.Scheme);
                    emailHelper.SendEmail(email, "Reset Password", $"Click vào <a href='{resetUrl}'>đây</a> để reset password.");

                    TempData["Message"] = "Gửi mail thành công";
                }
                catch (Exception ex)
                {
                    TempData["Message"] = "Có lỗi xảy ra: " + ex.Message;
                }
                return View();
            }

            TempData["Message"] = "Không tìm thấy tài khoản";
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
            var account = db.VThongTinDangNhaps.SingleOrDefault(check => check.EmailNguoiDung == HttpContext.Session.GetString("UserEmail"));
            if (account!=null)
            {
                switch (account.RoleAccount)
                {
                    case ("student"):
                        var sinhVien = db.SinhViens.SingleOrDefault(sv => sv.MaSv == account.Id);
                        sinhVien.MatKhau = newPassword;
                        db.Update(sinhVien);
                        break;
                    case ("teacher"):
                        var giangVien = db.GiangViens.SingleOrDefault(gv => gv.MaGv == account.Id);
                        giangVien.MatKhau = newPassword;
                        db.Update(giangVien);
                        break;
                    default:
                        var giaoVu = db.GiaoVus.SingleOrDefault(giaoVu => giaoVu.MaGiaoVu == account.Id);
                        giaoVu.MatKhau = newPassword;
                        db.Update(giaoVu);
                        break;
                }
            }
            db.SaveChanges();
            
            ViewBag.SuccessMessage = "Đặt lại mật khẩu thành công.";
            return View();
        }

        private bool IsValidResetCode(string code)
        {
            // Logic kiểm tra mã reset password (giả định)
            return true;
        }
    }
}

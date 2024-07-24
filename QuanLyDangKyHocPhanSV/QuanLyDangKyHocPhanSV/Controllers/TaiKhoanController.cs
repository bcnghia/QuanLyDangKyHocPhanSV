using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class TaiKhoanController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();
        // Phương thức POST cho form đăng nhập
        [HttpPost]
        public IActionResult TaiKhoan(string email, string password)
        {
            var user = db.VThongTinDangNhaps.SingleOrDefault(u => u.EmailNguoiDung == email && u.MatKhau == password);

            // Thực hiện các thao tác đăng nhập
            //if (email == "admin@gmail.com" && password == "123")
            // dùng tạm tài khoản trong trường hợp lỡ database có vấn đề
            if (user!=null || (email == "admin@gmail.com" && password == "123"))
            {
                // Đăng nhập thành công, lưu thông tin vào cookies
                CookieOptions option = new CookieOptions();
                // set thời gian mà tài khoản sẽ lưu tạm thời trong cookie, sau đó nó sẽ tự xóa
                option.Expires = DateTime.Now.AddMinutes(5);
                Response.Cookies.Append("UserEmail", email, option);
                Response.Cookies.Append("IsLoggedIn", "true", option);

                // Điều hướng về trang tài khoản
                ViewBag.Email = email;
                return RedirectToAction("ThongTinTaiKhoan");
            }

            // Đăng nhập thất bại
            ViewBag.ErrorMessage = "Email hoặc mật khẩu không đúng.";
            return View("DangNhapUI");
        }

        public IActionResult ThongTinTaiKhoan()
        {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            if (Request.Cookies["IsLoggedIn"] != "true")
            {
                // Chưa đăng nhập, điều hướng về trang đăng nhập
                return View("DangNhapUI");
            }

            // Đã đăng nhập, hiển thị trang tài khoản
            ViewBag.Email = Request.Cookies["UserEmail"];
            return View("ThongTinTaiKhoan");
        }


    }
}

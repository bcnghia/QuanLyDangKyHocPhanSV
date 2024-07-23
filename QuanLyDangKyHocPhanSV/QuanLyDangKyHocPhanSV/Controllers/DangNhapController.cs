using Microsoft.AspNetCore.Mvc;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class DangNhapController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        // Phương thức POST cho form đăng nhập
        [HttpPost]
        public IActionResult TaiKhoan(string email, string password)
        {
            // Thực hiện các thao tác đăng nhập ở đây
            // Ví dụ: Kiểm tra thông tin đăng nhập, xác thực người dùng, v.v.

            // Sau khi đăng nhập thành công, điều hướng về trang chủ
            return RedirectToAction("Index", "Home");
        }
    }
}

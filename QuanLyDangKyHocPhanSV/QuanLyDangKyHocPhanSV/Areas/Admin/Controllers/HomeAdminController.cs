using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;

namespace QuanLyDangKyHocPhanSV.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }

        [Route("danhsachmonhoc")]
        public IActionResult DanhSachMonHoc()
        {
            var lstMonHoc = db.MonHocs.ToList();
            return View(lstMonHoc);
        }
    }
}

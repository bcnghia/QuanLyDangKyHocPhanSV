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

        [Route("giangvien")]
        public IActionResult GiangVien()
        {
            var lstGiangVien = db.GiangViens.ToList();
            return View(lstGiangVien);
        }

        [Route("sinhvien")]
        public IActionResult SinhVien()
        {
            var lstSinhVien = db.SinhViens.ToList();
            return View(lstSinhVien);
        }

        [Route("giaovu")]
        public IActionResult GiaoVu()
        {
            var lstGiaoVu = db.GiaoVus.ToList();
            return View(lstGiaoVu);
        }

        [Route("sinhviendangkymonhoc")]
        public IActionResult SinhVienDangKyMonHoc()
        {
            var lstSinhVienDangKyMonHoc = db.VThongTinDangKyMonHocs.ToList();
            return View(lstSinhVienDangKyMonHoc);
        }
    }
}

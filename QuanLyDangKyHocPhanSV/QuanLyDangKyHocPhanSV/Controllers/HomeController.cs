using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Models;
using System.Diagnostics;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Lop()
        {
            return View();
        }

        public IActionResult Download()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult DownloadSetup()
        {
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/files/setup.exe");
            var fileBytes = System.IO.File.ReadAllBytes(filePath);
            var fileName = "setup.exe";
            return File(fileBytes, "application/octet-stream", fileName);
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;
using QuanLyDangKyHocPhanSV.Models.Authentication;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Org.BouncyCastle.Crypto.Engines;
using SelectPdf;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class QuanLyMonHocController : Controller
    {
        QLDKHocPhanContext db = new QLDKHocPhanContext();
        private readonly ILogger<QuanLyMonHocController> _logger;
        private readonly IRazorViewEngine _viewEngine;
        private readonly ITempDataProvider _tempDataProvider;
        private readonly IServiceProvider _serviceProvider;
        public QuanLyMonHocController(ILogger<QuanLyMonHocController> logger, IRazorViewEngine viewEngine, ITempDataProvider tempDataProvider, IServiceProvider serviceProvider)
        {
            _logger = logger;
            _viewEngine = viewEngine;
            _tempDataProvider = tempDataProvider;
            _serviceProvider = serviceProvider;
        }

        [Route("MonHoc")]
        [HttpGet]
        [Authentication]
        public IActionResult MonHoc()
        {
            var lstDangKyMonHoc = db.DangKyMonHocs.Where(x => x.MaSv == HttpContext.Session.GetString("Id")).ToList();
            ViewBag.DangKyMonHocs = lstDangKyMonHoc;
            ViewBag.MonHocs = db.MonHocs.ToList();

            return View();
        }

        [Route("ListDangKyMonHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ListDangKyMonHoc(List<string> maMH, string maSV)
        {
            if (ModelState.IsValid)
            {
                var dangKyMonHocCu = db.DangKyMonHocs.Where(x => x.MaSv == maSV).ToList();
                db.DangKyMonHocs.RemoveRange(dangKyMonHocCu);
                db.SaveChanges();
                foreach (var ma in maMH)
                {
                    var dangKyMonHoc = new DangKyMonHoc
                    {
                        MaMh = ma,
                        MaSv = maSV,
                        ThoiGianDangKy = DateTime.Now
                    };
                    db.DangKyMonHocs.Add(dangKyMonHoc);
                }

                db.SaveChanges();
                TempData["Message"] = "Đã lưu đăng ký môn";
                return RedirectToAction("MonHoc");
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ExportPdf()
        {
            var monHocs = db.MonHocs.ToList();
            var htmlContent = RenderViewToString("QuanLyMonHoc/DanhSachMonHocTemplate", monHocs); // Ensure this name matches the actual view name

            HtmlToPdf converter = new HtmlToPdf();
            converter.Options.PdfPageSize = PdfPageSize.A4;
            converter.Options.PdfPageOrientation = PdfPageOrientation.Portrait;
            converter.Options.MarginLeft = 10;
            converter.Options.MarginRight = 10;
            converter.Options.MarginTop = 20;
            converter.Options.MarginBottom = 20;

            PdfDocument doc = converter.ConvertHtmlString(htmlContent);

            var pdfBytes = doc.Save();
            doc.Close();

            return File(pdfBytes, "application/pdf", "DanhSachMonHoc_DangKy.pdf");
        }

        private string RenderViewToString(string viewName, object model)
        {
            var httpContext = new DefaultHttpContext { RequestServices = _serviceProvider };
            var actionContext = new ActionContext(httpContext, new RouteData(), new ActionDescriptor());

            using (var sw = new StringWriter())
            {
                var viewResult = _viewEngine.FindView(actionContext, viewName, false);

                if (viewResult.View == null)
                {
                    throw new ArgumentNullException($"View {viewName} not found");
                }

                var viewDictionary = new ViewDataDictionary(new EmptyModelMetadataProvider(), new ModelStateDictionary())
                {
                    Model = model
                };

                var tempData = new TempDataDictionary(actionContext.HttpContext, _tempDataProvider);

                var viewContext = new ViewContext(
                    actionContext,
                    viewResult.View,
                    viewDictionary,
                    tempData,
                    sw,
                    new HtmlHelperOptions()
                );

                var t = viewResult.View.RenderAsync(viewContext);
                t.Wait();

                return sw.GetStringBuilder().ToString();
            }
        }
    }
}

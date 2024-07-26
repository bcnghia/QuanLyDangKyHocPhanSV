using Microsoft.AspNetCore.Mvc;
using QuanLyDangKyHocPhanSV.Data;
using QuanLyDangKyHocPhanSV.Models;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace QuanLyDangKyHocPhanSV.Controllers
{
    public class DangKyMonHocController : Controller
    {
        private readonly QLDKHocPhanContext _context;

        public DangKyMonHocController(QLDKHocPhanContext context)
        {
            _context = context;
        }

        public IActionResult ListDangKyMonHoc(string maLop = null, string maSV = null, string maGV = null, string tenGV = null, string maMH = null, string tenMH = null)
        {
            var sinhVienDangKyMonHocs = new List<VThongTinDangKyMonHoc>();

            using (var connection = _context.Database.GetDbConnection() as SqlConnection)
            {
                using (var command = new SqlCommand("DanhSachSinhVienDangKyMon", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MaLop", (object)maLop ?? DBNull.Value);
                    command.Parameters.AddWithValue("@MaSV", (object)maSV ?? DBNull.Value);
                    command.Parameters.AddWithValue("@MaGV", (object)maGV ?? DBNull.Value);
                    command.Parameters.AddWithValue("@TenGV", (object)tenGV ?? DBNull.Value);
                    command.Parameters.AddWithValue("@MaMH", (object)maMH ?? DBNull.Value);
                    command.Parameters.AddWithValue("@TenMH", (object)tenMH ?? DBNull.Value);

                    connection.Open();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var item = new VThongTinDangKyMonHoc
                            {
                                MaLop = reader["MaLop"].ToString(),
                                MaSV = reader["MaSV"].ToString(),
                                MaGV = reader["MaGV"].ToString(),
                                TenGV = reader["TenGV"].ToString(),
                                MaMH = reader["MaMH"].ToString(),
                                TenMH = reader["TenMH"].ToString(),
                                SoTiet = reader["SoTiet"] != DBNull.Value ? Convert.ToInt32(reader["SoTiet"]) : 0,
                                SoTinChi = reader["SoTinChi"] != DBNull.Value ? Convert.ToInt32(reader["SoTinChi"]) : 0
                            };
                            sinhVienDangKyMonHocs.Add(item);
                        }
                    }
                }
            }
            ViewBag.RecordCount = sinhVienDangKyMonHocs.Count;
            return View(sinhVienDangKyMonHocs);
        }
    }
}

using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class VThongTinDangKyMonHoc
{
    public string MaSv { get; set; } = null!;

    public string TenSv { get; set; } = null!;

    public string MaMh { get; set; } = null!;

    public string TenMh { get; set; } = null!;

    public int SoTiet { get; set; }

    public int SoTinChi { get; set; }

    public DateTime? ThoiGianDangKy { get; set; }
}

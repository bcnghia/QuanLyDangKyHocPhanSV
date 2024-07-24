using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class VThongTinLopHoc
{
    public string MaLop { get; set; } = null!;

    public string? MaGv { get; set; }

    public string TenGv { get; set; } = null!;

    public string? MaMh { get; set; }

    public string TenMh { get; set; } = null!;

    public int SoTiet { get; set; }

    public string? ThoiKhoaBieu { get; set; }
}

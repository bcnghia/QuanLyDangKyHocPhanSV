using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class Lop
{
    public string MaLop { get; set; } = null!;

    public string? MaMh { get; set; }

    public string? MaGv { get; set; }

    public virtual GiangVien? MaGvNavigation { get; set; }

    public virtual MonHoc? MaMhNavigation { get; set; }
}

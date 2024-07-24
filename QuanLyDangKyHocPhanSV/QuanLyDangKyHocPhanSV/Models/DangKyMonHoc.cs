using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class DangKyMonHoc
{
    public string MaMh { get; set; } = null!;

    public string MaSv { get; set; } = null!;

    public DateTime? ThoiGianDangKy { get; set; }

    public virtual MonHoc MaMhNavigation { get; set; } = null!;

    public virtual SinhVien MaSvNavigation { get; set; } = null!;
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class MonHoc
{
    public string MaMh { get; set; } = null!;

    public string TenMh { get; set; } = null!;

    public int SoTiet { get; set; }

    public int SoTinChi { get; set; }

    public string? ThoiKhoaBieu { get; set; }

    public virtual ICollection<DangKyMonHoc> DangKyMonHocs { get; set; } = new List<DangKyMonHoc>();

    public virtual ICollection<Lop> Lops { get; set; } = new List<Lop>();
}

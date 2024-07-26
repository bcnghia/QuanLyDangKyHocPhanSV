using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class MonHoc
{
    [Display(Name = "Mã Môn Học")]
    public string MaMh { get; set; } = null!;

    [Display(Name = "Tên Môn Học")]
    public string TenMh { get; set; } = null!;

    [Display(Name = "Số Tiết")]
    public int SoTiet { get; set; }

    [Display(Name = "Số Tín Chỉ")]
    public int SoTinChi { get; set; }

    [Display(Name = "Thời Khóa Biểu")]
    public string? ThoiKhoaBieu { get; set; }

    public virtual ICollection<DangKyMonHoc> DangKyMonHocs { get; set; } = new List<DangKyMonHoc>();

    public virtual ICollection<Lop> Lops { get; set; } = new List<Lop>();
}

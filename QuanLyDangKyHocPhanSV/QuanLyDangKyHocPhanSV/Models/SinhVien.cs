using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class SinhVien
{
    public string MaSv { get; set; } = null!;

    public string TenSv { get; set; } = null!;

    public DateOnly NgaySinh { get; set; }

    public byte GioiTinh { get; set; }

    public string? Email { get; set; }

    public string? Khoa { get; set; }

    public string? Lop { get; set; }

    public string? MatKhau { get; set; }

    public string? RoleAccount { get; set; }

    public virtual ICollection<DangKyMonHoc> DangKyMonHocs { get; set; } = new List<DangKyMonHoc>();

    public virtual RoleAccount? RoleAccountNavigation { get; set; }
}

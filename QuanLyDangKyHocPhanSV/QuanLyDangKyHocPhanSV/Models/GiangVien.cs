using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class GiangVien
{
    public string MaGv { get; set; } = null!;

    public string TenGv { get; set; } = null!;

    public DateOnly NgaySinh { get; set; }

    public byte GioiTinh { get; set; }

    public string? Email { get; set; }

    public string? HocHam { get; set; }

    public string? MatKhau { get; set; }

    public string? RoleAccount { get; set; }

    public virtual ICollection<Lop> Lops { get; set; } = new List<Lop>();

    public virtual RoleAccount? RoleAccountNavigation { get; set; }
}

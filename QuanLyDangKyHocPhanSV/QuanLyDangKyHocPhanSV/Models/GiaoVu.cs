using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class GiaoVu
{
    public string MaGiaoVu { get; set; } = null!;

    public string TenGiaoVu { get; set; } = null!;

    public DateOnly NgaySinh { get; set; }

    public byte GioiTinh { get; set; }

    public string? Email { get; set; }

    public string? MatKhau { get; set; }

    public string? RoleAccount { get; set; }

    public virtual RoleAccount? RoleAccountNavigation { get; set; }
}

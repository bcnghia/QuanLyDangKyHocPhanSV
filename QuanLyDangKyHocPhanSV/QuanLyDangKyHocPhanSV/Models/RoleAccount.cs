using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class RoleAccount
{
    public string TenRole { get; set; } = null!;

    public virtual ICollection<GiangVien> GiangViens { get; set; } = new List<GiangVien>();

    public virtual ICollection<GiaoVu> GiaoVus { get; set; } = new List<GiaoVu>();

    public virtual ICollection<SinhVien> SinhViens { get; set; } = new List<SinhVien>();
}

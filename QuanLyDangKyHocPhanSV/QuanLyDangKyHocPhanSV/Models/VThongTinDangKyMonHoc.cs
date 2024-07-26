using System;
using System.Collections.Generic;

namespace QuanLyDangKyHocPhanSV.Models;

public partial class VThongTinDangKyMonHoc
{
	// Chổ mới thêm để gọi vào DangKyMonHocController 
	public string MaLop { get; set; }
	public string MaGV { get; set; }
	public string TenGV { get; set; }
	public int SoTiet { get; set; }
	public int SoTinChi { get; set; } 


	// Chổ cũ
	public string MaSV { get; set; } = null!;
    public string TenSV { get; set; } = null!;
    public string MaMH { get; set; } = null!;
    public string TenMH { get; set; } = null!;



    

    public DateTime? ThoiGianDangKy { get; set; }
}

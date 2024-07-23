using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class DangKyMonHoc
    {
        [ForeignKey("MonHoc")]
        [Column(TypeName = "varchar(7)")]
        public string MaMH { get; set; }

        [ForeignKey("SinhVien")]
        [Column(TypeName = "varchar(8)")]
        public string MaSV { get; set; }

        public DateTime ThoiGianDangKy { get; set; } = DateTime.Now; // Gán giá trị mặc định là thời gian hiện tại
    }
}

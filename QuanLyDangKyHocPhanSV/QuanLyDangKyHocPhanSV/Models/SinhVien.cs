using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class SinhVien
    {
        [Key]
        public string MaSV { get; set; }

        [StringLength(120)]
        public string TenSV { get; set; }
        public DateTime NgaySinh { get; set; }
        public byte GioiTinh { get; set; } // Tinyint tương đương với byte
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string Khoa { get; set; }
        public string MatKhau { get; set; }

        [ForeignKey("Lop")]
        public string MaLop { get; set; }

        [ForeignKey("GiaoVu")]
        public string MaGiaoVu { get; set; }
    }

}

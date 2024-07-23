using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class SinhVien
    {
        [Key]
        [StringLength(8)]
        public string MaSV { get; set; }

        [StringLength(120)]
        public string TenSV { get; set; }

        public DateTime NgaySinh { get; set; }

        public byte GioiTinh { get; set; } // Tinyint tương đương với byte

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Khoa { get; set; }
        [StringLength(50)]
        public string Lop { get; set; }

        [StringLength(50)]
        public string MatKhau { get; set; }

        [ForeignKey("RoleAccount")]
        [StringLength(50)]
        public string RoleAccount { get; set; } = "student";
    }

}

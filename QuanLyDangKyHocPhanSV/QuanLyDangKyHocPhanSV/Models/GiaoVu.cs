using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class GiaoVu
    {
        [Key]
        [StringLength(8)]
        public string MaGiaoVu { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string TenGiaoVu { get; set; }

        public DateTime NgaySinh { get; set; }

        public byte GioiTinh { get; set; }

        [Column(TypeName = "varchar(50)")]
        public string Email { get; set; }

        [Column(TypeName = "varchar(50)")]
        public string MatKhau { get; set; }

        [ForeignKey("RoleAccount")]
        [StringLength(50)]
        public string RoleAccount { get; set; } = "admin";
    }
}

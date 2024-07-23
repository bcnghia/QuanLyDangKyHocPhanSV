using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class Lop
    {
        [Key]
        [StringLength(50)]
        public string MaLop { get; set; }

        [ForeignKey("MonHoc")]
        [Column(TypeName = "varchar(7)")]
        public string MaMH { get; set; }

        [ForeignKey("GiangVien")]
        [Column(TypeName = "varchar(8)")]
        public string MaGV { get; set; }
    }
}

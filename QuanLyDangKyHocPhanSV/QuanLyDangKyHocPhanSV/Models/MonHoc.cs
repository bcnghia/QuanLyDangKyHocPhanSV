using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class MonHoc
    {
        [Key]
        [StringLength(7)]
        public string MaMH { get; set; }

        [Column(TypeName = "nvarchar(120)")]
        public string TenMH { get; set; }

        public int SoTiet { get; set; }

        public int SoTinChi { get; set; }

        [Column(TypeName = "nvarchar(300)")]
        public string ThoiKhoaBieu { get; set; }
    }
}

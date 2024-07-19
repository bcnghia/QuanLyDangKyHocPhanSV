using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class Lop
    {
        [Key]
        public string MaLop { get; set; }

        public string MaMH { get; set; }
        public string TrangThai{ get;set; }
        [ForeignKey("GiangVien")]
        public string MaGV { get; set; }


    }
}

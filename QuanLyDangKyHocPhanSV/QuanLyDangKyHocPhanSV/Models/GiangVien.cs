using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class GiangVien
    {
        [Key]
        public string MaGV { get; set; }
        public string TenGV { get; set; }
        public DateTime NgaySinh { get; set; }
        public string DiaChi { get; set; }
        public byte GioiTinh { get; set; }
        public string Email { get; set; }
        public string HocHam { get; set; }
        public string TinhTrang { get; set; }
        public string MatKhau { get; set; }
        [ForeignKey("GiaoVu")]
        public string MaGiaoVu { get; set; }


    }
}

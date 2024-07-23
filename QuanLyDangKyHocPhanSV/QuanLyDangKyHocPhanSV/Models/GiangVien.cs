﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyDangKyHocPhanSV.Models
{
    public class GiangVien
    {
        [Key]
        [StringLength(8)]
        public string MaGV { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string TenGV { get; set; }

        public DateTime NgaySinh { get; set; }

        public byte GioiTinh { get; set; }

        [Column(TypeName = "varchar(50)")]
        public string Email { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string HocHam { get; set; }

        [Column(TypeName = "varchar(50)")]
        public string MatKhau { get; set; }

        [ForeignKey("RoleAccount")]
        [StringLength(50)]
        public string RoleAccount { get; set; } = "teacher";
    }
}

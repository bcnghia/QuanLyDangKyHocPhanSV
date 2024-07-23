using Microsoft.EntityFrameworkCore;

namespace QuanLyDangKyHocPhanSV.Services
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }
    }
}

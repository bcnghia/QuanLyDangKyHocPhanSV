using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using QuanLyDangKyHocPhanSV.Models;

namespace QuanLyDangKyHocPhanSV.Data;

public partial class QLDKHocPhanContext : DbContext
{
    public QLDKHocPhanContext()
    {
    }

    public QLDKHocPhanContext(DbContextOptions<QLDKHocPhanContext> options)
        : base(options)
    {
    }

    public virtual DbSet<DangKyMonHoc> DangKyMonHocs { get; set; }

    public virtual DbSet<GiangVien> GiangViens { get; set; }

    public virtual DbSet<GiaoVu> GiaoVus { get; set; }

    public virtual DbSet<Lop> Lops { get; set; }

    public virtual DbSet<MonHoc> MonHocs { get; set; }

    public virtual DbSet<RoleAccount> RoleAccounts { get; set; }

    public virtual DbSet<SinhVien> SinhViens { get; set; }

    public virtual DbSet<VThongTinDangKyMonHoc> VThongTinDangKyMonHocs { get; set; }

    public virtual DbSet<VThongTinDangNhap> VThongTinDangNhaps { get; set; }

    public virtual DbSet<VThongTinLopHoc> VThongTinLopHocs { get; set; }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var config = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();

        // Lấy chuỗi kết nối từ file cấu hình
        var connectionString = config.GetConnectionString("DefaultConnection");
        optionsBuilder.UseSqlServer(connectionString);
    }
    //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<DangKyMonHoc>(entity =>
        {
            entity.HasKey(e => new { e.MaMh, e.MaSv }).HasName("PK__DangKyMo__95578F5866C2CEA8");

            entity.ToTable("DangKyMonHoc");

            entity.Property(e => e.MaMh)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasColumnName("MaMH");
            entity.Property(e => e.MaSv)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("MaSV");
            entity.Property(e => e.ThoiGianDangKy)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.MaMhNavigation).WithMany(p => p.DangKyMonHocs)
                .HasForeignKey(d => d.MaMh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DangKyMonH__MaMH__5AEE82B9");

            entity.HasOne(d => d.MaSvNavigation).WithMany(p => p.DangKyMonHocs)
                .HasForeignKey(d => d.MaSv)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DangKyMonH__MaSV__5BE2A6F2");
        });

        modelBuilder.Entity<GiangVien>(entity =>
        {
            entity.HasKey(e => e.MaGv).HasName("PK__GiangVie__2725AEF3ACBB12EE");

            entity.ToTable("GiangVien");

            entity.Property(e => e.MaGv)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("MaGV");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.HocHam).HasMaxLength(50);
            entity.Property(e => e.MatKhau)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleAccount)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TenGv)
                .HasMaxLength(50)
                .HasColumnName("TenGV");

            entity.HasOne(d => d.RoleAccountNavigation).WithMany(p => p.GiangViens)
                .HasForeignKey(d => d.RoleAccount)
                .HasConstraintName("FK__GiangVien__RoleA__4E88ABD4");
        });

        modelBuilder.Entity<GiaoVu>(entity =>
        {
            entity.HasKey(e => e.MaGiaoVu).HasName("PK__GiaoVu__C972AE3031566FE5");

            entity.ToTable("GiaoVu");

            entity.Property(e => e.MaGiaoVu)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MatKhau)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleAccount)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TenGiaoVu).HasMaxLength(50);

            entity.HasOne(d => d.RoleAccountNavigation).WithMany(p => p.GiaoVus)
                .HasForeignKey(d => d.RoleAccount)
                .HasConstraintName("FK__GiaoVu__RoleAcco__4BAC3F29");
        });

        modelBuilder.Entity<Lop>(entity =>
        {
            entity.HasKey(e => e.MaLop).HasName("PK__Lop__3B98D273257173D5");

            entity.ToTable("Lop");

            entity.Property(e => e.MaLop)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MaGv)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("MaGV");
            entity.Property(e => e.MaMh)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasColumnName("MaMH");

            entity.HasOne(d => d.MaGvNavigation).WithMany(p => p.Lops)
                .HasForeignKey(d => d.MaGv)
                .HasConstraintName("FK__Lop__MaGV__5441852A");

            entity.HasOne(d => d.MaMhNavigation).WithMany(p => p.Lops)
                .HasForeignKey(d => d.MaMh)
                .HasConstraintName("FK__Lop__MaMH__534D60F1");
        });

        modelBuilder.Entity<MonHoc>(entity =>
        {
            entity.HasKey(e => e.MaMh).HasName("PK__MonHoc__2725DFD9B972E621");

            entity.ToTable("MonHoc");

            entity.Property(e => e.MaMh)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasColumnName("MaMH");
            entity.Property(e => e.TenMh)
                .HasMaxLength(120)
                .HasColumnName("TenMH");
            entity.Property(e => e.ThoiKhoaBieu).HasMaxLength(300);
        });

        modelBuilder.Entity<RoleAccount>(entity =>
        {
            entity.HasKey(e => e.TenRole).HasName("PK__RoleAcco__37A723F2D4917860");

            entity.ToTable("RoleAccount");

            entity.Property(e => e.TenRole)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SinhVien>(entity =>
        {
            entity.HasKey(e => e.MaSv).HasName("PK__SinhVien__2725081A80BFFA32");

            entity.ToTable("SinhVien");

            entity.Property(e => e.MaSv)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("MaSV");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Khoa).HasMaxLength(50);
            entity.Property(e => e.Lop)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MatKhau)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleAccount)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TenSv)
                .HasMaxLength(120)
                .HasColumnName("TenSV");

            entity.HasOne(d => d.RoleAccountNavigation).WithMany(p => p.SinhViens)
                .HasForeignKey(d => d.RoleAccount)
                .HasConstraintName("FK__SinhVien__RoleAc__571DF1D5");
        });

        modelBuilder.Entity<VThongTinDangKyMonHoc>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vThongTinDangKyMonHoc");

            entity.Property(e => e.MaMH)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasColumnName("MaMH");
            entity.Property(e => e.MaSV)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("MaSV");
            entity.Property(e => e.TenMH)
                .HasMaxLength(120)
                .HasColumnName("TenMH");
            entity.Property(e => e.TenSV)
                .HasMaxLength(120)
                .HasColumnName("TenSV");
            entity.Property(e => e.ThoiGianDangKy).HasColumnType("datetime");
        });

        modelBuilder.Entity<VThongTinDangNhap>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vThongTinDangNhap");

            entity.Property(e => e.EmailNguoiDung)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MatKhau)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleAccount)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VThongTinLopHoc>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vThongTinLopHoc");

            entity.Property(e => e.MaGv)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("MaGV");
            entity.Property(e => e.MaLop)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MaMh)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasColumnName("MaMH");
            entity.Property(e => e.TenGv)
                .HasMaxLength(50)
                .HasColumnName("TenGV");
            entity.Property(e => e.TenMh)
                .HasMaxLength(120)
                .HasColumnName("TenMH");
            entity.Property(e => e.ThoiKhoaBieu).HasMaxLength(300);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

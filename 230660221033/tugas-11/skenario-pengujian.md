# Skenario Pengujian Fitur Perangkat — Tugas 11
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

| Skenario | Expected Result | Actual Result |
|:---|:---|:---|
| **Fitur berhasil digunakan** (Memilih foto buku berukuran < 5 MB dari galeri/kamera) | Indikator loading muncul sesaat, lalu pratinjau foto tampil di kotak preview beserta informasi nama dan ukuran file. | **Sesuai:** Foto sampul buku berhasil dirender via `Image.memory` dan nama serta ukuran KB/MB muncul di bagian bawah pratinjau. |
| **Pengguna membatalkan aksi** (Menutup dialog file explorer atau menekan tombol kembali kamera) | Aplikasi tidak menganggapnya sebagai error; pratinjau foto sebelumnya tetap bertahan dan muncul notifikasi pembatalan. | **Sesuai:** Ketika dialog pemilihan ditutup tanpa memilih gambar (`XFile == null`), state sebelumnya tetap aman dan muncul `SnackBar` informasi pembatalan. |
| **Permission ditolak** (Akses kamera diblokir pada pengaturan peramban/perangkat) | Aplikasi menangkap `PlatformException`, menampilkan ikon kamera tercoret, pesan instruksi izin, dan tombol **Coba Lagi**. | **Sesuai:** Saat akses kamera diblokir di Chrome, aplikasi menampilkan peringatan *"Izin Akses Ditolak"* dan tombol *Coba Lagi* berfungsi memicu permintaan ulang. |
| **Package atau perangkat menghasilkan error** (Mengunggah gambar berukuran > 5 MB atau perangkat kamera tidak tersedia) | Validasi service melempar exception ukuran/perangkat dan antarmuka menampilkan pesan kegagalan yang jelas. | **Sesuai:** Saat menguji file gambar beresolusi tinggi di atas 5 MB, kotak pratinjau menampilkan pesan error batas ukuran secara informatif. |
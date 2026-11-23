# Analisis Kebutuhan Fitur Perangkat — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

| Komponen Analisis | Keterangan |
|:---|:---|
| **Fitur yang Dipilih** | Kamera dan Galeri (menggunakan package `image_picker`) |
| **Aktor Pengguna** | Relawan petugas perpustakaan dan anggota peminjam buku Panti Baca Ceria. |
| **Tujuan pada Proses Bisnis** | Mendokumentasikan bukti kondisi fisik buku (sampul dan halaman) sebelum transaksi peminjaman disetujui maupun saat pengembalian untuk mencegah sengketa kerusakan buku. |
| **Data Keluaran Fitur** | Objek `HasilPilihanFoto` yang membungkus `XFile` berupa nama file (`String`), path lokal (`String`), biner gambar (`Uint8List`), dan ukuran file (`int` dalam byte). |
| **Permission yang Diperlukan** | • **Android:** `android.permission.CAMERA` dan `READ_MEDIA_IMAGES` (otomatis dikelola oleh plugin `image_picker`).<br>• **Web (Chrome):** Izin akses *Media Devices / Camera* pada pop-up peramban dan dialog *File Explorer* sistem operasi. |
| **Target Platform** | Flutter Web (Google Chrome) dan Android. |
| **Konsekuensi Batal / Ditolak** | • **Dibatalkan (`null`):** Aplikasi tidak menampilkan pesan error merah, melainkan mempertahankan pratinjau foto sebelumnya dan memunculkan pemberitahuan singkat.<br>• **Permission Ditolak:** Aplikasi menangkap `PlatformException` (`camera_access_denied`), menampilkan pesan informatif agar pengguna mengaktifkan izin di pengaturan, serta menyediakan tombol **Coba Lagi**. |
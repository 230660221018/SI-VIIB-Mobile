# Refleksi Tugas 10 — Integrasi Data dan Proses Bisnis
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

1. **Bagian Integrasi Data yang Paling Sulit:**  
   Bagian yang paling menantang adalah menyelaraskan pencocokan relasi data antara daftar transaksi peminjaman (`userId`) dengan daftar profil anggota (`id`) secara efisien tanpa menimbulkan *error* ketika salah satu ID anggota tidak ditemukan. Mengonversi daftar anggota ke dalam struktur `Map` terlebih dahulu di dalam lapisan *service* sangat membantu mempercepat proses penggabungan data.

2. **Cara Menangani Response Kosong atau Error:**  
   Kondisi error jaringan (seperti *timeout* atau tidak ada internet) ditangani menggunakan blok `try-catch` yang mengubah *exception* teknis menjadi pesan ramah pengguna disertai tombol **"Coba Lagi"** untuk memicu pemanggilan ulang. Sementara itu, kondisi data kosong (misalnya saat filter status menghasilkan 0 item) dipisahkan secara eksplisit dari error dengan menampilkan ikon ilustrasi kotak kosong agar pengguna mengetahui bahwa koneksi server normal namun memang belum ada transaksi pada kategori tersebut.

3. **Alasan Pemisahan Service dan Widget:**  
   Memisahkan logika HTTP, eksekusi `Future.wait`, penguraian JSON, dan aturan status bisnis ke dalam `IntegrasiService` membuat kode antarmuka (`main.dart`) tetap bersih, ringkas, dan fokus sepenuhnya pada manajemen tampilan (*state* UI). Jika di kemudian hari alamat endpoint API berubah dari simulasi ke server produksi Panti Baca Ceria, perbaikan cukup dilakukan pada file *service* tanpa menyentuh kode widget sama sekali.

---
Deklarasi penggunaan AI: Tidak ada. Seluruh struktur model relasional, lapisan service `Future.wait`, aturan status proses bisnis, dan dokumentasi integrasi disusun serta diverifikasi secara mandiri oleh penulis.
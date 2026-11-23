# Model Data — Sistem Informasi Pengajuan Peminjaman

Dokumen ini mendefinisikan struktur entitas data utama yang diturunkan dari kebutuhan pengguna pada Tugas 4 untuk mendukung implementasi CRUD lokal pada Tugas 7.

## 1. Daftar Entitas Utama

| Entitas | Field | Tipe Data | Kebutuhan yang Dipenuhi (Tugas 4) | Sumber Nilai |
| :--- | :--- | :--- | :--- | :--- |
| **DataPengajuan** | `id` | `String` | F-01 (Identifikasi unik data untuk operasi CRUD) | Sistem (Generated dari timestamp) |
| | `ruang` | `String` | F-01 (Pengajuan peminjaman ruangan laboratorium) | Form (Input pengguna) |
| | `tanggal` | `String` | F-01 (Jadwal tanggal pelaksanaan peminjaman) | Form (Input pengguna) |
| | `jam` | `String` | F-01 (Waktu atau sesi jam peminjaman) | Form (Input pengguna) |
| | `status` | `String` | F-03 (Melihat status verifikasi pengajuan) | Sistem (Default awal: "menunggu") |

## 2. Penjelasan Sumber Nilai

- **Form (Input pengguna):** Diisi secara langsung oleh mahasiswa melalui antarmuka formulir pengajuan[cite: 6].
- **Sistem:** Dihasilkan secara otomatis oleh logika aplikasi, seperti pembuatan `id` unik menggunakan waktu sistem (`DateTime.now().millisecondsSinceEpoch`) serta penentuan status awal pengajuan[cite: 6].
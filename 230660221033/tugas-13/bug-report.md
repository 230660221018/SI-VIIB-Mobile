# Laporan Bug & Perbaikan (Bug Report) — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

| Bagian | Isi |
|:-------|:----|
| **ID bug** | `BUG-01` |
| **Skenario reproduksi** | 1. Buka halaman form pengajuan peminjaman buku.<br>2. Isi seluruh kolom dengan data valid (`Nama: Yelly Ambarwaty`, `Judul: Bumi Manusia`, `Durasi: 7`).<br>3. Tekan tombol **Simpan Pengajuan** dua kali secara cepat sebelum proses penyimpanan selesai. |
| **Expected result** | Tombol langsung dinonaktifkan setelah ketukan pertama sehingga hanya satu transaksi peminjaman yang masuk ke daftar. |
| **Actual result** | Sebelum perbaikan, fungsi `_simpanPengajuan` tereksekusi dua kali dan menghasilkan dua kartu transaksi `"Bumi Manusia"` yang identik di daftar pengajuan. |
| **Dugaan penyebab** | Tidak ada variabel pengunci status proses (*loading flag*) pada state halaman sehingga properti `onPressed` pada `FilledButton` tetap aktif selama jeda pemrosesan asinkron (`Future.delayed` / HTTP request) berlangsung. |
| **Perbaikan** | Menambahkan variabel boolean `bool _sedangMenyimpan = false;` pada `_HalamanPeminjamanTerujiState`, menambahkan guard `if (_sedangMenyimpan) return;` di awal fungsi `_simpanPengajuan()`, serta mengubah properti tombol menjadi `onPressed: _sedangMenyimpan ? null : _simpanPengajuan`. |
| **Test regresi** | Dijalankan pengujian otomatis `WT-03 (Regresi BUG-01)` pada berkas `test/ceriareads_test.dart` serta skenario manual `TC-05`. Hasilnya tombol berubah menjadi `"Menyimpan..."` (nonaktif) saat ketukan pertama dan hanya 1 data yang tersimpan (`All tests passed!`). |
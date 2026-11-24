## Bug Report

| **Bagian** | **Isi** |
|---|---|
| ID bug | BUG-01 |
| Skenario reproduksi | Menjalankan `flutter test` pada project SIPORA sebelum perbaikan dilakukan. |
| Expected result | Pengujian widget berjalan tanpa error dan seluruh assertion terpenuhi. |
| Actual result | Pengujian widget gagal dengan pesan terkait ListTile dan warna latar atau efek interaksi yang tidak terlihat. |
| Dugaan penyebab | ListTile pada fungsi `_buildMenuProfil()` di `halaman-utama.dart` belum dibungkus widget Material yang sesuai. |
| Perbaikan | Menambahkan widget Material sebagai pembungkus ListTile pada fungsi `_buildMenuProfil()` dengan menyesuaikan warna latar dan radius. |
| Test regresi | Menjalankan kembali `flutter test` setelah perbaikan. Hasilnya `All tests passed!` dan pengujian widget berhasil. |
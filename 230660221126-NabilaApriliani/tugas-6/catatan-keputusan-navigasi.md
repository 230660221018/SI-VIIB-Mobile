# Catatan Keputusan Navigasi dan Interaksi

Dokumen ini mencatat alasan teknis di balik keputusan navigasi, pengiriman data, validasi, dan feedback pada aplikasi.

| Keputusan | Pilihan Anda | Alasan (merujuk IA/kebutuhan) |
|:---|:---|:---|
| **Nama Route** | `/`, `/form`, `/detail` | Mengikuti daftar layar pada Information Architecture (IA) Tugas 5. Penamaan konsisten memudahkan pemeliharaan kode dan penelusuran alur. |
| **Data Antarlayar** | Mengirim objek `DataPengajuan` via `arguments` ke `/detail` | Memenuhi kebutuhan F-03 untuk menampilkan rincian data terpilih secara *read-only*. Penggunaan tipe `is` dan null-check mencegah error runtime bila arguments kosong. |
| **Validator Tiap Field** | Memeriksa input tidak null dan tidak kosong (`value.trim().isEmpty`) | Memenuhi kebutuhan F-01 untuk memastikan data pengajuan valid sebelum diproses dan mencegah data spasi/kosong masuk ke sistem. |
| **Feedback Tiap Aksi** | `SnackBar` setelah tombol Kirim dan pesan validator di bawah field | Memberikan kepastian visual (feedback) kepada pengguna bahwa aksi kirim berhasil atau menunjukkan field mana yang harus diperbaiki. |
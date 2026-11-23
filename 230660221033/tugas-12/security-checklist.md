# Security Checklist Project — CeriaReads (Tugas 12)
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Kelas:** SI-VIIB  

| No. | Risiko atau pemeriksaan | Status | Bukti |
|:---:|:------------------------|:------:|:------|
| 1 | Input wajib divalidasi | Selesai | `lib/utils/form_validator.dart` menolak input kosong pada field nama, email, judul buku, durasi, dan lampiran. |
| 2 | Format input diperiksa | Selesai | Regex email, pengecekan angka bulat durasi (1–14 hari), dan ekstensi file (`.jpg`/`.png`) pada `form_validator.dart`. |
| 3 | HTTPS digunakan untuk data sensitif | Selesai | Seluruh pemanggilan API pada `tugas-9` dan `tugas-10` menggunakan protokol terenkripsi `https://jsonplaceholder.typicode.com`. |
| 4 | Token tidak ditulis pada source code | Selesai | Pemeriksaan manual di seluruh direktori `lib/` memastikan tidak ada *hardcoded* token, API key, maupun kredensial. |
| 5 | Token tidak dicetak pada log | Selesai | Tidak ada pemanggilan `print()` atau `debugPrint()` yang mencetak header otorisasi maupun data sensitif pengguna. |
| 6 | Token dihapus saat logout | Sebagian | Fitur autentikasi login/logout penuh belum diimplementasikan (dijadwalkan pada tahap lanjutan menggunakan `flutter_secure_storage`). |
| 7 | Permission sesuai fitur | Selesai | Pada `tugas-11/dokumen-fitur-perangkat.md`, aplikasi hanya meminta izin akses kamera dan galeri saat tombol unggah foto ditekan (*least privilege*). |
| 8 | Permission ditolak ditangani | Selesai | `tugas-11/lib/services/lampiran_foto_service.dart` menangkap `PlatformException` (`camera_access_denied`) dan menampilkan tombol **Coba Lagi**. |
| 9 | Pesan error tidak membocorkan data | Selesai | Blok `try-catch` pada lapisan service menerjemahkan *exception* teknis menjadi pesan ramah pengguna tanpa menampilkan *stack trace*. |
| 10 | Dependency dan batasan didokumentasikan | Selesai | Tercatat lengkap pada `pubspec.yaml` dan `README.md` di setiap direktori tugas (`tugas-9` hingga `tugas-12`). |
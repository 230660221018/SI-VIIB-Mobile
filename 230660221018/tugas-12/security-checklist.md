# Security Checklist — Tugas 12 (SIPORA)

Domain project: **SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik)**.

| No. | Risiko atau pemeriksaan | Status | Bukti |
|---|---|---|---|
| 1 | Input wajib divalidasi | Selesai | `lib/form-interaksi.dart` menggunakan validator pada formulir untuk memeriksa input wajib sebelum pengajuan diproses. |
| 2 | Format input diperiksa | Selesai | Validasi panjang nama, format NIM, rentang semester, format WhatsApp, dan panjang topik pada `lib/form-interaksi.dart`. |
| 3 | HTTPS digunakan untuk data sensitif | Sebagian | Alur pengajuan utama masih menggunakan simulasi lokal dan belum terhubung dengan backend. Penggunaan HTTPS untuk komunikasi data pada backend belum diterapkan pada alur tersebut. |
| 4 | Token tidak ditulis pada source code | Selesai | Pemeriksaan kode pada alur pengajuan utama menunjukkan belum terdapat penggunaan token autentikasi yang ditanamkan pada proses pengajuan. |
| 5 | Token tidak dicetak pada log | Selesai | Pemeriksaan kode pada alur pengajuan utama terkait penggunaan token dan pencatatan log autentikasi. |
| 6 | Token dihapus saat logout | Belum | Fitur autentikasi token dan logout berbasis backend belum diimplementasikan pada alur pengajuan utama SIPORA. |
| 7 | Permission sesuai fitur | Selesai | `lib/services/dokumen_service.dart` dan fitur pemilihan dokumen digunakan untuk memilih berkas pendukung tanpa meminta izin kamera atau lokasi. |
| 8 | Permission ditolak ditangani | Selesai | SIPORA tidak memerlukan permission kamera atau lokasi pada alur pengajuan. Pemilihan dokumen menggunakan file picker dan pembatalan pemilihan ditangani tanpa mengganggu pengisian formulir. |
| 9 | Pesan error tidak membocorkan data | Selesai | Validasi formulir menampilkan pesan kesalahan kepada pengguna berdasarkan input yang tidak memenuhi ketentuan, tanpa menampilkan informasi teknis backend yang belum digunakan pada alur tersebut. |
| 10 | Dependency dan batasan didokumentasikan | Selesai | `pubspec.yaml` dan dokumentasi Tugas 12 mencantumkan dependency yang digunakan serta batasan keamanan aplikasi. |
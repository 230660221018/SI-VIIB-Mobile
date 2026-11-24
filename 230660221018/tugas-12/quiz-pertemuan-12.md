# Quiz Pertemuan 12 — Validasi dan Keamanan Praktis

**Mata Kuliah:** Pemrograman Aplikasi Bergerak  
**Pertemuan:** 12 | **CPMK:** CPMK-4

## Soal 1 — Validasi Client dan Server

Validasi client dilakukan pada sisi aplikasi pengguna, misalnya Flutter, untuk memeriksa input sebelum dikirim atau diproses. Validasi server dilakukan pada sisi backend untuk memastikan data yang diterima tetap memenuhi aturan sistem. Validasi pada form Flutter tidak cukup untuk melindungi aturan bisnis karena input client dapat dimanipulasi atau pemeriksaan aplikasi dapat dilewati, sehingga server tetap harus melakukan validasi secara mandiri.

## Soal 2 — HTTPS dan Token

Pengiriman token melalui HTTP berisiko menyebabkan token disadap oleh pihak lain ketika data ditransmisikan melalui jaringan. Token yang dicuri dapat digunakan untuk mengakses layanan dengan hak akses pengguna selama token masih berlaku. Perbaikannya adalah menggunakan HTTPS agar komunikasi terenkripsi, menghindari pencatatan token pada log, serta memastikan token dikelola dengan aman.

## Soal 3 — Secure Storage

Token sebaiknya disimpan menggunakan penyimpanan aman platform, seperti Keychain pada iOS atau mekanisme penyimpanan aman berbasis Android, agar risiko token diakses oleh pihak yang tidak berwenang dapat dikurangi. Token tidak boleh ditulis langsung pada source code atau log karena dapat terekspos dan disalahgunakan. Saat pengguna logout, token harus dihapus dari penyimpanan agar tidak dapat digunakan kembali melalui sesi aplikasi tersebut.

## Soal 4 — Permission

Meminta permission kamera saat aplikasi pertama kali dibuka kurang tepat karena pengguna belum tentu membutuhkan fitur foto pada saat itu. Permintaan izin yang terlalu awal dapat mengurangi kepercayaan pengguna dan membuat penggunaan aplikasi terasa mengganggu. Alur yang lebih tepat adalah meminta permission ketika pengguna membuka fitur yang membutuhkan kamera, menjelaskan tujuan penggunaannya, menangani izin yang ditolak, dan menyediakan alternatif jika fitur tidak dapat digunakan.

## Soal 5 — Security Checklist

| No. | Pemeriksaan Keamanan | Bukti |
|---|---|---|
| 1 | Input wajib divalidasi | Validator pada `TextFormField` dan hasil pengujian input kosong. |
| 2 | Format input diperiksa | Validator NIM atau nomor telepon pada kode Flutter. |
| 3 | HTTPS digunakan untuk komunikasi data | Konfigurasi endpoint HTTPS pada kode atau konfigurasi backend. |
| 4 | Token tidak ditulis pada source code | Hasil pemeriksaan source code yang tidak menunjukkan token atau kredensial hardcoded. |
| 5 | Permission sesuai kebutuhan fitur | Konfigurasi permission dan kode permintaan izin perangkat sesuai kebutuhan fitur. |
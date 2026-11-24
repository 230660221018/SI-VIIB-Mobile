# Tugas 12 — Security Checklist dan Validasi Project SIPORA

**Nama:** Intan Kartika  
**NIM:** 230660221018  
**Project:** SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik)

## 1. Deskripsi Project

SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik) merupakan aplikasi Flutter yang digunakan untuk membantu mahasiswa dalam mengajukan surat observasi dan riset akademik. Pada Tugas 12, project dikembangkan dengan penerapan validasi input serta pemeriksaan keamanan praktis pada formulir pengajuan.

## 2. Dependency

Dependency yang digunakan dalam project meliputi:

- `flutter`: Framework pengembangan aplikasi.
- `file_picker`: Digunakan untuk memilih dokumen pendukung pengajuan.

Dependency lainnya mengikuti konfigurasi pada `pubspec.yaml`.

## 3. Cara Menjalankan Project

1. Pastikan Flutter SDK telah terinstal.
2. Buka folder project melalui terminal.
3. Jalankan perintah berikut untuk mengunduh dependency:

   ```bash
   flutter pub get
   ```

4. Periksa kode menggunakan:

   ```bash
   flutter analyze
   ```

5. Jalankan aplikasi pada browser Chrome:

   ```bash
   flutter run -d chrome
   ```

## 4. Target Pengujian

Pengujian dilakukan terhadap validasi input pada formulir pengajuan, meliputi:

- Nama kurang dari 3 karakter.
- NIM mengandung karakter selain angka atau tidak memenuhi batas panjang.
- Semester di luar rentang 1–14.
- Nomor WhatsApp dengan format tidak valid.
- Topik pengajuan kurang dari 5 karakter.

Pengujian dilakukan dengan memasukkan data yang tidak memenuhi ketentuan untuk memastikan formulir menampilkan pesan kesalahan yang sesuai.

## 5. Batasan Keamanan

- Validasi input diterapkan pada sisi client.
- Alur pengajuan utama masih menggunakan simulasi lokal dan belum terhubung dengan backend.
- Validasi server, autentikasi token, otorisasi, dan komunikasi HTTPS pada backend belum diterapkan pada alur pengajuan utama.
- Pemilihan dokumen pendukung menggunakan file picker sesuai kebutuhan fitur.

## 6. Deklarasi Penggunaan AI

AI digunakan sebagai alat bantu dalam memahami konsep validasi input dan keamanan aplikasi.

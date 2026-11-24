# Tugas 11 — Integrasi Fitur Perangkat SIPORA  

## Identitas

- **Nama:** Intan Kartika
- **NIM:** 230660221018

## 1. Deskripsi Proyek

SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik) merupakan aplikasi mobile yang dirancang untuk membantu mahasiswa dalam mengajukan surat observasi dan penelitian akademik kepada pihak fakultas.

Pada Tugas 11, aplikasi dikembangkan dengan mengintegrasikan fitur pemilihan dokumen dari perangkat menggunakan package `file_picker` untuk mendukung penyertaan dokumen pendukung dalam proses pengajuan surat.

## 2. Fitur yang Diimplementasikan

- **Pemilihan Dokumen:** Memilih dokumen pendukung dari perangkat pengguna.
- **Validasi Format:** Mendukung pemilihan dokumen berformat PDF, DOC, dan DOCX.
- **Informasi Dokumen:** Menampilkan nama dokumen yang dipilih pada formulir pengajuan.
- **Integrasi Pengajuan:** Meneruskan informasi nama dokumen ke data pengajuan dan menampilkannya pada halaman Detail Pengajuan.

## 3. Teknologi yang Digunakan

- Flutter
- Dart
- Package `file_picker`
- Flutter Web (Google Chrome)

## 4. Struktur Implementasi

- `lib/form-interaksi.dart` — Mengintegrasikan pemilihan dokumen pada formulir pengajuan.
- `lib/crud-lokal.dart` — Mengelola data pengajuan serta menampilkan informasi dokumen pada detail pengajuan.
- `lib/services/dokumen_service.dart` — Menangani proses pemilihan dokumen melalui service.

## 5. Pengujian

Pengujian dilakukan menggunakan Flutter Web pada Google Chrome dengan skenario:

- Membuka formulir pengajuan.
- Memilih dokumen pendukung.
- Membatalkan proses pemilihan dokumen.
- Memilih kembali dokumen.
- Mengirim pengajuan dengan dokumen pendukung.
- Memeriksa informasi dokumen pada Detail Pengajuan.

## 6. Batasan Implementasi

Fitur pemilihan dokumen pada implementasi ini hanya meneruskan dan menyimpan informasi nama dokumen ke dalam data pengajuan lokal. File belum diunggah ke server maupun disimpan secara permanen.

## 7. Menjalankan Aplikasi

```bash
flutter pub get
flutter run -d chrome
```

## 8. Kesimpulan

Integrasi fitur pemilihan dokumen pada SIPORA berhasil dilakukan untuk mendukung kebutuhan dokumen pendukung dalam pengajuan surat observasi dan penelitian akademik. Implementasi ini menjadi bagian dari pengembangan fitur perangkat pada aplikasi Flutter.

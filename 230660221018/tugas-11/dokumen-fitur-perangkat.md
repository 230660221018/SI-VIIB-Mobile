# Dokumentasi Fitur Perangkat — Tugas 11

## 1. Identitas Project

| Aspek | Keterangan |
|---|---|
| Nama aplikasi | SIPORA |
| Kepanjangan | Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik |
| Framework | Flutter |
| Bahasa | Dart |
| Milestone | M6 — Fitur Perangkat |
| Fitur perangkat | Pemilihan dokumen (File Picker) |
| Package | `file_picker` |

## 2. Latar Belakang dan Tujuan

SIPORA merupakan aplikasi untuk membantu mahasiswa mengajukan surat observasi dan penelitian akademik kepada fakultas. Dalam proses pengajuan, mahasiswa dapat membutuhkan dokumen pendukung seperti proposal penelitian atau berkas administrasi lainnya.

Oleh karena itu, SIPORA mengintegrasikan fitur pemilihan dokumen dari perangkat menggunakan package `file_picker`. Fitur ini memungkinkan mahasiswa memilih dokumen secara langsung dari perangkat untuk melengkapi form pengajuan.

Tujuan fitur ini adalah memudahkan pemilihan dokumen, mengintegrasikan fitur perangkat dengan alur pengajuan, serta menerapkan penanganan pembatalan dan error.

## 3. Analisis Kebutuhan

| Aspek | Keterangan |
|---|---|
| Fitur | Pemilihan dokumen dari perangkat |
| Package | `file_picker` |
| Input | Dokumen dari perangkat pengguna |
| Output | Informasi nama dokumen terpilih |
| Format | PDF, DOC, dan DOCX |
| Pemrosesan | Asynchronous (`Future`, `async/await`) |
| Platform pengujian | Flutter Web – Google Chrome |
| Penanganan kondisi | Pembatalan, penggantian, penghapusan, dan error |

## 4. Implementasi Fitur

Fitur pemilihan dokumen ditempatkan pada bagian Dokumen Pendukung di form pengajuan surat SIPORA. Proses pemilihan dokumen dipisahkan melalui service `lib/services/dokumen_service.dart` dan diintegrasikan dengan `form-interaksi.dart`.

Mahasiswa dapat memilih dokumen dari perangkat, melihat nama dokumen pada form, mengganti atau menghapus dokumen yang dipilih, serta melanjutkan proses pengajuan.

Nama dokumen diteruskan melalui field `dokumenPendukungNama` pada data pengajuan dan ditampilkan pada halaman Detail Pengajuan Surat apabila tersedia.

## 5. Permission dan Penanganan Kondisi

Pada platform Web yang diuji menggunakan Google Chrome, pemilihan dokumen dilakukan melalui dialog file picker yang disediakan browser dan sistem operasi, tanpa menggunakan permission kamera atau lokasi.

Kondisi yang ditangani meliputi:

- Pemilihan dokumen berhasil.
- Pemilihan dibatalkan.
- Penggantian dokumen.
- Penghapusan dokumen terpilih.
- Penanganan error pada proses pemilihan.

Apabila pemilihan dibatalkan, form tetap dapat digunakan dan dokumen sebelumnya tetap dipertahankan apabila ada.

## 6. Batasan Fitur

Implementasi saat ini berfokus pada pemilihan dokumen dan penyampaian informasi nama dokumen pada data pengajuan lokal. Dokumen belum diunggah ke server maupun disimpan secara permanen pada penyimpanan aplikasi.

Pengujian dilakukan menggunakan Flutter Web pada Google Chrome, sehingga mekanisme akses dokumen pada platform lain dapat memerlukan penyesuaian.